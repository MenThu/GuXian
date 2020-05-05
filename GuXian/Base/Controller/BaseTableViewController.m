//
//  BaseTableViewController.m
//  GuXian
//
//  Created by menthu on 2020/5/3.
//  Copyright © 2020 menthu. All rights reserved.
//

#import "BaseTableViewController.h"
#import "CommonHead.h"
#import <Masonry.h>

@interface BaseTableViewController ()

@property (nonatomic, weak, readwrite) UITableView *tableView;
@property (nonatomic, assign) NSInteger pageNo;//从0开始
@property (nonatomic, assign) CGFloat currentOffset;

@end

@implementation BaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.pageNo = 0;
    self.currentOffset = 0;
    @weakify(self);
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    tableView.delegate = (id<UITableViewDelegate>)self;
    tableView.dataSource = (id<UITableViewDataSource>)self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        @strongify(self);
        self.pageNo = 0;
        [self dragTableViewHead];
    }];
    
    tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        @strongify(self);
        [self dragTableViewFoot:self.pageNo nextPageNo:++self.pageNo];
    }];
    
    tableView.placeHoldView = [PlaceHoldView placeHoldWithImg:@"nodata"
                                                    placeHold:@"没有数据哟"
                                              placeHoldOffset:CGPointZero tapView:^{
        @strongify(self);
        [self tapNoDataHintView];
    }];
    
    [self.view addSubview:(_tableView = tableView)];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.edges.equalTo(self.view);
    }];
}

- (void)tapNoDataHintView{
    
}

- (void)dragTableViewHead{
    
}

- (void)dragTableViewFoot:(NSInteger)currentPageNo nextPageNo:(NSInteger)nextPageNo{
    
}

#pragma mark - TableView代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 0;
}

@end
