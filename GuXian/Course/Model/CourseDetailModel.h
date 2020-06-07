//
//  CourseDetailModel.h
//  GuXian
//
//  Created by menthu on 2020/6/7.
//  Copyright © 2020 menthu. All rights reserved.
//

#import "CouseListModel.h"
#import <CoreGraphics/CoreGraphics.h>

NS_ASSUME_NONNULL_BEGIN

@interface CourseSeriesModel : BaseModel


@property (nonatomic, strong) NSString *create_time;
@property (nonatomic, strong) NSString *picture;
@property (nonatomic, strong) NSString *series_desc;
@property (nonatomic, strong) NSString *series_id;
@property (nonatomic, assign) NSInteger series_old_price;
@property (nonatomic, assign) CGFloat series_price;
@property (nonatomic, strong) NSString *series_title;
@property (nonatomic, assign) NSInteger sort;

@end

@interface CourseDetailModel : BaseModel

@property (nonatomic, strong) NSArray <CouseListModel *> *courses;
@property (nonatomic, assign) NSInteger is_buy;
@property (nonatomic, strong) CourseSeriesModel *series;

@end

NS_ASSUME_NONNULL_END
