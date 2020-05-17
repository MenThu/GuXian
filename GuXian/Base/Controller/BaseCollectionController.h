//
//  BaseCollectionController.h
//  GuXian
//
//  Created by menthu on 2020/5/17.
//  Copyright © 2020 menthu. All rights reserved.
//

#import "BaseController.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaseCollectionController : BaseController <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, weak, readonly) UICollectionView *pageCollectionView;

@end

NS_ASSUME_NONNULL_END
