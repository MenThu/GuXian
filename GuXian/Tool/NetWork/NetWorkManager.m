//
//  NetWorkManager.m
//  GuXian
//
//  Created by menthu on 2020/5/30.
//  Copyright © 2020 menthu. All rights reserved.
//

#import <AFNetworking.h>
#import "NetWorkManager.h"
#import "NSString+Extend.h"
#import "UIView+Extend.h"


static NSString * const HTTP_HEAD = @"https://www.guxianedu.com/mall/";

@interface NetWorkManager ()

@property (nonatomic, strong) AFHTTPSessionManager *httpSession;

@end

@implementation NetWorkManager

kSingleM

- (instancetype)init{
    if (self = [super init]) {
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        configuration.timeoutIntervalForRequest = 15.f;
        self.httpSession = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:HTTP_HEAD] sessionConfiguration:configuration];
    }
    return self;
}

- (void)postRequest:(RequestModel *)model
toastInView:(UIView *)toastContainerView
     finish:(void (^) (BOOL isSucc, ResponseModel * _Nullable model))finish{
    if (model.path.isExist == NO) {
        finish(-1, nil);
        return;
    }
    [self.httpSession POST:model.path
                parameters:model.params
                  progress:nil
                   success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        ResponseModel <NSDictionary *> *response = ResponseModel.new;
        response.result = responseObject;
        if (response.isSucc) {
            response.result = response.result[@"result"];
            finish(YES, response);
        }else{
            finish(NO, response);
            if (toastContainerView) {
                [toastContainerView showToast:@"请求出错，请重试" hideAfterSeconds:1];
            }
        }
    }
                   failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        finish(NO, nil);
        if (toastContainerView) {
            [toastContainerView showToast:@"网络不稳定，请检查" hideAfterSeconds:1];
        }
    }];
}

@end


@implementation RequestModel

- (instancetype)init{
    if (self = [super init]) {
        
    }
    return self;
}

@end

@implementation ResponseModel

- (instancetype)init{
    if (self = [super init]) {
        
    }
    return self;
}

- (BOOL)isSucc{
    NSDictionary *result = self.result;
    NSNumber *code = result[@"code"];
    if ([code isKindOfClass:NSNumber.class]) {
        return code.integerValue == 200;
    }
    return NO;
}

@end
