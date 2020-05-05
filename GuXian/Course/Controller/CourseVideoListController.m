//
//  CourseVideoListController.m
//  GuXian
//
//  Created by menthu on 2020/5/5.
//  Copyright © 2020 menthu. All rights reserved.
//

#import <Masonry.h>
#import "CourseVideoListController.h"
#import "ContentTableView.h"
#import "CourseListVideoTableView.h"
#import "CourseVideoListCell.h"

@interface CourseVideoListController ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation CourseVideoListController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    CourseListVideoTableView *tableView = [[CourseListVideoTableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:(self.contentScrollView = tableView)];
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [self scrollViewScroll];
}

#pragma mark - TableView代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CourseVideoListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CourseVideoListCell" forIndexPath:indexPath];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 45;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.clickVideoListCallBack) {
        self.clickVideoListCallBack(nil);
    }
}

@end
