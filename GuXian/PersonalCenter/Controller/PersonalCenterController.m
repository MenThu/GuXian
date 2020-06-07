//
//  PersonalCenterController.m
//  GuXian
//
//  Created by menthu on 2020/5/17.
//  Copyright © 2020 menthu. All rights reserved.
//

#import "PersonalCenterController.h"
#import "PersonalDetailController.h"
#import "CommonHead.h"
#import "SettingController.h"

@interface PersonalCenterController ()

@end

@implementation PersonalCenterController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGBA(230, 230, 230, 1);
}

//跳转到个人详情界面
- (IBAction)push2DetailController:(UITapGestureRecognizer *)sender {
    PersonalDetailController *detailController = [[PersonalDetailController alloc] init];
    [self.navigationController pushViewController:detailController animated:YES];
}

//购买的课程
- (IBAction)purchaseClass:(UITapGestureRecognizer *)sender {
}

//做过的题
- (IBAction)myExercise:(UITapGestureRecognizer *)sender {
}

//预约的一对一辅导
- (IBAction)myAppointment:(UITapGestureRecognizer *)sender {
    
}

//设置
- (IBAction)push2SettingController:(UITapGestureRecognizer *)sender {
    SettingController *settingController = [[SettingController alloc] init];
    [self.navigationController pushViewController:settingController animated:YES];
}

@end
