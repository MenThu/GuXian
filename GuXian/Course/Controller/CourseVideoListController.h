//
//  CourseVideoListController.h
//  GuXian
//
//  Created by menthu on 2020/5/5.
//  Copyright © 2020 menthu. All rights reserved.
//

#import "ContentController.h"

NS_ASSUME_NONNULL_BEGIN

@interface CourseVideoListController : ContentController

@property (nonatomic, copy) void (^clickVideoListCallBack) (id model);

@end

NS_ASSUME_NONNULL_END
