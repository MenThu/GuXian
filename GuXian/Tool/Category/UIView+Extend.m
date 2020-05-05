//
//  UIView+Extend.m
//  GuXian
//
//  Created by menthu on 2020/5/4.
//  Copyright © 2020 menthu. All rights reserved.
//

#import "UIView+Extend.h"

@implementation UIView (Extend)

+ (instancetype)loadFromXib{
    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil].lastObject;
}

@end
