//
//  QKAlertAnimationShowController.m
//  QuickTransition_Example
//
//  Created by apple on 2018/8/28.
//  Copyright © 2018年 gaoyu. All rights reserved.
//

#import "QKAlertAnimationShowController.h"

@interface QKAlertAnimationShowController () <QKPresentedViewZoneProtocol>
@property (nonatomic, strong) UILabel *tipLabel;
@property (nonatomic, strong) UIButton *closeButton;
@property (nonatomic, strong) UILabel *discrpteLabel;
@end

@implementation QKAlertAnimationShowController

- (CGSize)presentedViewSize {
    return CGSizeMake(250, 180);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.view.layer.cornerRadius = 6.0;
    self.view.layer.shadowColor = [UIColor blackColor].CGColor;
    self.view.layer.shadowOffset = CGSizeZero;
    self.view.layer.shadowRadius = 2.0;
    self.view.layer.shadowOpacity = 1.0;
    
    [self.view addSubview:self.tipLabel];
    [self.view addSubview:self.closeButton];
    [self.view addSubview:self.discrpteLabel];
    
    [self.tipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.mas_equalTo(15);
    }];
    
    [self.closeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(@-15);
        make.centerY.equalTo(self.tipLabel);
    }];
    
    [self.discrpteLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.top.equalTo(self.tipLabel.mas_bottom).offset(15);
    }];
}

- (UILabel *)tipLabel {
    if(!_tipLabel) {
        _tipLabel = [[UILabel alloc] init];
        _tipLabel.text = @"提示";
        _tipLabel.font = [UIFont systemFontOfSize:16];
        _tipLabel.textColor = [UIColor blackColor];
    }
    return _tipLabel;
}

- (UILabel *)discrpteLabel {
    if(!_discrpteLabel) {
        _discrpteLabel = [[UILabel alloc] init];
        _discrpteLabel.text = @"在前端工程中，埋点和统计早在几年前就进入了无痕埋点时代，但是在实际工程中，我们还是觉得，常见的无痕埋点方案，写起来形式是简单了，但是从实现需求的角度并没有帮啥大忙。";
        _discrpteLabel.numberOfLines = 0;
        _discrpteLabel.textAlignment = NSTextAlignmentCenter;
        _discrpteLabel.textColor = [UIColor blackColor];
        _discrpteLabel.font = [UIFont systemFontOfSize:13];
    }
    return _discrpteLabel;
}

- (UIButton *)closeButton
{
    if (!_closeButton) {
        _closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_closeButton setImage:[UIImage imageNamed:@"icon_close"] forState:UIControlStateNormal];
        [_closeButton addTarget:self action:@selector(closeButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _closeButton;
}

- (void)closeButtonClick:(UIButton *)button
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
