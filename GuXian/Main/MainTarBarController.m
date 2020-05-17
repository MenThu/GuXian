//
//  MainTarBarController.m
//  GuXian
//
//  Created by menthu on 2020/5/2.
//  Copyright © 2020 menthu. All rights reserved.
//

#import "MainTarBarController.h"
#import "BaseNavigationController.h"
#import "CommonHead.h"
#import "UIImage+Extend.h"

@interface MainTarBarController ()

@end

@implementation MainTarBarController

+ (void)initialize{
    //配置UITarBar样式
    UITabBar *tarbar = [UITabBar appearance];
    tarbar.barTintColor = UIColor.whiteColor;
    tarbar.translucent = NO;
    
    //设置UITarbarItem样式
    NSMutableDictionary *normalAttributes = [NSMutableDictionary dictionary];
    normalAttributes[NSForegroundColorAttributeName] = RGBA(157, 157, 157, 1);
    normalAttributes[NSFontAttributeName] = [UIFont systemFontOfSize:10];
    
    NSMutableDictionary *selectAttribtes = [NSMutableDictionary dictionary];
    selectAttribtes[NSForegroundColorAttributeName] = RGBA(213, 91, 128, 1);
    selectAttribtes[NSFontAttributeName] = [UIFont systemFontOfSize:10];
    
    UITabBarItem *tabbarItem = [UITabBarItem appearance];
    [tabbarItem setTitleTextAttributes:normalAttributes forState:UIControlStateNormal];
    [tabbarItem setTitleTextAttributes:selectAttribtes forState:UIControlStateSelected];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self loadChildViewControllers];
    
//    self.tabBar.barStyle = UIBarStyleBlack;
}

- (void)loadChildViewControllers{
    //求职
    [self addChildViewController:@"FindJobController" tabbarItemName:@"求职" tarbarImg:@"FindJob"];
    
    //课程
    [self addChildViewController:@"CourseListController" tabbarItemName:@"课程" tarbarImg:@"Course"];
    
    //辅导
    [self addChildViewController:@"TrainingController" tabbarItemName:@"题库" tarbarImg:@"Training"];
    
    //个人中心
    [self addChildViewController:@"PersonalCenterController" tabbarItemName:@"我" tarbarImg:@"PersonalCenter"];
}

- (void)addChildViewController:(NSString *)controllerName tabbarItemName:(NSString *)tabbarItemName tarbarImg:(NSString *)imgName{
    UIViewController *viewController = [[NSClassFromString(controllerName) alloc] init];
//    viewController.view.backgroundColor = UIColor.whiteColor;
    viewController.tabBarItem.title = tabbarItemName;
    UIImage *imgFromImgAsset = [[UIImage imageNamed:imgName] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    UIImage *defaultImg = [[imgFromImgAsset redrawWithColor:UIColor.blackColor] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *selectImg = [[imgFromImgAsset redrawWithColor:RGBA(213, 91, 128, 1)] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    viewController.tabBarItem.image = defaultImg;
    viewController.tabBarItem.selectedImage = selectImg;
    BaseNavigationController *navigationController = [[BaseNavigationController alloc]  initWithRootViewController:viewController];
    [self addChildViewController:navigationController];
}

@end
