//
//  DataManager.m
//  GuXian
//
//  Created by menthu on 2020/5/2.
//  Copyright © 2020 menthu. All rights reserved.
//

#import <YYCache.h>
#import <MJExtension.h>
#import "DataManager.h"
#import "UserInfo.h"
#import "ViewController.h"
#import "CommonHead.h"

static NSString * const PERSONAL_DATA = @"PERSONAL_DATA";
static NSString * const ACCOUNT = @"ACCOUNT";


@interface DataManager ()

@property (nonatomic, strong) YYCache *personalCache;

@end

@implementation DataManager

kSingleM

- (instancetype)init{
    if (self = [super init]) {
        self.personalCache = [YYCache cacheWithName:PERSONAL_DATA];
    }
    return self;
}

+ (UserInfo *)getLoginInfo{
    NSData *data = (NSData *)[[DataManager shareInstance].personalCache objectForKey:ACCOUNT];
    if (data && data.length > 0) {
        NSDictionary*jsonDict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        [UserInfo.shareInstance mj_setKeyValues:jsonDict];
        return UserInfo.shareInstance;
    }else{
        return nil;
    }
}

+ (void)login:(UserInfo *)personInfo callBack:(MethodCallBack)callBack{
    NSData *jsonData = personInfo.mj_JSONData;
    [[DataManager shareInstance].personalCache setObject:jsonData forKey:ACCOUNT withBlock:^{
        if (callBack) {
            dispatch_async(dispatch_get_main_queue(), ^{
                callBack(0, nil, nil);
            });
        }
    }];
}

+ (void)logoutWithCallBack:(MethodCallBack)callBack{
    [DataManager.shareInstance.personalCache setObject:nil forKey:ACCOUNT withBlock:^{
        if (callBack) {
            callBack(0, nil, nil);
        }
    }];
}

@end
