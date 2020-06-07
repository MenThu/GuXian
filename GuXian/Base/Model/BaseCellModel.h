//
//  BaseCellModel.h
//  GuXian
//
//  Created by menthu on 2020/5/4.
//  Copyright © 2020 menthu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaseCellModel : BaseModel

/// cell宽度
@property (nonatomic, assign) CGFloat cellWidth;

/// cell高度
@property (nonatomic, assign) CGFloat cellHeight;

@end

NS_ASSUME_NONNULL_END
