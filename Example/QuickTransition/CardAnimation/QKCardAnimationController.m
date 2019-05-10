//
//  QKCardAnimationController.m
//  QuickTransition_Example
//
//  Created by apple on 2018/8/28.
//  Copyright © 2018年 gaoyu. All rights reserved.
//

#import "QKCardAnimationController.h"
#import "QKCardAnimationNextController.h"
#import "QKCardAnimator.h"

@interface QKCardAnimationController ()
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) QKCardAnimator *carAnimator;
@end

@implementation QKCardAnimationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.imageView];
    
    self.carAnimator = [[QKCardAnimator alloc] init];
    self.carAnimator.sourceView = self.imageView;
    self.carAnimator.openInteractive = YES;
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panGes:)];
    [self.view addGestureRecognizer:pan];
}


#pragma mark ---- event
- (void)tapImage:(UITapGestureRecognizer *)tap {
    QKCardAnimationNextController *vc = [[QKCardAnimationNextController alloc] init];
    vc.showImage = self.imageView.image;
    vc.qk_animator = self.carAnimator;
    [self presentViewController:vc animated:YES completion:nil];
    //[self.navigationController pushViewController:vc animated:YES];
}

-(void)panGes:(UIPanGestureRecognizer *)recognizer{
    CGFloat progress = [recognizer translationInView:self.view].x / (self.view.bounds.size.width * 1.0);
    progress = MIN(1.0, MAX(0.0, progress));
    if (recognizer.state == UIGestureRecognizerStateBegan) {
        [self tapImage:nil];
    }else if (recognizer.state == UIGestureRecognizerStateChanged){
        [self.carAnimator.driven updateInteractiveTransition:progress];
    }else if (recognizer.state == UIGestureRecognizerStateCancelled || recognizer.state == UIGestureRecognizerStateEnded){
        if (progress > 0.25) {
            [self.carAnimator.driven finishInteractiveTransition];
        }else{
            [self.carAnimator.driven cancelInteractiveTransition];
        }
    }
}


#pragma mark ---- setter & getter
- (UIImageView *)imageView {
    if(!_imageView) {
        _imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"wiggles"]];
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
        _imageView.clipsToBounds = YES;
        _imageView.userInteractionEnabled = YES;
        CGFloat aspectRatio = UIScreen.mainScreen.bounds.size.width / UIScreen.mainScreen.bounds.size.height;
        CGFloat h = 200;
        CGFloat w = h * aspectRatio;
        _imageView.frame = CGRectMake(50, 150, w, h);
//        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapImage:)];
//        [_imageView addGestureRecognizer:tap];
    }
    return _imageView;
}



- (void)dealloc {
    NSLog(@"----- %@ dealloc ------", self);
}







@end
