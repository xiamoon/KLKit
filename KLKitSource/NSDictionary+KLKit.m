//
//  NSDictionary+KLKit.m
//  Gailvlun
//
//  Created by liqian on 2018/6/14.
//  Copyright © 2018年 ShitWillDie. All rights reserved.
//

#import "NSDictionary+KLKit.h"

@implementation NSDictionary (KLKit)

- (BOOL)isValidDict {
    return [self isKindOfClass:[NSDictionary class]];
}

- (BOOL)isPracticalDict {
    if (![self isValidDict]) {
        return NO;
    }
    return self.allKeys.count > 0;
}

@end
