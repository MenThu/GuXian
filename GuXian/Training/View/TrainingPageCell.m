//
//  TrainingPageCell.m
//  GuXian
//
//  Created by menthu on 2020/5/17.
//  Copyright © 2020 menthu. All rights reserved.
//

#import "TrainingPageCell.h"
#import "ExamDetailController.h"

@interface TrainingPageCell ()

@property (nonatomic, strong) ExamDetailController *contentController;

@end

@implementation TrainingPageCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        NSLog(@"TrainingPageCell initWithFrame=[%p]", self);
        ExamDetailController *contentController = [[ExamDetailController alloc] init];
        self.contentController = contentController;
        [self.contentView addSubview:contentController.view];
    }
    return self;
}

- (void)setModel:(ExamDetailModel *)model{
    _model = model;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.contentController.view.frame = self.contentView.bounds;
}

@end
