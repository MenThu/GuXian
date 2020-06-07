//
//  MainTableController.h
//  SegmentController
//
//  Created by MenThu on 2018/3/3.
//  Copyright © 2018年 MenThu. All rights reserved.
//

#import "BaseController.h"
#import "ContentController.h"

@interface MainTableController : BaseController

@property (nonatomic, weak, readonly) UIScrollView *scrollView;
@property (nonatomic, weak, readonly) UICollectionView *collectionView;
@property (nonatomic, strong, readonly) UIView *headView;
@property (nonatomic, assign, readonly) CGFloat headHeight;
@property (nonatomic, strong, readonly) UIView *segmentView;
@property (nonatomic, assign, readonly) CGFloat segmentHeight;
@property (nonatomic, strong, readonly) NSArray <ContentController *> *contentControllerArray;

- (instancetype)initWith:(UIView *)headView
              headHeight:(CGFloat)headHeight
             segmentView:(UIView *)segmentView
           segmentHeight:(CGFloat)segmentHeight
       contentController:(NSArray <ContentController *> *)contentControllerArray;

- (void)userBeginTapOrDrag:(CGPoint)point;

- (void)pageDidChange:(NSInteger)currentPage;

@end
