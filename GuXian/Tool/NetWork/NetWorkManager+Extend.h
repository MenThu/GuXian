//
//  NetWorkManager+Extend.h
//  GuXian
//
//  Created by menthu on 2020/5/30.
//  Copyright © 2020 menthu. All rights reserved.
//

@class CourseDetailModel;
#import "NetWorkManager.h"
#import "JobCellModel.h"
#import "CourseCellModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface NetWorkManager (Extend)

+ (void)userGetcode:(NSString *)userPhone toastView:(UIView * _Nullable)toastView callBack:(void (^) (NSString * _Nullable userCode))callBack;
+ (void)userLogin:(NSString *)userPhone toastView:(UIView * _Nullable)toastView callBack:(void (^) (BOOL isSucc))callBack;
+ (void)jobsSelectList:(NSString * _Nullable)cityName pageNo:(NSInteger)pageNo toastView:(UIView * _Nullable)toastView;
+ (void)jobsSearchJob:(NSString *)searchContent
            toastView:(UIView * _Nullable)toastView
             callBack:(void (^) (BOOL isSucc, NSArray <JobCellModel *> * _Nullable resultArray))callBack;


+ (void)seriesSelectList:(NSInteger)pageNo
               toastView:(UIView * _Nullable)toastView
                callBack:(void (^) (BOOL isSucc, NSArray <CourseCellModel *> * _Nullable resultArray))callBack;

+ (void)courseSelectList:(NSString *)seriesId
               toastView:(UIView * _Nullable)toastView
                callBack:(void (^) (BOOL isSucc, CourseDetailModel * _Nullable detailModel))callBack;

@end

NS_ASSUME_NONNULL_END
