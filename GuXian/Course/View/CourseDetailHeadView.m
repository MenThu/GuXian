//
//  CourseDetailHeadView.m
//  GuXian
//
//  Created by menthu on 2020/5/4.
//  Copyright © 2020 menthu. All rights reserved.
//

#import "CourseDetailHeadView.h"

@interface CourseDetailHeadView ()

@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *courseDesc;
@property (weak, nonatomic) IBOutlet UILabel *pricelLabel;

@end

@implementation CourseDetailHeadView

- (void)setModel:(CourseSeriesModel *)model{
    _model = model;
    self.title.text = model.series_title;
    self.courseDesc.text = model.series_desc;
    self.pricelLabel.text = [NSString stringWithFormat:@"￥%.1f", model.series_price];
}



@end
