//
//  ContentController.m
//  SegmentController
//
//  Created by MenThu on 2018/3/3.
//  Copyright © 2018年 MenThu. All rights reserved.
//

#import "ContentController.h"
#import "ContentTableView.h"

@interface ContentController ()

@property (nonatomic, assign) CGFloat currentOffset;

@end

@implementation ContentController

#pragma mark - LifeCircle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.currentOffset = 0;
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    self.contentScrollView.frame = self.view.bounds;
}

#pragma mark - Private
- (void)scrollViewScroll{
    CGFloat newOffsetY = self.contentScrollView.contentOffset.y;
    CGFloat minus = newOffsetY - self.currentOffset;
    if (minus > 0) {//drag up
        if (self.currentOffset < 0) {
            newOffsetY = MIN(newOffsetY, 0);
        }else{
            if (self.mainScrollView.contentOffset.y < self.mainScrollViewMaxOffsetY) {
                newOffsetY = self.currentOffset;
            }
        }
    }else{//drag down
        if (self.currentOffset > 0) {
            newOffsetY = MAX(newOffsetY, 0);
        }else{
            if (self.mainScrollView.contentOffset.y > 0) {
                newOffsetY = self.currentOffset;
            }
        }
    }
    self.contentScrollView.contentOffset = CGPointMake(0, newOffsetY);
    self.currentOffset = newOffsetY;
}

- (void)setContentScrollView:(UIScrollView *)contentScrollView{
    _contentScrollView = contentScrollView;
    contentScrollView.showsVerticalScrollIndicator = NO;
}

@end
