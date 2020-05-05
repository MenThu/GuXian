//
//  DeviceManager.h
//  GuXian
//
//  Created by menthu on 2020/5/2.
//  Copyright © 2020 menthu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

NS_ASSUME_NONNULL_BEGIN

#ifdef __cplusplus
extern "C" {
#endif

CGFloat getStatusBarHeight(void);
CGFloat getNavibarHeight(void);
CGFloat bottomHeight(void);
CGSize getScreenSize(void);

#ifdef __cplusplus
}
#endif


@interface DeviceManager : NSObject



@end

NS_ASSUME_NONNULL_END
