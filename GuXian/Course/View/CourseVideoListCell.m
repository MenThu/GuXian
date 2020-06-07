//
//  CourseVideoListCell.m
//  GuXian
//
//  Created by menthu on 2020/6/7.
//  Copyright © 2020 menthu. All rights reserved.
//

#import "CourseVideoListCell.h"

@interface CourseVideoListCell ()

@property (weak, nonatomic) IBOutlet UILabel *courseLabel;


@end

@implementation CourseVideoListCell

- (void)setModel:(CouseListModel *)model{
    _model = model;
    self.courseLabel.text = model.course_title;
}

@end
