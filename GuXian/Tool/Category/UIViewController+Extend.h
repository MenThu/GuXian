//
//  UIViewController+Extend.h
//  GuXian
//
//  Created by menthu on 2020/5/30.
//  Copyright © 2020 menthu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AlterModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (Extend)

/// 显示弹窗
/// @param title 弹窗标题
/// @param subTitle 弹窗副标题，可以为nil
/// @param actionArray 俺妞妞名称
/// @param callBack 点击的回调
- (void)showAlter:(NSString *)title
          message:(NSString * _Nullable)subTitle
      actionModel:(NSArray <AlterModel *> *)actionArray
         callBack:(void (^) (AlterModel *model))callBack;

@end

NS_ASSUME_NONNULL_END
