//
//  DeviceManager.m
//  GuXian
//
//  Created by menthu on 2020/5/2.
//  Copyright © 2020 menthu. All rights reserved.
//

#import "DeviceManager.h"
#import <UIKit/UIKit.h>

CGFloat getStatusBarHeight(void){
    static dispatch_once_t onceToken;
    static CGFloat statusBarHeight = 0;
    dispatch_once(&onceToken, ^{
        statusBarHeight = CGRectGetHeight([UIApplication sharedApplication].statusBarFrame);
    });
    return statusBarHeight;
}

CGFloat getNavibarHeight(void){
    static dispatch_once_t onceToken;
    static CGFloat navibarHeight = 0;
    dispatch_once(&onceToken, ^{
        navibarHeight = 44 + getStatusBarHeight();
    });
    return navibarHeight;
}



CGFloat bottomHeight(void){
    if (getStatusBarHeight() == 44) {
        return 34;
    }else{
        return 0;
    }
}

CGSize getScreenSize(void){
    static dispatch_once_t onceToken;
    static CGSize screenSize;
    dispatch_once(&onceToken, ^{
        screenSize = UIScreen.mainScreen.bounds.size;
    });
    return screenSize;
}

@implementation DeviceManager

@end
