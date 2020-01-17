//
//  QKShopAnimator.m
//  QuickTransition_Example
//
//  Created by 宇郜 on 2020/1/16.
//  Copyright © 2020 gaoyu. All rights reserved.
//

#import "QKShopAnimator.h"

@implementation QKShopAnimator

- (NSTimeInterval)presentDuration { return 0.3; }
- (NSTimeInterval)dismissDuration { return 0.3; }

- (void)presentAnimationWithContext:(id<UIViewControllerContextTransitioning>)context presentingView:(UIView *)presentingView presentedView:(UIView *)presentedView
{
    CGRect frame = presentedView.frame;
    frame.origin.y = ScreenHeight;
    presentedView.frame = frame;
    
    [UIView animateWithDuration:[self presentDuration] * 0.5 animations:^{
        presentingView.layer.transform = [self firstTransform];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:[self presentDuration] * 0.5 animations:^{
            presentingView.layer.transform = [self secondTransform];
            presentedView.transform = CGAffineTransformMakeTranslation(0, -presentedView.height);
        } completion:^(BOOL finished) {
            [context completeTransition:finished];
        }];
    }];
}

- (void)dismissAnimationWithContext:(id<UIViewControllerContextTransitioning>)context presentingView:(UIView *)presentingView presentedView:(UIView *)presentedView
{
    [UIView animateWithDuration:[self dismissDuration] * 0.5 animations:^{
        presentedView.transform = CGAffineTransformIdentity;
        presentingView.layer.transform = [self firstTransform];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:[self dismissDuration] * 0.5 animations:^{
            presentingView.layer.transform = CATransform3DIdentity;
        } completion:^(BOOL finished) {
            [context completeTransition:finished];
        }];
    }];
}

- (CATransform3D)firstTransform {
    CATransform3D form = CATransform3DIdentity;
    form.m34 = 1.0 / -900;
    form = CATransform3DScale(form, 0.9, 0.9, 1);
    form = CATransform3DRotate(form, 15.0 * M_PI / 180.0, 1, 0, 0);
    form = CATransform3DTranslate(form, 0, 0, -100.0);
    return form;
}

- (CATransform3D)secondTransform {
    CATransform3D form = CATransform3DIdentity;
    form.m34 = [self firstTransform].m34;
    form = CATransform3DTranslate(form, 0, -20, 0);
    form = CATransform3DScale(form, 0.9, 0.9, 1);
    return form;
}


@end
