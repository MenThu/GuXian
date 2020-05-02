//
//  UIView+Toast.h
//  UIDemo
//
//  Created by menthu on 2020/4/23.
//  Copyright © 2020 menthu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Toast)

- (void)showToast:(NSString *)hint hideAfterSeconds:(CGFloat)seconds;

@end

NS_ASSUME_NONNULL_END
