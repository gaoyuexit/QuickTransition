//
//  QKSideViewController.m
//  QuickTransition_Example
//
//  Created by 宇郜 on 2020/1/15.
//  Copyright © 2020 gaoyu. All rights reserved.
//

#import "QKSideViewController.h"
static const CGFloat kSliderWidth = 286;

@interface QKSideViewController ()<QKPresentedViewZoneProtocol>

@end

@implementation QKSideViewController

+ (CGFloat)sliderWidth {
    return kSliderWidth;
}

- (CGRect)presentedViewFrame {
    return CGRectMake(ScreenWidth-kSliderWidth, 0, kSliderWidth, ScreenHeight);
}

#pragma mark - Life Cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    __weak typeof(self) weakSelf = self;
    
    void(^rowClick)(NSInteger line) = ^(NSInteger line) {
        NSLog(@"点击了第%zd行", line);
        [weakSelf dismissViewControllerAnimated:YES completion:nil];
    };
    
    NSMutableArray *rows = [NSMutableArray array];
    for (int i = 0; i < 10; i++) {
        QKTableRow *row = [QKTableRow rowTitle:[NSString stringWithFormat:@"index = %d", i] rowClick:rowClick];
        [rows addObject:row];
    }
    [self updateRows:rows.copy];
}

@end
