//
//  QuickAnimator.h
//  QuickTransition
//
//  Created by apple on 2018/8/28.
//

#import <Foundation/Foundation.h>
#import "QKBackgroundMask.h"

typedef NS_ENUM(NSInteger, QKAnimatorStatus) {
    QKAnimatorStatusPresent,
    QKAnimatorStatusDismiss
};

@protocol QKPresentedViewZoneProtocol
@optional
- (CGSize)presentedViewSize;
- (CGRect)presentedViewFrame;
@end


@interface QKAnimator : NSObject <UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning, UINavigationControllerDelegate>

@property (nonatomic, assign, readonly) QKAnimatorStatus animatorStatus;
@property (nonatomic, weak, readonly) UIViewController *sourceViewController;
@property (nonatomic, weak, readonly) UIViewController *presentedViewController;

@property (nonatomic, strong) id<QKBackgroundMaskProtocol>mask; // maskView
@property (nonatomic, assign) BOOL tapMaskDissmiss;
@property (nonatomic, assign) NSTimeInterval presentDuration; //default 0.25 s
@property (nonatomic, assign) NSTimeInterval dismissDuration; //default 0.25 s

@property (nonatomic, assign) BOOL openInteractive;  //default NO
@property (nonatomic, strong, readonly) UIPercentDrivenInteractiveTransition *driven;


@end
