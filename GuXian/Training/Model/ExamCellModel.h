//
//  ExamCellModel.h
//  GuXian
//
//  Created by menthu on 2020/5/4.
//  Copyright © 2020 menthu. All rights reserved.
//

#import "BaseCellModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ExamCellModel : BaseCellModel

@property (nonatomic, strong) NSString *titleText;
@property (nonatomic, strong) NSString *detailOneText;
@property (nonatomic, strong) NSString *detailTwoText;

@end

NS_ASSUME_NONNULL_END
