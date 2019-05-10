//
//  QKCardAnimationNextController.m
//  QuickTransition_Example
//
//  Created by apple on 2018/8/28.
//  Copyright © 2018年 gaoyu. All rights reserved.
//

#import "QKCardAnimationNextController.h"

@interface QKCardAnimationNextController ()
@property (nonatomic, strong) UIImageView *imageView;
@end

@implementation QKCardAnimationNextController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:self.imageView];
    
    UIScreenEdgePanGestureRecognizer *edgePanGestureRecognizer = [[UIScreenEdgePanGestureRecognizer alloc]initWithTarget:self action:@selector(edgePanGesture:)];
    edgePanGestureRecognizer.edges = UIRectEdgeLeft;
    [self.view addGestureRecognizer:edgePanGestureRecognizer];
}


-(void)edgePanGesture:(UIScreenEdgePanGestureRecognizer *)recognizer{
    CGFloat progress = [recognizer translationInView:self.view.superview].x / (self.view.superview.bounds.size.width * 1.0);
    progress = MIN(1.0, MAX(0.0, progress));
    if (recognizer.state == UIGestureRecognizerStateBegan) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }else if (recognizer.state == UIGestureRecognizerStateChanged){
        [self.qk_animator.driven updateInteractiveTransition:progress];
    }else if (recognizer.state == UIGestureRecognizerStateCancelled || recognizer.state == UIGestureRecognizerStateEnded){
        if (progress > 0.25) {
            [self.qk_animator.driven finishInteractiveTransition];
        }else{
            [self.qk_animator.driven cancelInteractiveTransition];
        }
    }
}

#pragma mark ---- setter & getter
- (UIImageView *)imageView {
    if(!_imageView) {
        _imageView = [[UIImageView alloc] initWithImage:self.showImage];
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
        _imageView.clipsToBounds = YES;
        _imageView.frame = self.view.bounds;
    }
    return _imageView;
}


- (void)dealloc {
    NSLog(@"----- %@ dealloc ------", self);
}

@end
