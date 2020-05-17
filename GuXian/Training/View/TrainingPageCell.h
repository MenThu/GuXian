//
//  TrainingPageCell.h
//  GuXian
//
//  Created by menthu on 2020/5/17.
//  Copyright © 2020 menthu. All rights reserved.
//

#import "BaseCollectionCell.h"
#import "ExamDetailModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface TrainingPageCell : BaseCollectionCell

@property (nonatomic, weak) ExamDetailModel *model;

@end

NS_ASSUME_NONNULL_END
