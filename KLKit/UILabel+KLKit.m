//
//  UILabel+KLKit.m
//  KLKit
//
//  Created by 李乾 on 2018/3/24.
//  Copyright © 2018年 liqian. All rights reserved.
//

#import "UILabel+KLKit.h"
#import "UIView+KLKit.h"

@implementation UILabel (KLKit)

+ (UILabel *)kl_defaultAlignCenterLabelWithY:(CGFloat)y {
    UILabel *label = [UILabel new];
    UIScreen *screen = [UIScreen mainScreen];
    label.kl_frame(0, y, screen.bounds.size.width, 20).kl_textAlignment(NSTextAlignmentCenter).kl_text(@"Label").kl_textColor([UIColor blackColor]);
    return label;
}

- (id<KLProperty>)kl_default {
    return self.kl_frame(20, 20, 80, 20)
    .kl_bgColor([UIColor grayColor])
    .kl_text(@"Label")
    .kl_fontSize(15);
}

- (id<KLProperty> (^)(NSString *))kl_text {
    return ^id<KLProperty> (NSString *text) {
        self.text = text;
        return self;
    };
}

- (id<KLProperty> (^)(UIColor *))kl_textColor {
    return ^id<KLProperty> (UIColor *color) {
        self.textColor = color;
        return self;
    };
}

- (id<KLProperty> (^)(u_int64_t))kl_textColorHex {
    return ^id<KLProperty> (u_int64_t hex) {
        self.textColor = [self _colorFromHexValue:hex];
        return self;
    };
}

- (id<KLProperty> (^)(UIFont *))kl_font {
    return ^id<KLProperty> (UIFont *font) {
        self.font = font;
        return self;
    };
}

- (id<KLProperty> (^)(CGFloat))kl_fontSize {
    return ^id<KLProperty> (CGFloat fs) {
        self.font = [UIFont systemFontOfSize:fs];
        return self;
    };
}

- (id<KLProperty> (^)(CGFloat))kl_fontSizeMedium {
    return ^id<KLProperty> (CGFloat fs) {
        self.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:fs];
        return self;
    };
}

- (id<KLProperty> (^)(CGFloat))kl_fontSizeBold {
    return ^id<KLProperty> (CGFloat fs) {
        self.font = [UIFont boldSystemFontOfSize:fs];
        return self;
    };
}

- (id<KLProperty> (^)(NSTextAlignment))kl_textAlignment {
    return ^id<KLProperty> (NSTextAlignment ta) {
        self.textAlignment = ta;
        return self;
    };
}

- (id<KLProperty> (^)(CGFloat))kl_lines {
    return ^id<KLProperty> (CGFloat lines) {
        self.numberOfLines = lines;
        return self;
    };
}

- (id<KLProperty> (^)(NSLineBreakMode))kl_lineBreakMode {
    return ^id<KLProperty> (NSLineBreakMode mode) {
        self.lineBreakMode = mode;
        return self;
    };
}

- (UIColor *)_colorFromHexValue:(u_int64_t)hex {
    return [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16)) / 255.0
                           green:((float)((hex & 0xFF00) >> 8)) / 255.0
                            blue:((float)(hex & 0xFF)) / 255.0 alpha:1.0];
}

@end
