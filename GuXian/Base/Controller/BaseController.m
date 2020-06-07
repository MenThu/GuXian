//
//  BaseController.m
//  GuXian
//
//  Created by menthu on 2020/5/2.
//  Copyright © 2020 menthu. All rights reserved.
//

#import "BaseController.h"
#import "Masonry.h"
#import "CommonHead.h"

@interface BaseController () <UIGestureRecognizerDelegate>

@property (nonatomic, assign) BOOL originNavibarHiddenStatus;
@property (nonatomic, weak) UITapGestureRecognizer *tapGesture;

@end

@implementation BaseController

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    if ([NSStringFromClass(touch.view.class) isEqualToString:@"UITableViewCellContentView"]) {
        return NO;
    }
    return YES;
}

- (void)tapView:(UIGestureRecognizer *)gesture{
    [self.view endEditing:YES];
}

- (void)viewDidLoad{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self->_isNavibarHidden = NO;
    self.originNavibarHiddenStatus = self.navigationController.navigationBar.isHidden;
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapView:)];
    tapGesture.delegate = self;
    [self.view addGestureRecognizer:(_tapGesture = tapGesture)];
    
    // 自定义返回按钮
    if (self.navigationController &&
        self.navigationController.childViewControllers.count > 1 &&
        self.navigationController.childViewControllers.firstObject != self) {
        UIView *customView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 45, 60)];
        
        UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        backButton.backgroundColor = UIColor.orangeColor;
        [backButton setImage:[UIImage imageNamed:@"FindJob"] forState:UIControlStateNormal];
        backButton.imageView.contentMode = UIViewContentModeCenter;
        [backButton addTarget:self action:@selector(backController) forControlEvents:UIControlEventTouchUpInside];
        [customView addSubview:backButton];
        
        UIView *verSepLine = [UIView new];
        verSepLine.backgroundColor = RGBA(233, 233, 233, 0.5);
        [customView addSubview:verSepLine];
        
        [backButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.bottom.equalTo(customView);
            make.right.equalTo(verSepLine.mas_left);
        }];
        
        [verSepLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.centerY.equalTo(customView);
            make.height.equalTo(customView).multipliedBy(0.6);
            make.width.mas_equalTo(1);
        }];
        
        UIBarButtonItem *leftBarItem = [[UIBarButtonItem alloc] initWithCustomView:customView];
        self.navigationItem.leftBarButtonItem = leftBarItem;
    }
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:self->_isNavibarHidden animated:animated];
}

//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    [super touchesBegan:touches withEvent:event];
//    [self.view endEditing:YES];
//}

- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

- (void)dealloc{
    NSLog(@"%@ die", NSStringFromClass(self.class));
}

- (void)backController{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
