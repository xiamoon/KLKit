//
//  NSArray+KLKit.m
//  Gailvlun
//
//  Created by liqian on 2018/6/14.
//  Copyright © 2018年 ShitWillDie. All rights reserved.
//

#import "NSArray+KLKit.h"

@implementation NSArray (KLKit)

- (BOOL)isValidArray {
    return [self isKindOfClass:[NSArray class]];
}

- (BOOL)isPracticalArray {
    if (![self isValidArray]) {
        return NO;
    }
    return self.count > 0;
}

@end
