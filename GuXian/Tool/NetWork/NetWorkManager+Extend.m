//
//  NetWorkManager+Extend.m
//  GuXian
//
//  Created by menthu on 2020/5/30.
//  Copyright © 2020 menthu. All rights reserved.
//

#import "NetWorkManager+Extend.h"
#import "DataManager.h"
#import "UserInfo.h"
#import "CommonHead.h"
#import "NSString+Extend.h"
#import <MJExtension.h>
#import "NSObject+HttpRequest.h"
#import "CourseDetailModel.h"

@implementation NetWorkManager (Extend)

+ (void)userGetcode:(NSString *)userPhone
          toastView:(UIView *)toastView
           callBack:(void (^) (NSString * userCode))callBack{
    RequestModel *model = [RequestModel new];
    model.path = @"user/getcode";
    model.params = @{@"phone":userPhone};
    [NetWorkManager.shareInstance postRequest:model toastInView:toastView finish:^(BOOL isSucc, ResponseModel * _Nullable model) {
        if (isSucc) {
            callBack(model.result[@"code"]);
        }else{
            callBack(nil);
        }
    }];
}

+ (void)userLogin:(NSString *)userPhone
        toastView:(UIView *)toastView
         callBack:(void (^) (BOOL isSucc))callBack{
    NSMutableDictionary *params = @{}.mutableCopy;
    params[@"phone"] = userPhone;
    RequestModel *model = RequestModel.new;
    model.path = @"user/login";
    model.params = params;
    [NetWorkManager.shareInstance postRequest:model toastInView:toastView finish:^(BOOL isSucc, ResponseModel * _Nullable model) {
        if (isSucc) {
            [UserInfo.shareInstance mj_setKeyValues:model.result];
            [DataManager login:UserInfo.shareInstance callBack:^(NSInteger resultCode, id object, NSString *errMsg) {
                callBack(isSucc);
            }];
        }else{
            callBack(NO);
        }
    }];
}

+ (void)jobsSelectList:(NSString *)cityName pageNo:(NSInteger)pageNo toastView:(UIView *)toastView{
    NSMutableDictionary *params = @{}.mutableCopy;
    if (cityName.isExist) {
        params[@"city_name"] = cityName;
    }
    params[@"currentPage"] = @(pageNo);
    RequestModel *model = RequestModel.new;
    model.path = @"jobs/selectList";
    model.params = params;
    [NetWorkManager.shareInstance postRequest:model toastInView:toastView finish:^(BOOL isSucc, ResponseModel * _Nullable model) {
        if (isSucc) {
            NSLog(@"");
        }else{
            
        }
    }];
}

+ (void)jobsSearchJob:(NSString *)searchContent
            toastView:(UIView * _Nullable)toastView
             callBack:(void (^) (BOOL isSucc, NSArray <JobCellModel *> * _Nullable resultArray))callBack{
    if (!searchContent.isExist) {
        return;
    }
    NSMutableDictionary *params = @{}.mutableCopy;
    params[@"search_content"] = searchContent;
    RequestModel *model = RequestModel.new;
    model.path = @"jobs/searchJob";
    model.params = params;
    [JobCellModel postRequest:model toastView:toastView callback:^(BOOL isSucc, NSArray <JobCellModel *> * _Nullable resultArray) {
        callBack(isSucc, resultArray);
    }];
}

+ (void)seriesSelectList:(NSInteger)pageNo
               toastView:(UIView * _Nullable)toastView
                callBack:(void (^) (BOOL isSucc, NSArray <CourseCellModel *> * _Nullable resultArray))callBack{
    NSMutableDictionary *params = @{}.mutableCopy;
    params[@"currentPage"] = @(pageNo);
    params[@"user_id"] = UserInfo.shareInstance.user_id;
    RequestModel *model = RequestModel.new;
    model.path = @"series/selectList";
    model.params = params;
    [CourseCellModel postRequest:model toastView:toastView callback:^(BOOL isSucc, NSArray * _Nullable resultArray) {
        callBack(isSucc, resultArray);
    }];
}

+ (void)courseSelectList:(NSString *)seriesId
               toastView:(UIView * _Nullable)toastView
                callBack:(void (^) (BOOL isSucc, CourseDetailModel * _Nullable detailModel))callBack{
    NSMutableDictionary *params = @{}.mutableCopy;
    params[@"series_id"] = seriesId;
    params[@"user_id"] = UserInfo.shareInstance.user_id;
    RequestModel *model = RequestModel.new;
    model.path = @"course/selectList";
    model.params = params;
    [CourseDetailModel postRequest:model toastView:toastView callback:^(BOOL isSucc, NSArray * _Nullable resultArray) {
        CourseDetailModel *detailModel = nil;
        if ([resultArray isKindOfClass:NSArray.class] && resultArray.count > 0) {
            detailModel = resultArray.firstObject;
        }
        callBack(isSucc, detailModel);
    }];
}

@end
