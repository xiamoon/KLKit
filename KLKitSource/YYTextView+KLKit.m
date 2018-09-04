//
//  YYTextView+KLKit.m
//  Gailvlun
//
//  Created by liqian on 2018/6/11.
//  Copyright © 2018年 ShitWillDie. All rights reserved.
//

#import "YYTextView+KLKit.h"

@implementation YYTextView (KLKit)

- (void)kl_limitTextWithLength:(NSInteger)maxLength outLimit:(void (^)(void))outLimit {
    NSString *currentString = self.text;
    NSInteger textLength = [currentString qmui_lengthWhenCountingNonASCIICharacterAsTwo];

    if (textLength > maxLength) {
        self.text = [currentString qmui_substringAvoidBreakingUpCharacterSequencesToIndex:maxLength lessValue:YES countingNonASCIICharacterAsTwo:YES];
        if (outLimit) {
            outLimit();
        }
    }
}

@end
