//
//  ExamListCell.m
//  GuXian
//
//  Created by menthu on 2020/5/4.
//  Copyright © 2020 menthu. All rights reserved.
//

#import "ExamListCell.h"
#import "Masonry.h"

@interface ExamListCell ()

@property (nonatomic, weak, readwrite) UILabel *titleLabel;
@property (nonatomic, weak, readwrite) UILabel *detailLabelOne;
@property (nonatomic, weak, readwrite) UILabel *detailLabelTwo;

@end

@implementation ExamListCell

- (void)configCellContentView{
    [super configCellContentView];
    UILabel *titleLabel = [self getLabel];
    titleLabel.text = @"中国矿业大学2018年行政岗位面试真题";
    titleLabel.font = [UIFont systemFontOfSize:15];
    titleLabel.textColor = [UIColor blackColor];
    [self.contentView addSubview:(_titleLabel = titleLabel)];
    
    UILabel *detailLabelOne = [self getLabel];
    detailLabelOne.text = @"共计：100题";
    [self.contentView addSubview:(_detailLabelOne = detailLabelOne)];
    
    UILabel *detailLabelTwo = [self getLabel];
    detailLabelTwo.text = @"共计：26人观看";
    [self.contentView addSubview:(_detailLabelTwo = detailLabelTwo)];
    
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self.contentView).offset(10);
    }];
    
    [detailLabelOne mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(titleLabel);
        make.bottom.equalTo(self.contentView).offset(-10);
    }];
    
    [detailLabelTwo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(detailLabelOne.mas_right).offset(100);
        make.bottom.equalTo(detailLabelOne);
    }];
}

- (UILabel *)getLabel{
    UILabel *label = [UILabel new];
    label.textColor = UIColor.lightGrayColor;
    label.font = [UIFont systemFontOfSize:13];
    label.textAlignment = NSTextAlignmentLeft;
    return label;
}

@end
