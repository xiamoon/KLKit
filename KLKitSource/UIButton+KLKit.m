//
//  UIButton+KLKit.m
//  KLKit
//
//  Created by 李乾 on 2018/3/24.
//  Copyright © 2018年 liqian. All rights reserved.
//

#import "UIButton+KLKit.h"
#import <objc/runtime.h>

const void *layoutTypeKey = "com.kaleo.klkit.layoutTypeKey";
const void *contentSpacingKey = "com.kaleo.klkit.contentSpacingKey";

@implementation UIButton (KLKit)

+ (UIButton *)customButton {
    return [UIButton buttonWithType:UIButtonTypeCustom];
}

- (id<KLProperty>)kl_default {
    return self.kl_frame(20, 50, 80, 30)
    .kl_bgColor([UIColor orangeColor])
    .kl_btnTitle(@"Button", KLNormal);
}

- (id<KLProperty> (^)(NSString *, KLControlState))kl_btnTitle {
    return ^id<KLProperty> (NSString *title, KLControlState state) {
        UIControlState _state = (UIControlState)state;
        [self setTitle:title forState:_state];
        return self;
    };
}

- (id<KLProperty> (^)(UIFont *))kl_font {
    return ^id<KLProperty> (UIFont *font) {
        self.titleLabel.font = font;
        return self;
    };
}

- (id<KLProperty> (^)(CGFloat))kl_fontSize {
    return ^id<KLProperty> (CGFloat fontSize) {
        self.titleLabel.font = [UIFont systemFontOfSize:fontSize];
        return self;
    };
}

- (id<KLProperty> (^)(CGFloat))kl_fontSizeMedium {
    return ^id<KLProperty> (CGFloat fs) {
        self.titleLabel.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:fs];
        return self;
    };
}

- (id<KLProperty> (^)(CGFloat))kl_fontSizeBold {
    return ^id<KLProperty> (CGFloat fs) {
        self.titleLabel.font = [UIFont boldSystemFontOfSize:fs];
        return self;
    };
}

- (id<KLProperty> (^)(UIColor *, KLControlState))kl_btnTitleColor {
    return ^id<KLProperty> (UIColor *color, KLControlState state) {
        UIControlState _state = (UIControlState)state;
        [self setTitleColor:color forState:_state];
        return self;
    };
}

- (id<KLProperty> (^)(u_int64_t, KLControlState))kl_btnTitleColorHex {
    return ^id<KLProperty> (u_int64_t hex, KLControlState state) {
        UIColor *_color = [self _colorFromHexValue:hex];
        UIControlState _state = (UIControlState)state;
        [self setTitleColor:_color forState:_state];
        return self;
    };
}

- (id<KLProperty> (^)(UIImage *, KLControlState))kl_btnImage {
    return ^id<KLProperty> (UIImage *image, KLControlState state) {
        UIControlState _state = (UIControlState)state;
        [self setImage:image forState:_state];
        return self;
    };
}

- (id<KLProperty> (^)(UIImage *, KLControlState))kl_btnBgImage {
    return ^id<KLProperty> (UIImage *image, KLControlState state) {
        UIControlState _state = (UIControlState)state;
        [self setBackgroundImage:image forState:_state];
        return self;
    };
}

- (id<KLProperty> (^)(KLBtnLayoutType))kl_btnLayoutType {
    return ^id<KLProperty> (KLBtnLayoutType type) {
        self.layoutType = type;
        
        // TODO..
        
        return self;
    };
}

- (id<KLProperty> (^)(CGFloat))kl_btnContentSpacing {
    return ^id<KLProperty> (CGFloat cs) {
        self.contentSpacing = cs;
        
        // TODO.
        
        return self;
    };
}

- (id<KLProperty> (^)(id, SEL))kl_btnAction {
    return ^id<KLProperty> (id target, SEL sel) {
        [self addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];
        return self;
    };
}



- (void)setLayoutType:(KLBtnLayoutType)layoutType {
    objc_setAssociatedObject(self, layoutTypeKey, @(layoutType), OBJC_ASSOCIATION_ASSIGN);
}

- (KLBtnLayoutType)layoutType {
    return [objc_getAssociatedObject(self, layoutTypeKey) integerValue];
}

- (void)setContentSpacing:(CGFloat)contentSpacing {
    objc_setAssociatedObject(self, contentSpacingKey, @(contentSpacing), OBJC_ASSOCIATION_ASSIGN);
}

- (CGFloat)contentSpacing {
    return [objc_getAssociatedObject(self, contentSpacingKey) floatValue];
}

- (UIColor *)_colorFromHexValue:(u_int64_t)hex {
    return [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16)) / 255.0
                           green:((float)((hex & 0xFF00) >> 8)) / 255.0
                            blue:((float)(hex & 0xFF)) / 255.0 alpha:1.0];
}

@end
