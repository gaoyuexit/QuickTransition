//
//  QKCustomAnimationController.m
//  QuickTransition_Example
//
//  Created by 宇郜 on 2020/1/16.
//  Copyright © 2020 gaoyu. All rights reserved.
//

#import "QKCustomAnimationController.h"
#import "QKShoppingViewController.h"
#import "QKShopAnimator.h"

@interface QKCustomAnimationController ()

@end

@implementation QKCustomAnimationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    __weak typeof(self) weakSelf = self;
    [self updateRows:@[
        [QKTableRow rowTitle:@"ShopAnimation" rowClick:^(NSInteger line) {
            [weakSelf showShop];
        }]
    ]];
}

- (void)showShop {
    QKShoppingViewController *vc = [[QKShoppingViewController alloc] init];
    vc.qk_animator = [[QKShopAnimator alloc] init];
    [self presentViewController:vc animated:YES completion:nil];
}

@end
