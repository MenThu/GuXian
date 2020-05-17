//
//  BaseCollectionController.m
//  GuXian
//
//  Created by menthu on 2020/5/17.
//  Copyright © 2020 menthu. All rights reserved.
//

#import "BaseCollectionController.h"
#import <Masonry.h>

@interface BaseCollectionController () 

@property (nonatomic, weak, readwrite) UICollectionView *pageCollectionView;

@end

@implementation BaseCollectionController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.sectionInset = UIEdgeInsetsZero;
    flowLayout.minimumLineSpacing = flowLayout.minimumInteritemSpacing = 0;
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    UICollectionView *pageCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    pageCollectionView.backgroundColor = UIColor.whiteColor;
    pageCollectionView.pagingEnabled = YES;
    pageCollectionView.showsHorizontalScrollIndicator = NO;
    pageCollectionView.dataSource = (id<UICollectionViewDataSource>)self;
    pageCollectionView.delegate = (id<UICollectionViewDelegate>)self;
    [self.view addSubview:(_pageCollectionView = pageCollectionView)];
    [pageCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    UICollectionViewFlowLayout *flowLayout = (UICollectionViewFlowLayout *)self.pageCollectionView.collectionViewLayout;
    flowLayout.itemSize = self.pageCollectionView.bounds.size;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 0;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    return nil;
}

@end
