//
//  AppDelegate.m
//  GuXian
//
//  Created by menthu on 2020/5/2.
//  Copyright © 2020 menthu. All rights reserved.
//

#import "AppDelegate.h"
#import "DataManager.h"
#import "UserInfo.h"
#import "LoginController.h"
#import "DeviceManager.h"
#import "MainTarBarController.h"

@interface AppDelegate (){
    UIWindow *_window;
}

@end

@implementation AppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self chooseMain];
    return YES;
}

- (void)chooseMain{
    UserInfo *personInfo = [DataManager getLoginInfo];
    if (personInfo == nil) {//显示登录页
        [self showLogin];
    }else{//显示主页
        [self showMain];
    }
}

- (void)showMain{
    self.window.rootViewController = [[MainTarBarController alloc] init];
}

- (void)showLogin{
    self.window.rootViewController = [[LoginController alloc] init];
}


@end
