//
//  CourceListCell.h
//  GuXian
//
//  Created by menthu on 2020/5/4.
//  Copyright © 2020 menthu. All rights reserved.
//

#import "ExamListCell.h"

NS_ASSUME_NONNULL_BEGIN


/// 没想到泛型加上类继承这么难用，这里就用这一次吧，以后还是用__kindof或者基类公开行为
@interface CourceListCell <ModelType: BaseCellModel *> : ExamListCell <ModelType>

@property (nonatomic, weak, readonly) UIImageView *courseCoverImgView;

@end

NS_ASSUME_NONNULL_END
