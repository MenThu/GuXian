//
//  UIImage+Extend.m
//  GuXian
//
//  Created by menthu on 2020/5/2.
//  Copyright © 2020 menthu. All rights reserved.
//

#import "UIImage+Extend.h"

@implementation UIImage (Extend)

- (UIImage *)redrawWithColor:(UIColor *)color{
   UIGraphicsBeginImageContextWithOptions(self.size, NO, self.scale);
   CGContextRef context = UIGraphicsGetCurrentContext();
   CGContextTranslateCTM(context, 0, self.size.height);
   CGContextScaleCTM(context, 1.0, -1.0);
   CGContextSetBlendMode(context, kCGBlendModeNormal);
   CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
   CGContextClipToMask(context, rect, self.CGImage);
   [color setFill];
   CGContextFillRect(context, rect);
   UIImage*newImage = UIGraphicsGetImageFromCurrentImageContext();
   UIGraphicsEndImageContext();
   return newImage;
}

+ (UIImage *)createImgWithColor:(UIColor *)color imgSize:(CGSize)imgSize{
    CGRect rect = CGRectMake(0.0f, 0.0f, imgSize.width, imgSize.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
