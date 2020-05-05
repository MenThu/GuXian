//
//  CitySectionHead.m
//  GuXian
//
//  Created by menthu on 2020/5/3.
//  Copyright © 2020 menthu. All rights reserved.
//

#import "CitySectionHead.h"
#import "Masonry.h"
#import "CommonHead.h"

@interface CitySectionHead ()

@property (nonatomic, weak, readwrite) UILabel *firstCharasetLabel;

@end

@implementation CitySectionHead

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        self.contentView.backgroundColor = RGBA(240, 243, 246, 1);
        UILabel *firstCharasetLabel = UILabel.new;
        firstCharasetLabel.textColor = UIColor.grayColor;
        [self.contentView addSubview:(_firstCharasetLabel = firstCharasetLabel)];
        
        @weakify(self);
        [firstCharasetLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            @strongify(self);
            make.top.bottom.equalTo(self.contentView);
            make.left.equalTo(self.contentView).offset(10);
        }];
    }
    return self;
}

@end
