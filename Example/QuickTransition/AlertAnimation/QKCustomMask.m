//
//  QKCustomMaskView.m
//  QuickTransition_Example
//
//  Created by 宇郜 on 2020/1/17.
//  Copyright © 2020 gaoyu. All rights reserved.
//

#import "QKCustomMask.h"

@implementation QKCustomMask
@synthesize maskView = _maskView, alpha = _alpha;

- (instancetype)init {
    if (self = [super init]) {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"nice"]];
        self.maskView = imageView;
        self.alpha = 1.0;
    }
    return self;
}

@end
