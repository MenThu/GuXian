//
//  CourseCellModel.h
//  GuXian
//
//  Created by menthu on 2020/5/4.
//  Copyright © 2020 menthu. All rights reserved.
//

#import "ExamCellModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface CourseCellModel : ExamCellModel

@property (nonatomic, assign) NSInteger is_buy;
@property (nonatomic, assign) NSInteger sort;
@property (nonatomic, strong) NSString *series_id;
@property (nonatomic, assign) NSInteger look_count;
@property (nonatomic, assign) NSInteger series_old_price;
@property (nonatomic, assign) NSInteger course_count;
@property (nonatomic, strong) NSString *series_desc;
@property (nonatomic, strong) NSString *series_title;
@property (nonatomic, strong) NSString *create_time;
@property (nonatomic, strong) NSString *picture;
@property (nonatomic, assign) NSInteger series_price;

@end

NS_ASSUME_NONNULL_END
