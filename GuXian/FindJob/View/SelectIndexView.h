//
//  SelectIndexView.h
//  GuXian
//
//  Created by menthu on 2020/5/3.
//  Copyright © 2020 menthu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SelectIndexView : UIView

@property (nonatomic, weak) NSArray <NSString *> *allKeys;
@property (nonatomic, copy) void (^clickCallBack) (NSInteger status, NSInteger index);


@end

NS_ASSUME_NONNULL_END
