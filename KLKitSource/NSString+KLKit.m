//
//  NSString+KLKit.m
//  Gailvlun
//
//  Created by 李乾 on 2018/5/15.
//  Copyright © 2018年 ShitWillDie. All rights reserved.
//

#import "NSString+KLKit.h"

@implementation NSString (KLKit)

- (BOOL)isValidPhoneNumber {
    if (![self isPracticalString]) return NO;
//    NSString *regex = @"1[345789]\\d{9}";
    NSString *regex = @"\\d+";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:self];
}

- (BOOL)isValidString {
    return [self isKindOfClass:[NSString class]];
}

- (BOOL)isPracticalString {
    if (![self isValidString]) {
        return NO;
    }
    return self.length > 0;
}

- (BOOL)vertifyWithRegexString:(NSString *)regex {
    if (![self isPracticalString]) return NO;
    if (![regex isPracticalString]) return NO;
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:self];
}

@end
