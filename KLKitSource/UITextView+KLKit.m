//
//  UITextView+KLKit.m
//  KLKit
//
//  Created by 李乾 on 2018/3/24.
//  Copyright © 2018年 liqian. All rights reserved.
//

#import "UITextView+KLKit.h"

@implementation UITextView (KLKit)

- (id<KLProperty> (^)(NSAttributedString *))kl_attributedText {
    return ^id<KLProperty> (NSAttributedString *text) {
        self.attributedText = text;
        return self;
    };
}

- (void)kl_limitTextWithLength:(NSInteger)maxLength outLimit:(void (^)(void))outLimit {
    [self kl_limitTextWithLength:maxLength countingNonASCIICharacterAsTwo:NO outLimit:outLimit];
}

- (void)kl_limitTextWithLength:(NSInteger)maxLength
                countingNonASCIICharacterAsTwo:(BOOL)asTwo
                      outLimit:(void (^)(void))outLimit {
    NSString *currentString = self.text;
    NSInteger textLength = 0;
    if (asTwo) {
        NSUInteger length = 0;
        for (NSUInteger i = 0, l = currentString.length; i < l; i++) {
            unichar character = [currentString characterAtIndex:i];
            if (isascii(character)) {
                length += 1;
            } else {
                length += 2;
            }
        }
        textLength = length;
    }else {
        textLength = currentString.length;
    }
    
    
    if (textLength > maxLength) {
        if (asTwo) {
            NSInteger index = [self transformIndexToDefaultModeWithIndex:maxLength withText:currentString];
            NSRange range = [currentString rangeOfComposedCharacterSequenceAtIndex:index];
            self.text = [currentString substringToIndex:range.location];
        }else {
            self.text = [currentString substringToIndex:maxLength];
        }
        
        if (outLimit) {
            outLimit();
        }
    }
}


- (NSUInteger)transformIndexToDefaultModeWithIndex:(NSUInteger)index
                                          withText:(NSString *)text {
    CGFloat strlength = 0.f;
    NSUInteger i = 0;
    for (i = 0; i < text.length; i++) {
        unichar character = [text characterAtIndex:i];
        if (isascii(character)) {
            strlength += 1;
        } else {
            strlength += 2;
        }
        if (strlength >= index + 1) return i;
    }
    return 0;
}

@end
