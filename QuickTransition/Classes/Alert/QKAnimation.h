//
//  QKAnimation.h
//  QuickTransition_Example
//
//  Created by apple on 2018/8/29.
//  Copyright © 2018年 gaoyu. All rights reserved.
//

#import <Foundation/Foundation.h>
@class QKAnimation;

typedef QKAnimation* (^QKCGFloat)(CGFloat alpah);
typedef QKAnimation* (^QKTranslate)(CGFloat x, CGFloat y);
typedef QKAnimation* (^QKScale)(CGFloat scale);
typedef QKAnimation* (^QKRotation)(CGFloat angle);

@interface QKAnimation : NSObject

+ (instancetype)qk;

@property (nonatomic, strong) NSMutableArray *transions;
@property (nonatomic, copy) QKCGFloat alpha;
@property (nonatomic, copy) QKTranslate transition;
@property (nonatomic, copy) QKScale scale;
@property (nonatomic, copy) QKRotation angle;


@end
