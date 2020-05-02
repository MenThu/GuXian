//
//  DataManager.h
//  GuXian
//
//  Created by menthu on 2020/5/2.
//  Copyright © 2020 menthu. All rights reserved.
//

@class UserInfo;

#import <Foundation/Foundation.h>
#import "CommonHead.h"

NS_ASSUME_NONNULL_BEGIN

@interface DataManager : NSObject

kSingleH

+ (UserInfo *)getLoginInfo;
+ (void)savePersonData:(UserInfo *)personInfo callBack:(MethodCallBack)callBack;

@end

NS_ASSUME_NONNULL_END
