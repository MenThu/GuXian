//
//  CourseVideoListController.h
//  GuXian
//
//  Created by menthu on 2020/5/5.
//  Copyright © 2020 menthu. All rights reserved.
//

@class CouseListModel;
#import "ContentController.h"

NS_ASSUME_NONNULL_BEGIN

@interface CourseVideoListController : ContentController

@property (nonatomic, copy) void (^clickVideoListCallBack) (CouseListModel *model);
@property (nonatomic, weak) NSArray <CouseListModel *> *tableSource;



@end

NS_ASSUME_NONNULL_END
