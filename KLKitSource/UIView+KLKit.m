//
//  UIView+KLKit.m
//  KLKit
//
//  Created by 李乾 on 2018/3/24.
//  Copyright © 2018年 liqian. All rights reserved.
//

#import "UIView+KLKit.h"

@implementation UIView (KLKit)

- (id<KLProperty>)kl_default {
    self.kl_frame(0, 0, 50, 50);
    return self;
}

- (id<KLProperty> (^)(CGFloat, CGFloat, CGFloat, CGFloat))kl_frame {
    return ^id<KLProperty>  (CGFloat x, CGFloat y, CGFloat w, CGFloat h) {
        self.frame = CGRectMake(x, y, w, h);
        return self;
    };
}

- (id<KLProperty> (^)(CGFloat, CGFloat))kl_center {
    return ^id<KLProperty> (CGFloat x, CGFloat y) {
        self.center = CGPointMake(x, y);
        return self;
    };
}

- (id<KLProperty> (^)(CGFloat, CGFloat))kl_size {
    return ^id<KLProperty> (CGFloat w, CGFloat h) {
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, w, h);
        return self;
    };
}

- (id<KLProperty> (^)(UIColor *color))kl_bgColor {
    return ^id<KLProperty> (UIColor *color) {
        self.backgroundColor = color;
        return self;
    };
}

- (id<KLProperty> (^)(u_int64_t))kl_bgColorHex {
    return ^id<KLProperty> (u_int64_t hex) {
        UIColor *color = [self _colorFromHexValue:hex];
        self.backgroundColor = color;
        return self;
    };
}


- (id<KLProperty> (^)(CGFloat))kl_cornerRadius {
    return ^id<KLProperty> (CGFloat cr) {
        self.layer.cornerRadius = cr;
        return self;
    };
}

- (id<KLProperty> (^)(CGFloat))kl_borderWidth {
    return ^id<KLProperty> (CGFloat bw) {
        self.layer.borderWidth = bw;
        return self;
    };
}

- (id<KLProperty> (^)(UIColor *))kl_borderColor {
    return ^id<KLProperty> (UIColor *bc) {
        self.layer.borderColor = bc.CGColor;
        return self;
    };
}

- (id<KLProperty> (^)(u_int64_t))kl_borderColorHex {
    return ^id<KLProperty> (u_int64_t hex) {
        UIColor *color = [self _colorFromHexValue:hex];
        self.layer.borderColor = color.CGColor;
        return self;
    };
}

- (id<KLProperty> (^)(UIViewContentMode))kl_contentMode {
    return ^id<KLProperty> (UIViewContentMode contentMode) {
        self.contentMode = contentMode;
        return self;
    };
}

- (id<KLProperty> (^)(CGFloat))kl_shadowOpacity {
    return ^id<KLProperty> (CGFloat opacity) {
        self.layer.shadowOpacity = opacity;
        return self;
    };
}

- (id<KLProperty> (^)(CGSize))kl_shadowOffset {
    return ^id<KLProperty> (CGSize size) {
        self.layer.shadowOffset = size;
        return self;
    };
}

- (id<KLProperty> (^)(UIColor *))kl_shadowColor {
    return ^id<KLProperty> (UIColor *color) {
        self.layer.shadowColor = color.CGColor;
        return self;
    };
}

- (id<KLProperty> )and {
    return self;
}

- (id<KLProperty> (^)(id))kl_addToView {
    return ^id<KLProperty>  (id superView) {
        UIView *_superView = (UIView *)superView;
        [_superView addSubview:self];
        return self;
    };
}

- (UIColor *)_colorFromHexValue:(u_int64_t)hex {
    return [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16)) / 255.0
                           green:((float)((hex & 0xFF00) >> 8)) / 255.0
                            blue:((float)(hex & 0xFF)) / 255.0 alpha:1.0];
}

@end
