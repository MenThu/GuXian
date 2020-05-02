//
//  CommonHead.h
//  GuXian
//
//  Created by menthu on 2020/5/2.
//  Copyright © 2020 menthu. All rights reserved.
//

#ifndef CommonHead_h
#define CommonHead_h

#define kSingleH + (instancetype)shareInstance;

#define kSingleM \
+ (instancetype)shareInstance { \
static dispatch_once_t onceToken; \
static id _singleInstance = nil; \
dispatch_once(&onceToken, ^{ \
if (_singleInstance == nil) { \
_singleInstance = [[self alloc] init]; \
} \
}); \
return _singleInstance; \
}


#ifndef weakify
#if DEBUG
#if __has_feature(objc_arc)
#define weakify(object)                                                                                                                              \
    autoreleasepool {}                                                                                                                               \
    __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object)                                                                                                                              \
    autoreleasepool {}                                                                                                                               \
    __block __typeof__(object) block##_##object = object;
#endif
#else
#if __has_feature(objc_arc)
#define weakify(object)                                                                                                                              \
    try {                                                                                                                                            \
    } @finally {                                                                                                                                     \
    }                                                                                                                                                \
    {}                                                                                                                                               \
    __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object)                                                                                                                              \
    try {                                                                                                                                            \
    } @finally {                                                                                                                                     \
    }                                                                                                                                                \
    {}                                                                                                                                               \
    __block __typeof__(object) block##_##object = object;
#endif
#endif
#endif

#ifndef strongify
#if DEBUG
#if __has_feature(objc_arc)
#define strongify(object)                                                                                                                            \
    autoreleasepool {}                                                                                                                               \
    __typeof__(object) object = weak##_##object;
#else
#define strongify(object)                                                                                                                            \
    autoreleasepool {}                                                                                                                               \
    __typeof__(object) object = block##_##object;
#endif
#else
#if __has_feature(objc_arc)
#define strongify(object)                                                                                                                            \
    try {                                                                                                                                            \
    } @finally {                                                                                                                                     \
    }                                                                                                                                                \
    __typeof__(object) object = weak##_##object;
#else
#define strongify(object)                                                                                                                            \
    try {                                                                                                                                            \
    } @finally {                                                                                                                                     \
    }                                                                                                                                                \
    __typeof__(object) object = block##_##object;
#endif
#endif
#endif

typedef void(^MethodCallBack)(NSInteger resultCode, id object, NSString *errMsg);

#define RGBA(r, g, b, a) [UIColor colorWithRed:r/255.f green:g/255.f blue:b/255.f alpha:a]

#endif /* CommonHead_h */
