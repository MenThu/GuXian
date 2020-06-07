//
//  BaseCellModel.m
//  GuXian
//
//  Created by menthu on 2020/5/4.
//  Copyright © 2020 menthu. All rights reserved.
//

#import "BaseCellModel.h"
#import <UIKit/UIKit.h>

@implementation BaseCellModel

- (instancetype)init{
    if (self = [super init]) {
        self.cellWidth = UIScreen.mainScreen.bounds.size.width;
    }
    return self;
}

@end
