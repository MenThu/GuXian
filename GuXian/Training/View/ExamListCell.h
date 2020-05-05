//
//  ExamListCell.h
//  GuXian
//
//  Created by menthu on 2020/5/4.
//  Copyright © 2020 menthu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface ExamListCell <ModelType:BaseCellModel *> : BaseCell <ModelType>

@property (nonatomic, weak, readonly) UILabel *titleLabel;
@property (nonatomic, weak, readonly) UILabel *detailLabelOne;
@property (nonatomic, weak, readonly) UILabel *detailLabelTwo;

@end

NS_ASSUME_NONNULL_END
