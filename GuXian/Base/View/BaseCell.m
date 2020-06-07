//
//  BaseCell.m
//  GuXian
//
//  Created by menthu on 2020/5/4.
//  Copyright © 2020 menthu. All rights reserved.
//

#import "BaseCell.h"

@interface BaseCell ()

@end

@implementation BaseCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self configCellContentView];
    }
    return self;
}

- (void)configCellContentView{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (CGFloat)getCellHeightIn:(CGFloat)width withModel:(__kindof BaseCellModel *)model{
    NSAssert(NO, @"子类需要复写此方法");
    return 0;
}

@end
