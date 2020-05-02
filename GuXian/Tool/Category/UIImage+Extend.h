//
//  UIImage+Extend.h
//  GuXian
//
//  Created by menthu on 2020/5/2.
//  Copyright © 2020 menthu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (Extend)

- (UIImage *)redrawWithColor:(UIColor *)color;

+ (UIImage *)createImgWithColor:(UIColor *)color imgSize:(CGSize)imgSize;

@end

NS_ASSUME_NONNULL_END
