//
//  QKAlertAnimationController.m
//  QuickTransition_Example
//
//  Created by apple on 2018/8/28.
//  Copyright © 2018年 gaoyu. All rights reserved.
//

#import "QKAlertAnimationController.h"
#import "QKAlertAnimationShowController.h"
#import "QKSideViewController.h"
#import "QKAutoLayoutAlertController.h"
#import "QKCustomMask.h"

@interface QKAlertAnimationController ()

@end

@implementation QKAlertAnimationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    __weak typeof(self) weakSelf = self;
    [self updateRows:@[
        
        [QKTableRow rowTitle:@"alpha + noTapDissmiss" rowClick:^(NSInteger line) {
            [weakSelf pushAlertVCWithAnimator:^(QKAlertAnimator *animator) {
                animator.start = QKAnimation.qk.alpha(0);
                animator.tapMaskDissmiss = NO;
            }];
        }],
        
        [QKTableRow rowTitle:@"alpha + tapDissmiss" rowClick:^(NSInteger line) {
            [weakSelf pushAlertVCWithAnimator:^(QKAlertAnimator *animator) {
                animator.start = QKAnimation.qk.alpha(0);
            }];
        }],
        
        [QKTableRow rowTitle:@"alpha + tapDissmiss + customBgColor" rowClick:^(NSInteger line) {
            [weakSelf pushAlertVCWithAnimator:^(QKAlertAnimator *animator) {
                animator.start = QKAnimation.qk.alpha(0);
                animator.mask = [QKColorMask maskWithColor:[UIColor orangeColor] alpha:1.0];
            }];
        }],
        
        [QKTableRow rowTitle:@"alpha + tapDissmiss + custombgView" rowClick:^(NSInteger line) {
            [weakSelf pushAlertVCWithAnimator:^(QKAlertAnimator *animator) {
                animator.start = QKAnimation.qk.alpha(0);
                animator.mask = [[QKCustomMask alloc] init];
            }];
        }],
        
        [QKTableRow rowTitle:@"alpha + tapDissmiss + BlurEffectMask" rowClick:^(NSInteger line) {
            [weakSelf pushAlertVCWithAnimator:^(QKAlertAnimator *animator) {
                animator.start = QKAnimation.qk.alpha(0);
                animator.mask = [QKBlurEffectMask maskWithBlurEffect:UIBlurEffectStyleExtraLight alpha:0.5];
            }];
        }],
        
        [QKTableRow rowTitle:@"alpha + angle + tapDissmiss + BlurEffectMask" rowClick:^(NSInteger line) {
            [weakSelf pushAlertVCWithAnimator:^(QKAlertAnimator *animator) {
                animator.start = QKAnimation.qk.alpha(0).angle(360);
                animator.mask = [QKBlurEffectMask maskWithBlurEffect:UIBlurEffectStyleExtraLight alpha:0.5];
            }];
        }],
        
        [QKTableRow rowTitle:@"alpha + angle + scale + tapDissmiss + BlurEffectMask" rowClick:^(NSInteger line) {
            [weakSelf pushAlertVCWithAnimator:^(QKAlertAnimator *animator) {
                animator.start = QKAnimation.qk.alpha(0).angle(360);
                animator.end = QKAnimation.qk.scale(0.3);
                animator.mask = [QKBlurEffectMask maskWithBlurEffect:UIBlurEffectStyleExtraLight alpha:0.5];
            }];
        }],
        
        [QKTableRow rowTitle:@"transtion + tapDissmiss + transition +  BlurEffectMask" rowClick:^(NSInteger line) {
            [weakSelf pushAlertVCWithAnimator:^(QKAlertAnimator *animator) {
                animator.start = QKAnimation.qk.transition(0,-400);
                animator.end = QKAnimation.qk.transition(0,400);
                animator.mask = [QKBlurEffectMask maskWithBlurEffect:UIBlurEffectStyleExtraLight alpha:0.7];
            }];
        }],
        
        [QKTableRow rowTitle:@"transtion + tapDissmiss + transition + angle" rowClick:^(NSInteger line) {
            [weakSelf pushAlertVCWithAnimator:^(QKAlertAnimator *animator) {
                animator.start = QKAnimation.qk.transition(300,-400).angle(360);
                animator.end = QKAnimation.qk.transition(-300,400);
                animator.mask = [QKBlurEffectMask maskWithBlurEffect:UIBlurEffectStyleExtraLight alpha:0.7];
            }];
        }],
        
        [QKTableRow rowTitle:@"transtion + tapDissmiss + presentingChange" rowClick:^(NSInteger line) {
            [weakSelf pushAlertVCWithAnimator:^(QKAlertAnimator *animator) {
                animator.start = QKAnimation.qk.transition(300,-400).angle(360);
                animator.end = QKAnimation.qk.transition(-300,400);
                animator.presentingChange = QKAnimation.qk.scale(0.7).angle(45);
                animator.mask = [QKBlurEffectMask maskWithBlurEffect:UIBlurEffectStyleExtraLight alpha:0.7];
            }];
        }],
        
        [QKTableRow rowTitle:@"left - slideVC - presentedViewFrame" rowClick:^(NSInteger line) {
            [weakSelf pushSlideVCWithAnimator:^(QKAlertAnimator *animator) {
                animator.start = QKAnimation.qk.transition([QKSideViewController sliderWidth], 0);
            }];
        }],
        
        [QKTableRow rowTitle:@"left - slideVC - presentedViewFrame - presentingChange" rowClick:^(NSInteger line) {
            [weakSelf pushSlideVCWithAnimator:^(QKAlertAnimator *animator) {
                animator.start = QKAnimation.qk.transition([QKSideViewController sliderWidth], 0);
                animator.presentingChange = QKAnimation.qk.scale(0.95);
            }];
        }],
        
        [QKTableRow rowTitle:@"autoLayout alert" rowClick:^(NSInteger line) {
            [weakSelf pushAutoLayoutAlertVC];
        }]
    ]];
}

- (void)pushAlertVCWithAnimator:(void(^)(QKAlertAnimator *animator))animatorBlock
{
    QKAlertAnimationShowController *vc = [[QKAlertAnimationShowController alloc] init];
    QKAlertAnimator *animator = [[QKAlertAnimator alloc] init];
    animatorBlock(animator);
    vc.qk_animator = animator;
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)pushSlideVCWithAnimator:(void(^)(QKAlertAnimator *animator))animatorBlock
{
    QKSideViewController *vc = [[QKSideViewController alloc] init];
    QKAlertAnimator *animator = [[QKAlertAnimator alloc] init];
    animatorBlock(animator);
    vc.qk_animator = animator;
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)pushAutoLayoutAlertVC {
    QKAutoLayoutAlertController *vc = [[QKAutoLayoutAlertController alloc] init];
    QKAlertAnimator *animator = [[QKAlertAnimator alloc] init];
    vc.qk_animator = animator;
    [self presentViewController:vc animated:YES completion:nil];
}


@end
