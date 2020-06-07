//
//  CourceListCell.m
//  GuXian
//
//  Created by menthu on 2020/5/4.
//  Copyright © 2020 menthu. All rights reserved.
//

#import <Masonry.h>
#import <SDWebImage.h>
#import "CourceListCell.h"
#import "CourseCellModel.h"

static CGFloat const IMG_COVER_WIDTH = 100.f;
static CGFloat const IMG_COVER_HEIGHT = 60.f;

@interface CourceListCell ()

@property (nonatomic, weak, readwrite) UIImageView *courseCoverImgView;

@end

@implementation CourceListCell

- (void)configCellContentView{
    [super configCellContentView];
    UIImageView *courseCoverImgView = [[UIImageView alloc] init];
    courseCoverImgView.contentMode = UIViewContentModeScaleAspectFill;
    courseCoverImgView.clipsToBounds = YES;
    courseCoverImgView.backgroundColor = UIColor.orangeColor;
    [self.contentView addSubview:(_courseCoverImgView = courseCoverImgView)];
    
    self.titleLabel.font = [UIFont boldSystemFontOfSize:15];
    self.titleLabel.numberOfLines = 2;
    
    [courseCoverImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self.contentView).offset(10);
        make.size.mas_equalTo(CGSizeMake(IMG_COVER_WIDTH, IMG_COVER_HEIGHT));
    }];
    
    [self.titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(courseCoverImgView);
        make.left.equalTo(courseCoverImgView.mas_right).offset(10);
        make.right.equalTo(self.contentView).offset(-10);
    }];
    
    [self.detailLabelOne mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLabel);
        make.bottom.equalTo(courseCoverImgView);
    }];
    
    [self.detailLabelTwo mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.titleLabel);
        make.bottom.equalTo(courseCoverImgView);
    }];
}

- (CGFloat)getCellHeightIn:(CGFloat)width withModel:(BaseCellModel *)model{
    return IMG_COVER_HEIGHT + 20;
}

- (void)setCellModel:(BaseCellModel *)cellModel{
    [super setCellModel:cellModel];
    CourseCellModel *tempModel = (CourseCellModel *)cellModel;
    [self.courseCoverImgView sd_setImageWithURL:[NSURL URLWithString:tempModel.picture]];
    self.titleLabel.text = tempModel.series_title;
    self.detailLabelOne.text = tempModel.detailOneText;
    self.detailLabelTwo.text = tempModel.detailTwoText;
}

@end






