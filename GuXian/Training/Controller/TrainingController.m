//
//  TrainingController.m
//  GuXian
//
//  Created by menthu on 2020/5/5.
//  Copyright © 2020 menthu. All rights reserved.
//

#import <Masonry.h>
#import "TrainingController.h"
#import "ExamListCell.h"
#import "ExamDetailController.h"

@interface TrainingController ()

@property (weak, nonatomic) IBOutlet UIView *headView;

@end

@implementation TrainingController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"题库";
    [self.tableView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(self.view);
        make.top.equalTo(self.headView.mas_bottom);
    }];
    
    [self.tableView registerClass:[ExamListCell class] forCellReuseIdentifier:@"ExamListCell"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ExamListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ExamListCell" forIndexPath:indexPath];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 65.f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.navigationController pushViewController:[[ExamDetailController alloc] init] animated:YES];
}

@end
