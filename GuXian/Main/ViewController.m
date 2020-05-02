//
//  ViewController.m
//  GuXian
//
//  Created by menthu on 2020/5/2.
//  Copyright © 2020 menthu. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "CommonHead.h"
#import "DeviceManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    CGFloat temp = getStatusBarHeight();
    temp = getNavibarHeight();
    
}

@end
