//
//  QKShoppingViewController.m
//  QuickTransition_Example
//
//  Created by 宇郜 on 2020/1/16.
//  Copyright © 2020 gaoyu. All rights reserved.
//

#import "QKShoppingViewController.h"

@interface QKShoppingViewController () <QKPresentedViewZoneProtocol>
@property (nonatomic, strong) UIImageView *imageView;
@end

@implementation QKShoppingViewController

- (CGRect)presentedViewFrame {
    return CGRectMake(0, ScreenHeight-300, ScreenWidth, 300);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.imageView];
}

- (UIImageView *)imageView
{
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"shop"]];
        _imageView.frame = CGRectMake(0, 0, ScreenWidth, 300);
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _imageView;
}

@end
