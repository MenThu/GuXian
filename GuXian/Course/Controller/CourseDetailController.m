//
//  CourseDetailController.m
//  GuXian
//
//  Created by menthu on 2020/5/4.
//  Copyright © 2020 menthu. All rights reserved.
//

#import "CourseDetailController.h"
#import "UIView+Extend.h"
#import "CourseDetailHeadView.h"
#import "CourseVideoListController.h"
#import "CourseTextInstruController.h"
#import "CourseDetailSegmentView.h"
#import "CommonHead.h"
#import <UIView+WebVideoCache.h>
#import "NetWorkManager+Extend.h"
#import "CourseDetailModel.h"
#import "DeviceManager.h"
#import <UIImageView+WebCache.h>

@interface CourseDetailController ()

@property (weak, nonatomic) IBOutlet UIView *playerView;
@property (weak, nonatomic) IBOutlet UIButton *buyButton;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *buyButtonHeight;
@property (nonatomic, assign) BOOL isBuyButtonShow;
@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bakcButtonTopSpace;
@property (nonatomic, strong) CourseDetailModel *detailModel;
@property (nonatomic, weak) CourseDetailHeadView *detailHeadView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *buybuttonHeight;
@property (weak, nonatomic) IBOutlet UIImageView *videoPlaceholdView;

@end

@implementation CourseDetailController

- (instancetype)init{
    self.isBuyButtonShow = YES;
    @weakify(self);
    CourseDetailSegmentView *segmentView = [CourseDetailSegmentView loadFromXib];
    segmentView.clickButtonCallBack = ^(NSInteger page) {
        @strongify(self);
        [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:page inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
    };
    CourseVideoListController *controller1 = [[CourseVideoListController alloc] init];
    controller1.clickVideoListCallBack = ^(CouseListModel * _Nonnull model) {
        @strongify(self);
        [self playVideoWithUrl:model.url];
    };
    CourseTextInstruController *controller2 = [[CourseTextInstruController alloc] init];
    NSArray <ContentController *> *controllerArrays = @[controller1, controller2];
    CourseDetailHeadView *detailHeadView = [CourseDetailHeadView loadFromXib];
    if (self = [super initWith:(_detailHeadView = detailHeadView) headHeight:110 segmentView:segmentView segmentHeight:60 contentController:controllerArrays]) {
    }
    return self;
}

- (void)setSeriesId:(NSString *)seriesId{
    _seriesId = seriesId;
    [NetWorkManager courseSelectList:self.seriesId toastView:self.view callBack:^(BOOL isSucc, CourseDetailModel * _Nullable detailModel) {
        self.detailModel = detailModel;
        self.detailHeadView.model = detailModel.series;
        CourseVideoListController *videoListController = (CourseVideoListController *)self.contentControllerArray.firstObject;
        videoListController.tableSource = detailModel.courses;
        CourseTextInstruController *intruductionController = (CourseTextInstruController *)self.contentControllerArray.lastObject;
        intruductionController.courseDesc = detailModel.series.series_desc;
        [self.videoPlaceholdView sd_setImageWithURL:[NSURL URLWithString:detailModel.series.picture]];
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.bounds = UIScreen.mainScreen.bounds;
    [self.view setNeedsLayout];
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    CGFloat scrollViewWidth = CGRectGetWidth(self.view.bounds);
    CGFloat playerViewHeight = CGRectGetHeight(self.playerView.bounds);
    CGFloat scrollViewHeight = CGRectGetHeight(self.view.bounds) - playerViewHeight;
    CGSize scrollContentSize = CGSizeMake(scrollViewWidth, 0);
    CGFloat controllerHeight = CGRectGetHeight(self.view.bounds);
    if (self.isBuyButtonShow) {
        scrollViewHeight -= CGRectGetHeight(self.buyButton.bounds);
        self.buyButton.hidden = NO;
        [self.view bringSubviewToFront:self.buyButton];
        scrollContentSize.height = 100;
        scrollContentSize.height = controllerHeight-self.buyButtonHeight.constant-playerViewHeight+self.headHeight;
    }else{
        self.buyButton.hidden = YES;
        scrollContentSize.height = controllerHeight-playerViewHeight+self.headHeight;
    }
    self.scrollView.frame = CGRectMake(0,
                                       CGRectGetMaxY(self.playerView.bounds),
                                       scrollViewWidth,
                                       scrollViewHeight);
    self.scrollView.contentSize = scrollContentSize;
    self.headView.frame = CGRectMake(0, 0, scrollViewWidth, self.headHeight);
    self.segmentView.frame = CGRectMake(0, CGRectGetMaxY(self.headView.frame), scrollViewWidth, self.segmentHeight);
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *)self.collectionView.collectionViewLayout;
    layout.itemSize = CGSizeMake(scrollViewWidth, scrollViewHeight-self.segmentHeight);
    self.collectionView.frame = CGRectMake(0, CGRectGetMaxY(self.segmentView.frame), scrollViewWidth, layout.itemSize.height);
    self.bakcButtonTopSpace.constant = getStatusBarHeight()+10;
    self.buybuttonHeight.constant = bottomHeight()+50;
}

- (IBAction)buyAction:(UIButton *)sender{
}

- (void)pageDidChange:(NSInteger)currentPage{
    CourseDetailSegmentView *segmentView = (CourseDetailSegmentView *)self.segmentView;
    segmentView.selectIndex = currentPage;
}

- (void)playVideoWithUrl:(NSString *)url{
    NSString *videoString = url;
    [self.videoPlaceholdView jp_playVideoWithURL:[NSURL URLWithString:videoString]
                      bufferingIndicator:nil
                             controlView:nil
                            progressView:nil
                           configuration:nil];
    [self.view bringSubviewToFront:self.backButton];
}

- (IBAction)backButton:(UIButton *)sender {
    [self backController];
}

- (void)dealloc{
    [self.playerView jp_stopPlay];
}


@end
