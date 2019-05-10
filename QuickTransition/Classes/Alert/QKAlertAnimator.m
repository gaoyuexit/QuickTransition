//
//  QKAlertAnimator.m
//  QuickTransition_Example
//
//  Created by apple on 2018/8/28.
//  Copyright © 2018年 gaoyu. All rights reserved.
//

#import "QKAlertAnimator.h"
#import "QKAnimation.h"
#import "QKAnimationType.h"

@implementation QKAlertAnimator


- (instancetype)init {
    if(self = [super init]) {
        _start = QKAnimation.qk.alpha(0).transition(0, 500);
    }
    return self;
}

- (void)presentAnimationWithContext:(id<UIViewControllerContextTransitioning>)context presentingView:(UIView *)presentingView presentedView:(UIView *)presentedView {
    [self updatePesentedView:presentedView animation:self.start];
    [UIView animateWithDuration:self.presentDuration animations:^{
        presentedView.transform = CGAffineTransformIdentity;
        presentedView.alpha = 1;
        if(self.presentingChange) { [self updatePesentedView:presentingView animation:self.presentingChange]; }
    } completion:^(BOOL finished) {
        [context completeTransition:!context.transitionWasCancelled];
    }];
}

- (void)dismissAnimationWithContext:(id<UIViewControllerContextTransitioning>)context presentingView:(UIView *)presentingView presentedView:(UIView *)presentedView {
    [UIView animateWithDuration:self.dismissDuration animations:^{
        presentingView.transform = CGAffineTransformIdentity;
        presentingView.alpha = 1;
        [self updatePesentedView:presentedView animation:self.end ?: self.start];
    } completion:^(BOOL finished) {
        [context completeTransition:!context.transitionWasCancelled];
    }];
}

- (void)updatePesentedView:(UIView *)view animation:(QKAnimation *)animation{
    for(id tran in animation.transions) {
        if([tran isKindOfClass:[QKAnimationAlphaForm class]]){ //CGFloat alpha
            view.alpha = ((QKAnimationAlphaForm *)tran).alpha;
        }
        if([tran isKindOfClass:[QKAnimationTransform class]]) { //transitons
            view.transform = CGAffineTransformConcat(view.transform, ((QKAnimationTransform *)tran).form);
        }
    }
}


@end
