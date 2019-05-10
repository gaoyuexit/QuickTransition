//
//  QKAlertAnimationController.m
//  QuickTransition_Example
//
//  Created by apple on 2018/8/28.
//  Copyright © 2018年 gaoyu. All rights reserved.
//

#import "QKAlertAnimationController.h"
#import "QKAlertAnimationNextController.h"

@interface QKAlertAnimationController ()

@end

@implementation QKAlertAnimationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    QKAlertAnimationNextController *vc = [[QKAlertAnimationNextController alloc] init];
    QKAlertAnimator *alert = [[QKAlertAnimator alloc] init];
    alert.start = QKAnimation.qk.alpha(0).angle(100);
    alert.end = QKAnimation.qk.transition(-300, -300);
    //alert.tapMaskDissmiss = NO;
    alert.mask = [QKBlurEffectMask maskWithBlurEffect:UIBlurEffectStyleExtraLight alpha:0.5];
//    alert.presentingChange = QKAnimation.qk.scale(0.8);
    vc.qk_animator = alert;
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)dealloc {
    NSLog(@"----- %@ dealloc ------", self);
}

@end
