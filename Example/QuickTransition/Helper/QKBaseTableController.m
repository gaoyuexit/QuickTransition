//
//  QKBaseTableController.m
//  QuickTransition_Example
//
//  Created by 宇郜 on 2020/1/13.
//  Copyright © 2020 gaoyu. All rights reserved.
//

#import "QKBaseTableController.h"

@implementation QKTableRow
+ (instancetype)rowTitle:(NSString *)rowTitle rowClick:(RowClick)rowClick
{
    QKTableRow *row = [[self alloc] init];
    row.rowTitle = rowTitle;
    row.rowClick = rowClick;
    return row;
}
@end


@interface QKBaseTableController ()
@property (nonatomic, copy) NSArray<QKTableRow *> *rows;
@end

@implementation QKBaseTableController

- (void)updateRows:(NSArray<QKTableRow *> *)rows
{
    _rows = rows;
    [self.tableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.tableView.tableFooterView = [UIView new];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:UITableViewCell.description];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.rows.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:UITableViewCell.description forIndexPath:indexPath];
    cell.textLabel.text = self.rows[indexPath.row].rowTitle;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.rows[indexPath.row].rowClick(indexPath.row);
}

@end
