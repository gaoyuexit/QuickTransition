//
//  QKAlertAnimationNextController.m
//  QuickTransition_Example
//
//  Created by apple on 2018/8/28.
//  Copyright © 2018年 gaoyu. All rights reserved.
//

#import "QKAlertAnimationNextController.h"

@interface QKAlertAnimationNextController () <QKPresentedViewZoneProtocol>

@property (nonatomic, strong) UILabel *tipLabel;
@property (nonatomic, strong) UILabel *discrpteLabel;

@end

@implementation QKAlertAnimationNextController


- (CGSize)presentedViewSize {
    return CGSizeMake(200, 200);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tipLabel];
    [self.view addSubview:self.discrpteLabel];
    
    [self.tipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.mas_equalTo(15);
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



- (void)dealloc {
    NSLog(@"----- %@ dealloc ------", self);
}


@end
