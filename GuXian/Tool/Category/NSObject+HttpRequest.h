//
//  NSObject+HttpRequest.h
//  GuXian
//
//  Created by menthu on 2020/6/7.
//  Copyright © 2020 menthu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class RequestModel;

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (HttpRequest)

+ (void)postRequest:(RequestModel *)model
          toastView:(UIView *)toastView
           callback:(void (^) (BOOL isSucc, NSArray * _Nullable resultArray))callBack;

@end

NS_ASSUME_NONNULL_END
