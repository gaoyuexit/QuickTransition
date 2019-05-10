//
//  QuickAnimator.m
//  QuickTransition
//
//  Created by apple on 2018/8/28.
//

#import "QKAnimator.h"
#import "QKPresentationController.h"


static const NSTimeInterval defaultDuration = 0.25;

@interface QKAnimator()

@property (nonatomic, assign) BOOL push;

@end


@implementation QKAnimator


- (instancetype)init {
    if(self = [super init]) {
        _mask = [QKColorMask maskWithColor:[UIColor blackColor] alpha:0.7];
        _tapMaskDissmiss = YES;
        _presentDuration = defaultDuration;
        _dismissDuration = defaultDuration;
        _openInteractive = NO;
        _driven = [[UIPercentDrivenInteractiveTransition alloc] init];
    }
    return self;
}


#pragma mark --- UIViewControllerTransitioningDelegate
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    _sourceViewController = source;
    _presentedViewController = presented;
    _animatorStatus = QKAnimatorStatusPresent;
    return self;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    _animatorStatus = QKAnimatorStatusDismiss;
    return self;
}

- (nullable UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(nullable UIViewController *)presenting sourceViewController:(UIViewController *)source {
    QKPresentationController *presentationController = [[QKPresentationController alloc] initWithPresentedViewController:presented presentingViewController:presenting];
    presentationController.animator = self;
    return presentationController;
}

- (nullable id <UIViewControllerInteractiveTransitioning>)interactionControllerForPresentation:(id <UIViewControllerAnimatedTransitioning>)animator {
    return _openInteractive ? _driven : nil;
}

- (nullable id <UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id <UIViewControllerAnimatedTransitioning>)animator {
    return _openInteractive ? _driven : nil;
}

#pragma mark --- UINavigationControllerDelegate
#warning mark ---- TODO
- (nullable id <UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController
                                   interactionControllerForAnimationController:(id <UIViewControllerAnimatedTransitioning>) animationController{
    return _openInteractive ? _driven : nil;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC{
    _sourceViewController = fromVC;
    _presentedViewController = toVC;
    _animatorStatus = (operation == UINavigationControllerOperationPush) ? QKAnimatorStatusPresent : QKAnimatorStatusDismiss;
    return self;
}


#pragma mark --- UIViewControllerAnimatedTransitioning
- (void)animateTransition:(nonnull id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC   = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    if(self.animatorStatus == QKAnimatorStatusPresent) {
        [self presentAnimationWithContext:transitionContext presentingView: fromVC.view presentedView:toVC.view];
    }else{
        [self dismissAnimationWithContext:transitionContext presentingView: toVC.view presentedView:fromVC.view];
    }
}

- (NSTimeInterval)transitionDuration:(nullable id<UIViewControllerContextTransitioning>)transitionContext {
    return self.animatorStatus == QKAnimatorStatusPresent ? self.presentDuration : self.dismissDuration;
}


#pragma mark --- 子类重写

- (void)presentAnimationWithContext:(id<UIViewControllerContextTransitioning>)context presentingView:(UIView *)presentingView presentedView:(UIView *)presentedView {}

- (void)dismissAnimationWithContext:(id<UIViewControllerContextTransitioning>)context presentingView:(UIView *)presentingView presentedView:(UIView *)presentedView {}












@end
