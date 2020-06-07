//
//  LoginController.m
//  GuXian
//
//  Created by menthu on 2020/5/2.
//  Copyright © 2020 menthu. All rights reserved.
//

#import "LoginController.h"
#import "YYLabel.h"
#import "NSAttributedString+YYText.h"
#import "Masonry.h"
#import "CommonHead.h"
#import "DeviceManager.h"
#import "NSString+Extend.h"
#import "MainTarBarController.h"
#import "UIView+Extend.h"
#import "DataManager.h"
#import "UserInfo.h"
#import "NetWorkManager+Extend.h"

@interface LoginController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;
@property (weak, nonatomic) IBOutlet UIView *phoneUnderLine;
@property (weak, nonatomic) IBOutlet UIView *verifyCodeUnderLine;
@property (weak, nonatomic) IBOutlet UITextField *vertifyCodeTextField;
@property (weak, nonatomic) IBOutlet UIView *agreeMentView;
@property (nonatomic, weak) YYLabel *agreeMentLabel;
@property (weak, nonatomic) IBOutlet UIView *customNaviBar;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *customBarHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *customBarTop;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *titleLabelHeight;
@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (nonatomic, strong) NSString *userCode;
@property (weak, nonatomic) IBOutlet UIButton *protocolButton;

@end

@implementation LoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self->_isNavibarHidden = YES;
    
    YYLabel *agreeMentLabel = [YYLabel new];
    agreeMentLabel.numberOfLines = 0;
    [self.agreeMentView addSubview:(_agreeMentLabel = agreeMentLabel)];
    @weakify(self);
    [self.agreeMentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.edges.equalTo(self.agreeMentView);
    }];
    
    NSString *normalOne = @"我已阅读并同意使用";
    NSString *highLightOne = @"《免责申明》";
    NSString *highLightTwo = @"《隐私政策》";
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@%@、%@", normalOne, highLightOne, highLightTwo]];
    NSRange highLingRangeOne = [text.string rangeOfString:highLightOne];
    NSRange highLingRangeTwo = [text.string rangeOfString:highLightTwo];
    
    UIColor *highLightColor = RGBA(215, 103, 107, 1);
    UIColor *clickbackgroundColor = RGBA(233, 233, 233, 1);
    text.yy_font = [UIFont boldSystemFontOfSize:15];
    text.yy_color = [UIColor blackColor];
    [text yy_setColor:highLightColor range:highLingRangeOne];
    [text yy_setColor:highLightColor range:highLingRangeTwo];
    text.yy_lineSpacing = 3;
    
    [text yy_setTextHighlightRange:highLingRangeOne
              color:highLightColor
    backgroundColor:clickbackgroundColor
          tapAction:^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect){
        NSLog(@"click text1 = %@", text.string);
          }];
    
    [text yy_setTextHighlightRange:highLingRangeTwo
              color:highLightColor
    backgroundColor:clickbackgroundColor
          tapAction:^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect){
        NSLog(@"click text2 = %@", text.string);
          }];
    
    agreeMentLabel.attributedText = text;
    
    
    self.userCode = self.vertifyCodeTextField.text = @"1000";
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    if (self.navigationController.childViewControllers.count > 1 &&
        self != self.navigationController.childViewControllers.firstObject) {
        self.backButton.hidden = NO;
    }else{
        self.backButton.hidden = YES;
    }
    self.customBarHeight.constant = getStatusBarHeight() + getNavibarHeight();
    self.customBarTop.constant = getStatusBarHeight()+(getNavibarHeight()-self.titleLabelHeight.constant)/2;
}

- (IBAction)sendVertifyAction:(UIButton *)sender {
    [NetWorkManager userGetcode:self.phoneTextField.text toastView:self.view callBack:^(NSString * _Nullable userCode) {
        self.userCode = userCode;
    }];
}

- (IBAction)loginAction:(UIButton *)sender {
    if (!(self.phoneTextField.text.isExist && self.phoneTextField.text.isPhoneNum)) {
        [self.view showToast:@"请输入正确的手机号" hideAfterSeconds:0.5];
        return;
    }
    if (!(self.vertifyCodeTextField.text.isExist && [self.vertifyCodeTextField.text isEqualToString:self.userCode])) {
        [self.view showToast:@"请输入正确的验证码" hideAfterSeconds:0.5];
        return;
    }
    if (!self.protocolButton.selected) {
        [self.view showToast:@"请同意协议" hideAfterSeconds:0.5];
        return;
    }
    [NetWorkManager userLogin:self.phoneTextField.text toastView:self.view callBack:^(BOOL isSucc) {
        if (isSucc) {
            UIApplication.sharedApplication.keyWindow.rootViewController = [[MainTarBarController alloc] init];
        }
    }];
}

- (IBAction)agreeMentAction:(UIButton *)sender {
    sender.selected = !sender.selected;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    [self selectPhone:textField == self.phoneTextField];
    return YES;
}

- (void)selectPhone:(BOOL)isSelect{
    if (isSelect) {
        self.phoneUnderLine.backgroundColor = [UIColor greenColor];
        self.verifyCodeUnderLine.backgroundColor = [UIColor lightGrayColor];
    }else{
        self.phoneUnderLine.backgroundColor = [UIColor lightGrayColor];
        self.verifyCodeUnderLine.backgroundColor = [UIColor greenColor];
    }
}

@end
