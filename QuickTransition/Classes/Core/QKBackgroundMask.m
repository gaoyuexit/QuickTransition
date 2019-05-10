//
//  QKMask.m
//  QuickTransition
//
//  Created by apple on 2018/8/28.
//

#import "QKBackgroundMask.h"

@implementation QKColorMask
@synthesize maskView = _maskView, alpha = _alpha;

+ (instancetype)maskWithColor:(UIColor *)color alpha:(CGFloat)alpha {
    QKColorMask *mask = [[self alloc] init];
    UIView *maskView = [[UIView alloc] init];
    maskView.backgroundColor = color;
    maskView.alpha = alpha;
    mask.maskView = maskView;
    mask.alpha = alpha;
    return mask;
}

@end


@implementation QKBlurEffectMask
@synthesize maskView = _maskView, alpha = _alpha;

+ (instancetype)maskWithBlurEffect:(UIBlurEffectStyle)style alpha:(CGFloat)alpha {
    QKBlurEffectMask *mask = [[self alloc] init];
    UIVisualEffectView *maskView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:style]];
    maskView.alpha = alpha;
    mask.maskView = maskView;
    mask.alpha = alpha;
    return mask;
}

@end
