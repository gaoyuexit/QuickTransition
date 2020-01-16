//
//  QKAutoLayoutAlertController.m
//  QuickTransition_Example
//
//  Created by 宇郜 on 2020/1/15.
//  Copyright © 2020 gaoyu. All rights reserved.
//

#import "QKAutoLayoutAlertController.h"

@interface QKAutoLayoutAlertController () <QKPresentedViewZoneProtocol>
@property (nonatomic, strong) UILabel *tipsLabel;
@property (nonatomic, strong) UILabel *contentLabel;
@end

@implementation QKAutoLayoutAlertController

#pragma mark - Life Cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.tipsLabel];
    [self.view addSubview:self.contentLabel];
    
    [self.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@250);
    }];
    
    [self.tipsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@10);
        make.centerX.equalTo(self.view);
    }];
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@10);
        make.right.bottom.equalTo(@-10);
        make.top.equalTo(self.tipsLabel.mas_bottom).offset(10);
    }];
}

- (UILabel *)tipsLabel {
    if (!_tipsLabel) {
        _tipsLabel = [[UILabel alloc] init];
        _tipsLabel.font = [UIFont systemFontOfSize:14];
        _tipsLabel.numberOfLines = 1;
        _tipsLabel.text = @"提示";
    }
    return _tipsLabel;
}

- (UILabel *)contentLabel {
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.font = [UIFont systemFontOfSize:10];
        _contentLabel.numberOfLines = 0;
        _contentLabel.text = @"全球首个用细胞做成的活体机器人，已经诞生了。不是设想，不是科幻，是实实在在登上顶级期刊的科学研究。而且不用金属、塑料打造，采用青蛙表皮细胞和心脏细胞重组。这就是顶级期刊《美国科学院院报》(PNAS)最新发表的惊人研究，来自美国佛蒙特大学和塔弗茨大学团队。这些机器人，被命名为Xenobots。研究者认为，其在水性介质中行动的特性，展示了未来无限的可能性：清理海洋中的微塑料污染，作为可生物降解的药物输送机器人等, 最新发表的惊人研究，来自美国佛蒙特大学和塔弗茨大学团队。这些机器人，被命名为Xenobots。研究者认为，其在水性介质中行动的特性，展示了未来无限的可能性：清理海洋中的微塑料污染，作为可生物降解的药物输送机器人等,最新发表的惊人研究，来自美国佛蒙特大学和塔弗茨大学团队。这些机器人，被命名为Xenobots。研究者认为，其在水性介质中行动的特性，展示了未来无限的可能性：清理海洋中的微塑料污染，作为可生物降解的药物输送机器人等";
    }
    return _contentLabel;
}


@end
