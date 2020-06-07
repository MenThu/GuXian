//
//  UserInfo.h
//  GuXian
//
//  Created by menthu on 2020/5/2.
//  Copyright © 2020 menthu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CommonHead.h"

NS_ASSUME_NONNULL_BEGIN

@interface UserInfo : NSObject

kSingleH

@property (nonatomic, strong) NSString *addtime;
@property (nonatomic, strong) NSString *phone;
@property (nonatomic, strong) NSString *head_img;
@property (nonatomic, strong) NSString *user_id;
@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *openid;

@end

NS_ASSUME_NONNULL_END
