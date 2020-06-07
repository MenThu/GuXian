//
//  CouseListModel.h
//  GuXian
//
//  Created by menthu on 2020/6/7.
//  Copyright © 2020 menthu. All rights reserved.
//

#import "BaseCellModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface CouseListModel : BaseCellModel

@property (nonatomic, strong) NSString *course_desc;
@property (nonatomic, strong) NSString *course_id;
@property (nonatomic, strong) NSString *course_title;
@property (nonatomic, strong) NSString *create_time;
@property (nonatomic, strong) NSString *picture;
@property (nonatomic, strong) NSString *series_id;
@property (nonatomic, strong) NSString *url;

@end

NS_ASSUME_NONNULL_END
