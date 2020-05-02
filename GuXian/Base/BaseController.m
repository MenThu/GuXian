//
//  BaseController.m
//  GuXian
//
//  Created by menthu on 2020/5/2.
//  Copyright © 2020 menthu. All rights reserved.
//

#import "BaseController.h"

@interface BaseController ()

@property (nonatomic, assign) BOOL originNavibarHiddenStatus;

@end

@implementation BaseController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self->_isNavibarHidden = NO;
    self.originNavibarHiddenStatus = self.navigationController.navigationBar.isHidden;
    
    // 自定义返回按钮
    if (self.navigationController &&
        self.navigationController.childViewControllers.count > 1 &&
        self.navigationController.childViewControllers.firstObject != self) {
        UIView *customView = [[UIView alloc] init];
        customView.backgroundColor = [UIColor orangeColor];
        UIBarButtonItem *leftBarItem = [[UIBarButtonItem alloc] initWithCustomView:customView];
        self.navigationItem.leftBarButtonItem = leftBarItem;
    }
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:self->_isNavibarHidden animated:animated];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    [self.view endEditing:YES];
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
