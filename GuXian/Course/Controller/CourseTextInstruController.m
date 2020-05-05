//
//  CourseTextInstruController.m
//  GuXian
//
//  Created by menthu on 2020/5/4.
//  Copyright © 2020 menthu. All rights reserved.
//

#import <Masonry.h>
#import "CourseTextInstruController.h"
#import "CommonHead.h"

@interface CourseTextInstruController () <UIScrollViewDelegate>

@property (nonatomic, weak) UIScrollView *scrollView;
@property (nonatomic, weak) UILabel *label;

@end

@implementation CourseTextInstruController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.delegate = self;
    [self.view addSubview:(_scrollView = scrollView)];
    self.contentScrollView = scrollView;
    
    UILabel *label = UILabel.new;
    label.numberOfLines = 0;
    label.textColor = UIColor.grayColor;
    label.text = @"测试课程简介测试课程简介测试课程简介测试课程简介测试课程简介测试课程简介测试课程简介测试课程简介测试课程简介测试课程简介测试课程简介";
    [self.scrollView addSubview:(_label = label)];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(scrollView).offset(10);
        make.width.equalTo(self.view).offset(-20);
    }];
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    self.scrollView.frame = self.view.bounds;
    self.scrollView.contentSize = self.scrollView.bounds.size;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [self scrollViewScroll];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
