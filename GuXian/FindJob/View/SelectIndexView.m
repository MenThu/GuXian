//
//  SelectIndexView.m
//  GuXian
//
//  Created by menthu on 2020/5/3.
//  Copyright © 2020 menthu. All rights reserved.
//

#import "SelectIndexView.h"
#import <CoreGraphics/CoreGraphics.h>

@interface SelectIndexView ()

@end

@implementation SelectIndexView

- (void)setAllKeys:(NSArray<NSString *> *)allKeys{
    _allKeys = allKeys;
    //其实这里可以算差值，多了删除，少了增加，但为了快，就偷下懒吧
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    for (NSInteger index = 0; index < allKeys.count; index ++) {
        UILabel *keyLabel = UILabel.new;
        keyLabel.tag = index;
        keyLabel.text = allKeys[index];
        keyLabel.textAlignment = NSTextAlignmentCenter;
        keyLabel.textColor = UIColor.grayColor;
        keyLabel.font = [UIFont systemFontOfSize:13];
        [self addSubview:keyLabel];
    }
    [self setNeedsLayout];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    CGFloat width = CGRectGetWidth(self.bounds);
    CGFloat height = CGRectGetHeight(self.bounds)/self.subviews.count;
    CGFloat lastLabelMaxY = 0;
    for (UILabel *keyLabel in self.subviews) {
        keyLabel.frame = CGRectMake(0, lastLabelMaxY, width, height);
        lastLabelMaxY = CGRectGetMaxY(keyLabel.frame);
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"%s", __func__);
    [self searchClickCity:touches.anyObject status:0];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"%s", __func__);
    [self searchClickCity:touches.anyObject status:1];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if (self.clickCallBack) {
        self.clickCallBack(2, 0);
    }
}

- (void)searchClickCity:(UITouch *)touch status:(NSInteger)status{
    CGPoint point = [touch locationInView:self];
    for (UILabel *label in self.subviews) {
        if (CGRectContainsPoint(label.frame, point)) {
            if (self.clickCallBack) {
                self.clickCallBack(status, label.tag);
            }
            break;
        }
    }
}

@end
