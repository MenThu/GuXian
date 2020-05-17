//
//  TrainingPageController.m
//  GuXian
//
//  Created by menthu on 2020/5/17.
//  Copyright © 2020 menthu. All rights reserved.
//

#import "TrainingPageController.h"
#import "ExamDetailController.h"
#import "ExamDetailModel.h"
#import "TrainingPageCell.h"

@interface TrainingPageController ()

@property (nonatomic, strong) NSMutableArray <ExamDetailModel *> *pageArray;

@end

@implementation TrainingPageController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"刷题";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] init];
    self.pageArray = [NSMutableArray array];
    [self.pageCollectionView registerClass:TrainingPageCell.class forCellWithReuseIdentifier:@"TrainingPageCell"];
    for (NSInteger index = 0; index < 5; index ++) {
        [self.pageArray addObject:ExamDetailModel.new];
    }
    [self refreRightBarItemTile:0];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSInteger currentIndex = (NSInteger)(scrollView.contentOffset.x/scrollView.bounds.size.width +0.5);
    [self refreRightBarItemTile:currentIndex];
}

- (void)refreRightBarItemTile:(NSInteger)index{
    [self.navigationItem.rightBarButtonItem setTitle:[NSString stringWithFormat:@"%d/%d", (int)(index+1), (int)self.pageArray.count]];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.pageArray.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    TrainingPageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TrainingPageCell" forIndexPath:indexPath];
    cell.model = self.pageArray[indexPath.row];
    return cell;
}

@end
