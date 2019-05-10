//
//  QKPresentationController.h
//  Pods-QuickTransition_Example
//
//  Created by apple on 2018/8/28.
//

#import <UIKit/UIKit.h>

@class QKAnimator;
@interface QKPresentationController : UIPresentationController

@property (nonatomic, weak) QKAnimator *animator;

@end
