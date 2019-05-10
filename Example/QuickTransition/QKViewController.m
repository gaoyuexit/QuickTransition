//
//  QKViewController.m
//  QuickTransition
//
//  Created by gaoyu on 08/28/2018.
//  Copyright (c) 2018 gaoyu. All rights reserved.
//

#import "QKViewController.h"

@interface QKViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, copy) NSArray<NSDictionary *> *dataSource;

@end

@implementation QKViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"QuickTransition";
    [self.view addSubview:self.tableView];
}

#pragma mark --- UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIViewController *vc = [[NSClassFromString(self.dataSource[indexPath.row][@"vc"]) alloc] init];
    vc.title = self.dataSource[indexPath.row][@"title"];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark --- UITableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = self.dataSource[indexPath.row][@"title"];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

#pragma mark --- setter & getter
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
        _tableView.tableFooterView = [[UIView alloc]init];
    }
    return _tableView;
}

- (NSArray *)dataSource {
    if (!_dataSource) {
        _dataSource = @[
                        @{@"title": @"CardAnimation", @"vc": @"QKCardAnimationController"},
                        @{@"title": @"AlertAnimation", @"vc": @"QKAlertAnimationController"},
                        ];
    }
    return _dataSource;
}


@end
