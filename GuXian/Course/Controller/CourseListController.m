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

@interface CourseListController ()

@property (nonatomic, strong) NSMutableArray <CourseCellModel *> *tableSource;

@end

@implementation CourseListController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"课程";
    
    [self.tableView registerClass:[CourceListCell class] forCellReuseIdentifier:@"CourceListCell"];
    self.cellForHeight = [self.tableView dequeueReusableCellWithIdentifier:@"CourceListCell"];
    NSMutableArray <CourseCellModel *> *tableSource = [[NSMutableArray alloc] init];
    for (NSInteger index = 0; index < 10; index ++) {
        CourseCellModel *model = [CourseCellModel new];
        model.titleText = @"测试课程测试课程测试课程测试课程测试课程";
        model.detailOneText = @"共计：2节课";
        model.detailTwoText = @"观看人数：8";
        model.imgConverUrl =
        @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1588576352327&di=87a5681d68728ecad8b26c85789a3766&imgtype=0&src=http%3A%2F%2Fe.hiphotos.baidu.com%2Fzhidao%2Fpic%2Fitem%2Fd62a6059252dd42a1c362a29033b5bb5c9eab870.jpg";
        model.cellHeight = [self.cellForHeight getCellHeightIn:getScreenSize().width withModel:model];
        [tableSource addObject:model];
    }
    self.tableSource = tableSource;
    [self.tableView.mj_footer endRefreshingWithNoMoreData];
    [self.tableView reloadData];
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
    [self.navigationController pushViewController:detailController animated:YES];
//
//    UIView *segmentView = [UIView new];
//    segmentView.backgroundColor = [UIColor orangeColor];
//    CourseVideoListController *controller1 = [[CourseVideoListController alloc] init];
//    CourseTextInstruController *controller2 = [[CourseTextInstruController alloc] init];
//    NSArray <ContentController *> *controllerArrays = @[controller1, controller2];
//    MainTableController *tabbarController = [[MainTableController alloc] initWith:[CourseDetailHeadView loadFromXib] headHeight:170 segmentView:segmentView segmentHeight:60 contentController:controllerArrays];
//    [self.navigationController pushViewController:tabbarController animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return self.tableSource[indexPath.row].cellHeight;
}

@end
