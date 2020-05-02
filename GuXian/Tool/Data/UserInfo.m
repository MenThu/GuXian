//
//  UserInfo.m
//  GuXian
//
//  Created by menthu on 2020/5/2.
//  Copyright © 2020 menthu. All rights reserved.
//

#import "UserInfo.h"
#import <MJExtension.h>

@implementation UserInfo

kSingleM

- (instancetype)init{
    if (self = [super init]) {
        self.phoneNum = @"";
        self.nickName = @"";
    }
    return self;
}

@end
