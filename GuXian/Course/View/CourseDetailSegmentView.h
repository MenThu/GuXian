//
//  CourseDetailSegmentView.h
//  GuXian
//
//  Created by menthu on 2020/5/5.
//  Copyright © 2020 menthu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CourseDetailSegmentView : UIView

@property (nonatomic, assign) NSInteger selectIndex;
@property (nonatomic, copy) void (^clickButtonCallBack) (NSInteger page);

@end

NS_ASSUME_NONNULL_END
