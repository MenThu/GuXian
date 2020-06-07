//
//  JobCellModel.h
//  GuXian
//
//  Created by menthu on 2020/6/7.
//  Copyright © 2020 menthu. All rights reserved.
//

#import "BaseCellModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobCellModel : BaseCellModel

@property (nonatomic, assign) NSInteger job_id;
@property (nonatomic, strong) NSString *job_thumb;
@property (nonatomic, strong) NSString *publish_time;
@property (nonatomic, strong) NSString *deadline;
@property (nonatomic, strong) NSString *job_title;
@property (nonatomic, strong) NSString *create_time;
@property (nonatomic, strong) NSString *city_name;
@property (nonatomic, assign) NSInteger job_number;
@property (nonatomic, strong) NSString *job_school;

@end

NS_ASSUME_NONNULL_END
