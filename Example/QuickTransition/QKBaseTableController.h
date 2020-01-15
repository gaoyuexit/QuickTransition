//
//  QKBaseTableController.h
//  QuickTransition_Example
//
//  Created by 宇郜 on 2020/1/13.
//  Copyright © 2020 gaoyu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^RowClick)(NSInteger line);

@interface QKTableRow : NSObject
@property (nonatomic, copy) NSString *rowTitle;
@property (nonatomic, copy) RowClick rowClick;

+ (instancetype)rowTitle:(NSString *)rowTitle rowClick:(RowClick)rowClick;

@end


@interface QKBaseTableController : UITableViewController

- (void)updateRows:(NSArray<QKTableRow *> *)rows;

@end

NS_ASSUME_NONNULL_END
