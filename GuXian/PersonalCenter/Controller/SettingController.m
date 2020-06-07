//
//  SettingController.m
//  GuXian
//
//  Created by menthu on 2020/5/17.
//  Copyright © 2020 menthu. All rights reserved.
//

#import "SettingController.h"
#import "UIViewController+Extend.h"
#import "DataManager.h"
#import "LoginController.h"
#import "AppDelegate.h"

@interface SettingController ()

@end

@implementation SettingController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.navigationItem.title = @"设置";
}

- (IBAction)logout:(UITapGestureRecognizer *)sender {
    AlterModel *cancelModel = [[AlterModel alloc] init];
    cancelModel.title = @"取消";
    cancelModel.tag = 0;
    
    AlterModel *confirmModel = [[AlterModel alloc] init];
    confirmModel.title = @"确定";
    confirmModel.tag = 0;
    
    [self showAlter:@"退出当前账号" message:nil actionModel:@[cancelModel, confirmModel] callBack:^(AlterModel * _Nonnull model) {
        if (model.tag == 0) {//注销账号
            [DataManager logoutWithCallBack:^(NSInteger resultCode, id object, NSString *errMsg) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [UIApplication sharedApplication].delegate.window.rootViewController = [[LoginController alloc] init];
                    
                });
            }];
        }
    }];
}


@end
