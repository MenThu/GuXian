//
//  UIView+Extend.m
//  GuXian
//
//  Created by menthu on 2020/5/4.
//  Copyright © 2020 menthu. All rights reserved.
//

#import "UIView+Extend.h"
#import <MBProgressHUD.h>

@implementation UIView (Extend)

+ (instancetype)loadFromXib{
    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil].lastObject;
}

- (void)showToast:(NSString *)hint hideAfterSeconds:(CGFloat)seconds{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.label.text = hint;
//    hud.offset = CGPointMake(0.f, MBProgressMaxOffset);
    [hud hideAnimated:YES afterDelay:seconds];
}

@end
