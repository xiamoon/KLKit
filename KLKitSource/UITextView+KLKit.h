//
//  UITextView+KLKit.h
//  KLKit
//
//  Created by 李乾 on 2018/3/24.
//  Copyright © 2018年 liqian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KLProperty.h"

@interface UITextView (KLKit) <KLProperty>

- (void)kl_limitTextWithLength:(NSInteger)maxLength outLimit:(void(^)(void))outLimit;

- (void)kl_limitTextWithLength:(NSInteger)maxLength
        countingNonASCIICharacterAsTwo:(BOOL)asTwo
                      outLimit:(void (^)(void))outLimit;

@end
