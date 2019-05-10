//
//  QKMask.h
//  QuickTransition
//
//  Created by apple on 2018/8/28.
//

#import <UIKit/UIKit.h>

@protocol QKBackgroundMaskProtocol <NSObject>

@property(nonatomic, strong) UIView *maskView;
@property(nonatomic, assign) CGFloat alpha;

@end

@interface QKColorMask : NSObject <QKBackgroundMaskProtocol>

+ (instancetype)maskWithColor:(UIColor *)color alpha:(CGFloat)alpha;

@end

@interface QKBlurEffectMask : NSObject <QKBackgroundMaskProtocol>

+ (instancetype)maskWithBlurEffect:(UIBlurEffectStyle)style alpha:(CGFloat)alpha;

@end
