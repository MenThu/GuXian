//
//  BaseTableViewController.h
//  GuXian
//
//  Created by menthu on 2020/5/3.
//  Copyright © 2020 menthu. All rights reserved.
//

#import "BaseController.h"
#import "MJRefresh.h"
#import "UITableView+PlaceHoldView.h"
#import "BaseCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaseTableViewController : BaseController <UITableViewDelegate, UITableViewDataSource>

/// 点击了空数据提示图，父类会调用网络请求方法
- (void)tapNoDataHintView;

/// 下拉了tableViewHead
- (void)dragTableViewHead;

/// 上拉了tableViewFoot
/// @param currentPageNo 当前页数
/// @param nextPageNo 下一页数
- (void)dragTableViewFoot:(NSInteger)currentPageNo nextPageNo:(NSInteger)nextPageNo;

/// 列表视图
@property (nonatomic, weak, readonly) UITableView *tableView;

@property (nonatomic, strong) __kindof BaseCell *cellForHeight;

@end

NS_ASSUME_NONNULL_END
