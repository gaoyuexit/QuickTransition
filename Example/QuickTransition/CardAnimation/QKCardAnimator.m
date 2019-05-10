//
//  QKCardAnimator.m
//  QuickTransition_Example
//
//  Created by apple on 2018/8/28.
//  Copyright © 2018年 gaoyu. All rights reserved.
//

#import "QKCardAnimator.h"


@interface QKCardAnimator()

@property (nonatomic, assign) CGAffineTransform scaleTransform;

@end

@implementation QKCardAnimator


- (NSTimeInterval)presentDuration {
    return 0.5;
}

- (NSTimeInterval)dismissDuration {
    return 0.5;
}

- (void)presentAnimationWithContext:(id<UIViewControllerContextTransitioning>)context presentingView:(UIView *)presentingView presentedView:(UIView *)presentedView {
    
    [self.sourceView setHidden:YES];
    self.scaleTransform = CGAffineTransformMakeScale([self sourceW] / presentedView.frame.size.width,
                                                     [self sourceH] / presentedView.frame.size.height);
    presentedView.center = CGPointMake(CGRectGetMidX(self.sourceFrame), CGRectGetMidY(self.sourceFrame));
    presentedView.transform = self.scaleTransform;
    presentedView.clipsToBounds = YES;

    [UIView animateWithDuration:self.presentDuration delay:0 usingSpringWithDamping:0.6 initialSpringVelocity:10.0 options: UIViewAnimationOptionOverrideInheritedCurve animations:^{
        presentedView.center = CGPointMake(UIScreen.mainScreen.bounds.size.width / 2, UIScreen.mainScreen.bounds.size.height / 2);
        presentedView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        [self.sourceView setHidden:!context.transitionWasCancelled];
        [context completeTransition:!context.transitionWasCancelled];
    }];
}

- (void)dismissAnimationWithContext:(id<UIViewControllerContextTransitioning>)context presentingView:(UIView *)presentingView presentedView:(UIView *)presentedView {
    
    [UIView animateWithDuration:self.dismissDuration delay:0 usingSpringWithDamping:0.6 initialSpringVelocity:10.0 options: UIViewAnimationOptionOverrideInheritedCurve animations:^{
        presentedView.transform = self.scaleTransform;
        presentedView.center = CGPointMake(CGRectGetMidX(self.sourceFrame), CGRectGetMidY(self.sourceFrame));
    } completion:^(BOOL finished) {
        [self.sourceView setHidden:context.transitionWasCancelled];
        [context completeTransition:!context.transitionWasCancelled];
    }];
}

- (CGFloat)sourceW {
    return self.sourceFrame.size.width;
}

- (CGFloat)sourceH {
    return self.sourceFrame.size.height;
}

- (CGRect)sourceFrame {
    return [self.sourceView.superview convertRect:self.sourceView.frame toView:nil];
}


@end
