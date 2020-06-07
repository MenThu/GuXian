//
//  CourseListController.m
//  GuXian
//
//  Created by menthu on 2020/5/4.
//  Copyright © 2020 menthu. All rights reserved.
//

#import "CourseListController.h"
#import "CourseCellModel.h"
#import "CourceListCell.h"
#import "DeviceManager.h"
#import "CourseDetailController.h"
#import "CourseDetailHeadView.h"
#import "CourseVideoListController.h"
#import "CourseTextInstruController.h"
#import "UIView+Extend.h"
#import "NetWorkManager+Extend.h"

@interface CourseListController ()

@property (nonatomic, strong) NSMutableArray <CourseCellModel *> *tableSource;
@property (nonatomic, assign) NSInteger currentPage;

@end

@implementation CourseListController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"课程";
    [self.tableView registerClass:[CourceListCell class] forCellReuseIdentifier:@"CourceListCell"];
    self.cellForHeight = [self.tableView dequeueReusableCellWithIdentifier:@"CourceListCell"];
    [self dragTableViewHead];
}

- (void)dragTableViewHead{
    self.currentPage = 0;
    self.tableSource = nil;
    [NetWorkManager seriesSelectList:self.currentPage
                           toastView:self.view
                            callBack:^(BOOL isSucc, NSArray<CourseCellModel *> * _Nullable resultArray) {
        if (isSucc) {
            self.tableSource = [NSMutableArray arrayWithArray:resultArray];
            [self calculateCellHeightForModelArray:self.tableSource];
        }
        if (self.tableView.mj_header.isRefreshing) {
            [self.tableView.mj_header endRefreshing];
        }
        [self.tableView reloadData];
    }];
}

- (void)dragTableViewFoot:(NSInteger)currentPageNo nextPageNo:(NSInteger)nextPageNo{
    [NetWorkManager seriesSelectList:++self.currentPage
                           toastView:self.view
                            callBack:^(BOOL isSucc, NSArray<CourseCellModel *> * _Nullable resultArray) {
        if (isSucc) {
            [self calculateCellHeightForModelArray:resultArray];
            [self.tableSource addObjectsFromArray:resultArray];
            [self.tableView reloadData];
        }
        if (self.tableView.mj_footer.isRefreshing) {
            [self.tableView.mj_footer endRefreshing];
        }
    }];
}

- (void)calculateCellHeightForModelArray:(NSArray <CourseCellModel *> *)tempArray{
    for (CourseCellModel *model in tempArray) {
        model.detailOneText = [NSString stringWithFormat:@"共计: %d节课", (int)model.course_count];
        model.detailTwoText = [NSString stringWithFormat:@"观看人数: %d", (int)model.look_count];
        model.cellHeight = [self.cellForHeight getCellHeightIn:getScreenSize().width withModel:model];
    }
}

- (void)tapNoDataHintView{
    [self dragTableViewHead];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.tableSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CourceListCell <CourseCellModel *>  *cell = [tableView dequeueReusableCellWithIdentifier:@"CourceListCell" forIndexPath:indexPath];
    cell.cellModel = self.tableSource[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    CourseDetailController *detailController = [[CourseDetailController alloc] init];
    detailController.seriesId = self.tableSource[indexPath.row].series_id;
    [self.navigationController pushViewController:detailController animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return self.tableSource[indexPath.row].cellHeight;
}

@end
