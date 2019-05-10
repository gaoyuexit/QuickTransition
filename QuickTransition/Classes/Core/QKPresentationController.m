//
//  QKPresentationController.m
//  Pods-QuickTransition_Example
//
//  Created by apple on 2018/8/28.
//

#import "QKPresentationController.h"
#import "QKAnimator.h"

@interface QKPresentationController()

@property (nonatomic, strong) UIView *maskView;

@end


@implementation QKPresentationController

- (CGRect)frameOfPresentedViewInContainerView {
    
    if([self.presentedViewController conformsToProtocol:@protocol(QKPresentedViewZoneProtocol)]){
        
        if([self.presentedViewController respondsToSelector:@selector(presentedViewSize)]) {
            CGSize size = [((id<QKPresentedViewZoneProtocol>)(self.presentedViewController)) presentedViewSize];
            return CGRectMake((UIScreen.mainScreen.bounds.size.width - size.width) * 0.5, (UIScreen.mainScreen.bounds.size.height - size.height) * 0.5, size.width, size.height);
        }
        if([self.presentedViewController respondsToSelector:@selector(presentedViewFrame)]) {
            return [((id<QKPresentedViewZoneProtocol>)(self.presentedViewController)) presentedViewFrame];
        }
    }
    return [super frameOfPresentedViewInContainerView];
}

- (void)presentationTransitionWillBegin {
    self.presentedView.frame = [self frameOfPresentedViewInContainerView];
    [self.containerView addSubview:self.presentedView];
    if(!_maskView) {
        _maskView = self.animator.mask.maskView;
        _maskView.frame = UIScreen.mainScreen.bounds;
        _maskView.alpha = 0;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(close:)];
        [_maskView addGestureRecognizer:tap];
    }
}

- (void)containerViewWillLayoutSubviews {
    [super containerViewWillLayoutSubviews];
    if(_maskView) {
        [self.containerView insertSubview:_maskView atIndex:0];
        [UIView animateWithDuration:self.animator.presentDuration animations:^{
            self.maskView.alpha = self.animator.mask.alpha;
        }];
    }
}

- (void)presentationTransitionDidEnd:(BOOL)completed {
    
}

- (void)dismissalTransitionWillBegin {
    if(_maskView) {
        [UIView animateWithDuration:self.animator.dismissDuration animations:^{
            self.maskView.alpha = 0;
        }];
    }
}

- (void)dismissalTransitionDidEnd:(BOOL)completed {
    
}

#pragma mark --- Event
- (void)close:(UITapGestureRecognizer *)tap {
    if(!self.animator.tapMaskDissmiss) { return; }
    [self.presentedViewController dismissViewControllerAnimated:YES completion:nil];
}

@end
