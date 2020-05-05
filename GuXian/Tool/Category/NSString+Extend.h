//
//  NSString+Extend.h
//  AppAuth
//
//  Created by menthu on 2020/2/27.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Extend)

- (BOOL)isExist;
- (BOOL)isPureNum;
- (BOOL)isPhoneNum;
- (NSString *)getPinyin;

@end

NS_ASSUME_NONNULL_END
