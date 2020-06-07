//
//  NetWorkManager.h
//  GuXian
//
//  Created by menthu on 2020/5/30.
//  Copyright © 2020 menthu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "CommonHead.h"
#import "BaseModel.h"

@class RequestModel;
@class ResponseModel;

NS_ASSUME_NONNULL_BEGIN

@interface NetWorkManager : NSObject

kSingleH

- (void)postRequest:(RequestModel *)model
        toastInView:(UIView *)toastContainerView
             finish:(void (^) (BOOL isSucc, ResponseModel * _Nullable model))finish;

@end

@interface RequestModel : BaseModel

@property (nonatomic, strong) NSString *path;
@property (nonatomic, strong) NSDictionary *params;

@end

@interface ResponseModel <T> : NSObject

@property (nonatomic, strong) T _Nullable result;
@property (nonatomic, assign) BOOL isSucc;

@end

NS_ASSUME_NONNULL_END
