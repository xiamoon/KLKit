//
//  YYTextView+KLKit.h
//  Gailvlun
//
//  Created by liqian on 2018/6/11.
//  Copyright © 2018年 ShitWillDie. All rights reserved.
//

#import <YYKit/YYKit.h>

@interface YYTextView (KLKit)

- (void)kl_limitTextWithLength:(NSInteger)maxLength outLimit:(void(^)(void))outLimit;

@end
