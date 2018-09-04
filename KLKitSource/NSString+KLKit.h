//
//  NSString+KLKit.h
//  Gailvlun
//
//  Created by 李乾 on 2018/5/15.
//  Copyright © 2018年 ShitWillDie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (KLKit)

- (BOOL)isValidPhoneNumber;
- (BOOL)isValidString;
- (BOOL)isPracticalString;
- (BOOL)vertifyWithRegexString:(NSString *)regex;

@end
