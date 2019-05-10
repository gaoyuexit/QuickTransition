//
//  QKAnimation.m
//  QuickTransition_Example
//
//  Created by apple on 2018/8/29.
//  Copyright © 2018年 gaoyu. All rights reserved.
//

#import "QKAnimation.h"
#import "QKAnimationType.h"

@implementation QKAnimation

+ (instancetype)qk { return [[self alloc] init]; }

- (instancetype)init {
    if (self = [super init]){
        _transions = [NSMutableArray array];
    }
    return self;
}

- (QKCGFloat)alpha {
    return ^(CGFloat alpha){
        QKAnimationAlphaForm *tran = [QKAnimationAlphaForm new];
        tran.alpha = alpha;
        [self.transions addObject:tran];
        return self;
    };
}

- (QKTranslate)transition {
    return ^(CGFloat x, CGFloat y){
        QKAnimationTransform *tran = [QKAnimationTransform new];
        tran.form = CGAffineTransformMakeTranslation(x, y);
        [self.transions addObject:tran];
        return self;
    };
}

- (QKScale)scale {
    return ^(CGFloat scale){
        QKAnimationTransform *tran = [QKAnimationTransform new];
        tran.form = CGAffineTransformMakeScale(scale, scale);
        [self.transions addObject:tran];
        return self;
    };
}

- (QKRotation)angle {
    return ^(CGFloat angle){
        QKAnimationTransform *tran = [QKAnimationTransform new];
        tran.form = CGAffineTransformMakeRotation(angle);
        [self.transions addObject:tran];
        return self;
    };
}

@end
