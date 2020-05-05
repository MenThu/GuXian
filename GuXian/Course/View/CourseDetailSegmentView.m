//
//  CourseDetailSegmentView.m
//  GuXian
//
//  Created by menthu on 2020/5/5.
//  Copyright © 2020 menthu. All rights reserved.
//

#import "CourseDetailSegmentView.h"

@interface CourseDetailSegmentView ()

@property (weak, nonatomic) IBOutlet UIView *indexView;
@property (weak, nonatomic) IBOutlet UIButton *courseButton;
@property (weak, nonatomic) IBOutlet UIButton *intruceButton;

@end

@implementation CourseDetailSegmentView

- (void)layoutSubviews{
    [super layoutSubviews];
    [self changeIndexViewFrameWithAnimate:NO];
}

- (void)awakeFromNib{
    [super awakeFromNib];
}

- (void)setSelectIndex:(NSInteger)selectIndex{
    if (_selectIndex != selectIndex) {
        _selectIndex = selectIndex;
        [self changeIndexViewFrameWithAnimate:YES];
    }
}

- (void)changeIndexViewFrameWithAnimate:(BOOL)isAnimate{
    UIButton *selectButton = self.selectIndex == 0 ? self.courseButton : self.intruceButton;
    CGFloat viewHeight = 2;
    CGFloat viewWidth = [selectButton sizeThatFits:CGSizeMake(MAXFLOAT, 30)].width;
    dispatch_block_t changeFrameBlock = ^(){
        self.indexView.frame = CGRectMake(CGRectGetMidX(selectButton.frame)-viewWidth/2,
                                          CGRectGetHeight(self.bounds)-viewHeight,
                                          viewWidth,
                                          viewHeight);
    };
    if (isAnimate) {
        [UIView animateWithDuration:0.25 animations:^{
            changeFrameBlock();
        }];
    }else{
        changeFrameBlock();
    }
    [self changeButtonColor:selectButton];
}
         
- (IBAction)clickButton:(UIButton *)sender {
    if (sender.selected) {
        return;
    }
    if (self.clickButtonCallBack) {
        self.clickButtonCallBack(sender.tag);
    }
    self.selectIndex = sender.tag;
    [self changeButtonColor:sender];
}

- (void)changeButtonColor:(UIButton *)selectButton{
    UIButton *unSelectButton = nil;
    if (selectButton == self.courseButton) {
        unSelectButton = self.intruceButton;
    }else{
        unSelectButton = self.courseButton;
    }
    selectButton.selected = YES;
    unSelectButton.selected = NO;
}


@end
