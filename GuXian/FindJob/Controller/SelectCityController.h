//
//  SelectCityController.h
//  GuXian
//
//  Created by menthu on 2020/5/3.
//  Copyright © 2020 menthu. All rights reserved.
//

#import "BaseTableViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface SelectCityController : BaseTableViewController

@property (nonatomic, copy) void (^ _Nullable callBack) (NSString * _Nullable cityName);

@end

NS_ASSUME_NONNULL_END
