//
//  NSObject+HttpRequest.m
//  GuXian
//
//  Created by menthu on 2020/6/7.
//  Copyright © 2020 menthu. All rights reserved.
//

#import "NSObject+HttpRequest.h"
#import "NetWorkManager.h"
#import <MJExtension.h>

@implementation NSObject (HttpRequest)

+ (void)postRequest:(RequestModel *)model
          toastView:(UIView *)toastView
           callback:(void (^) (BOOL isSucc, NSArray * _Nullable resultArray))callBack{
    [[NetWorkManager shareInstance] postRequest:model toastInView:toastView finish:^(BOOL isSucc, ResponseModel * _Nullable model) {
        if (isSucc) {
            NSArray *tempArray = nil;
            if ([model.result isKindOfClass:NSArray.class]) {
                tempArray = [self mj_objectArrayWithKeyValuesArray:model.result];
            }else{
                tempArray = @[[self mj_objectWithKeyValues:model.result]];
            }
            callBack(YES, tempArray);
        }else{
            callBack(NO, nil);
        }
    }];
}

@end
