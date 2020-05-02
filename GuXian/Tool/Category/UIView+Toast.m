//
//  UIView+Toast.m
//  UIDemo
//
//  Created by menthu on 2020/4/23.
//  Copyright © 2020 menthu. All rights reserved.
//

#import "UIView+Toast.h"
#import <MBProgressHUD.h>

@implementation UIView (Toast)

- (void)showToast:(NSString *)hint hideAfterSeconds:(CGFloat)seconds{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.label.text = hint;
//    hud.offset = CGPointMake(0.f, MBProgressMaxOffset);
    [hud hideAnimated:YES afterDelay:seconds];
}

@end
