//
//  UIViewController+Extend.m
//  GuXian
//
//  Created by menthu on 2020/5/30.
//  Copyright © 2020 menthu. All rights reserved.
//

#import "UIViewController+Extend.h"

@implementation UIViewController (Extend)

- (void)showAlter:(NSString *)title
          message:(NSString * _Nullable)subTitle
      actionModel:(NSArray <AlterModel *> *)actionArray
         callBack:(void (^) (AlterModel *model))callBack{
    UIAlertController *alterControl = [UIAlertController alertControllerWithTitle:title message:subTitle preferredStyle:UIAlertControllerStyleAlert];
    for (AlterModel *model in actionArray) {
        UIAlertAction *action = [UIAlertAction actionWithTitle:model.title style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            if (callBack) {
                callBack(model);
            }
        }];
        [alterControl addAction:action];
    }
    [self presentViewController:alterControl animated:YES completion:nil];
}

@end
