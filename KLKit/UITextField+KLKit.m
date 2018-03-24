//
//  UITextField+KLKit.m
//  KLKit
//
//  Created by 李乾 on 2018/3/24.
//  Copyright © 2018年 liqian. All rights reserved.
//

#import "UITextField+KLKit.h"

@implementation UITextField (KLKit)

- (id<KLProperty>)kl_default {
    return self.kl_tfBorderStyle(UITextBorderStyleRoundedRect);
}

- (id<KLProperty> (^)(UITextBorderStyle))kl_tfBorderStyle {
    return ^id<KLProperty> (UITextBorderStyle style) {
        self.borderStyle = style;
        return self;
    };
}

- (id<KLProperty> (^)(NSString *))kl_tfText {
    return ^id<KLProperty> (NSString *text) {
        self.text = text;
        return self;
    };
}

- (id<KLProperty> (^)(UIColor *))kl_tfTextColor {
    return ^id<KLProperty> (UIColor *color) {
        self.textColor = color;
        return self;
    };
}

- (id<KLProperty> (^)(u_int64_t))kl_tfTextColorHex {
    return ^id<KLProperty> (u_int64_t hex) {
        UIColor *color = [self _colorFromHexValue:hex];
        self.textColor = color;
        return self;
    };
}

- (id<KLProperty> (^)(UIFont *))kl_tfFont {
    return ^id<KLProperty> (UIFont *font) {
        self.font = font;
        return self;
    };
}

- (id<KLProperty> (^)(NSString *))kl_tfPlaceHolderText {
    return ^id<KLProperty> (NSString *text) {
        self.placeholder = text;
        return self;
    };
}


- (UIColor *)_colorFromHexValue:(u_int64_t)hex {
    return [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16)) / 255.0
                           green:((float)((hex & 0xFF00) >> 8)) / 255.0
                            blue:((float)(hex & 0xFF)) / 255.0 alpha:1.0];
}


@end
