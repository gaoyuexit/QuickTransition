//
//  QKAlertAnimator.h
//  QuickTransition_Example
//
//  Created by apple on 2018/8/28.
//  Copyright © 2018年 gaoyu. All rights reserved.
//

#import "QKAnimator.h"
@class QKAnimation;

@interface QKAlertAnimator : QKAnimator
/** Alert start transions*/
@property(nonatomic, strong) QKAnimation *start;
/** Alert end transions*/
@property(nonatomic, strong) QKAnimation *end;

/** presenting view transion change*/
@property(nonatomic, strong) QKAnimation *presentingChange;

@end
