//
//  LocationManager.h
//  GuXian
//
//  Created by menthu on 2020/5/3.
//  Copyright © 2020 menthu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CommonHead.h"

NS_ASSUME_NONNULL_BEGIN

@interface LocationManager : NSObject

kSingleH

+ (void)getCurrentLocationCity:(void (^) (BOOL isSucc, NSString *cityName, NSString *errMsg))callBack;

@end

NS_ASSUME_NONNULL_END
