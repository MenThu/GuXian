//
//  BaseCell.h
//  GuXian
//
//  Created by menthu on 2020/5/4.
//  Copyright © 2020 menthu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseCellModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaseCell <ModelType:BaseCellModel *> : UITableViewCell

/// 计算Cell所需要的高度
/// @param width cell宽度
/// @param model 模型
- (CGFloat)getCellHeightIn:(CGFloat)width withModel:(ModelType)model;


/// 配置内容视图
- (void)configCellContentView;

/// cell的数据模型
@property (nonatomic, weak) ModelType cellModel;

@end

NS_ASSUME_NONNULL_END
