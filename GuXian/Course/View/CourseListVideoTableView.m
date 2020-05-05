//
//  CourseListVideoTableView.m
//  GuXian
//
//  Created by menthu on 2020/5/5.
//  Copyright © 2020 menthu. All rights reserved.
//

#import <MJRefresh.h>
#import "CourseListVideoTableView.h"
#import "UITableView+PlaceHoldView.h"
#import "CommonHead.h"

@implementation CourseListVideoTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    if (self = [super initWithFrame:frame style:style]) {
        [self configView];
    }
    return self;
}

- (void)configView{
    @weakify(self);
    [self registerNib:[UINib nibWithNibName:@"CourseVideoListCell" bundle:nil] forCellReuseIdentifier:@"CourseVideoListCell"];
    
    self.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        @strongify(self);
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.mj_header endRefreshing];
        });
    }];
    
    self.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        @strongify(self);
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.mj_footer endRefreshing];
        });
    }];
    
    self.placeHoldView = [PlaceHoldView placeHoldWithImg:@"nodata"
                                                    placeHold:@"没有数据哟"
                                              placeHoldOffset:CGPointZero tapView:^{
        @strongify(self);
        [self tapNoDataHintView];
    }];
}

- (void)tapNoDataHintView{
    
}

@end
