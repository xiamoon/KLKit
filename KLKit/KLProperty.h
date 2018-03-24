//
//  KLProperty.h
//  KLKit
//
//  Created by 李乾 on 2018/3/24.
//  Copyright © 2018年 liqian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define KLBlockDefine(_name_, argType) \
id<KLProperty> (^_name_)(argType arg)

#define KLBlockPropertyDefine(_name_, argType) \
@property (nonatomic, strong, readonly) KLBlockDefine(_name_, argType)

typedef NS_OPTIONS(NSUInteger, KLControlState) {
    Normal       = 0,
    Highlighted  = 1 << 0,
    Disabled     = 1 << 1,
    Selected     = 1 << 2,
};

typedef enum : NSInteger {
    Vertical = 0,
    Horizontal = 1
}KLBtnLayoutType;


@protocol KLProperty <NSObject>
@optional

/** UIView Property */
@property (nonatomic, strong, readonly) id<KLProperty> kl_default;

@property (nonatomic, strong, readonly) id<KLProperty> (^kl_frame)(CGFloat x, CGFloat y, CGFloat w, CGFloat h);
@property (nonatomic, strong, readonly) id<KLProperty> (^kl_center)(CGFloat x, CGFloat y);

KLBlockPropertyDefine(kl_bgColor, UIColor *);
KLBlockPropertyDefine(kl_bgColorHex, u_int64_t);
KLBlockPropertyDefine(kl_cornerRadius, CGFloat);
KLBlockPropertyDefine(kl_borderWidth, CGFloat);
KLBlockPropertyDefine(kl_borderColor, UIColor *);
KLBlockPropertyDefine(kl_borderColorHex, u_int64_t);
KLBlockPropertyDefine(kl_contentMode, UIViewContentMode);

@property (nonatomic, strong, readonly) id<KLProperty> and;
KLBlockPropertyDefine(kl_addToView, id);


/** UILabel Property */
KLBlockPropertyDefine(kl_text, NSString *);
KLBlockPropertyDefine(kl_textColor, UIColor *);
KLBlockPropertyDefine(kl_textColorHex, u_int64_t);

KLBlockPropertyDefine(kl_font, UIFont *);
KLBlockPropertyDefine(kl_fontSize, CGFloat);
KLBlockPropertyDefine(kl_fontSizeMedium, CGFloat);
KLBlockPropertyDefine(kl_fontSizeBold, CGFloat);

KLBlockPropertyDefine(kl_textAlignment, NSTextAlignment);
KLBlockPropertyDefine(kl_lines, CGFloat);
KLBlockPropertyDefine(kl_lineBreakMode, NSLineBreakMode);


/** UIButton Property */
@property (nonatomic, strong, readonly) id<KLProperty> (^kl_btnTitle)(NSString *, KLControlState);
@property (nonatomic, strong, readonly) id<KLProperty> (^kl_btnTitleColor)(UIColor *, KLControlState);
@property (nonatomic, strong, readonly) id<KLProperty> (^kl_btnTitleColorHex)(u_int64_t hex, KLControlState);
@property (nonatomic, strong, readonly) id<KLProperty> (^kl_btnImage)(UIImage *image, KLControlState);
@property (nonatomic, strong, readonly) id<KLProperty> (^kl_btnBgImage)(UIImage *image, KLControlState);

KLBlockPropertyDefine(kl_btnLayoutType, KLBtnLayoutType);
KLBlockPropertyDefine(kl_btnContentSpacing, CGFloat);

@property (nonatomic, strong, readonly) id<KLProperty> (^kl_btnAction)(id target, SEL sel);


/** UIImageView Property */
KLBlockPropertyDefine(kl_ivImage, UIImage *);
KLBlockPropertyDefine(kl_ivEnabled, BOOL);

/** UITextField Property */
KLBlockPropertyDefine(kl_tfBorderStyle, UITextBorderStyle);
KLBlockPropertyDefine(kl_tfText, NSString *);
KLBlockPropertyDefine(kl_tfTextColor, UIColor *);
KLBlockPropertyDefine(kl_tfTextColorHex, u_int64_t);
KLBlockPropertyDefine(kl_tfFont, UIFont *);
KLBlockPropertyDefine(kl_tfPlaceHolderText, NSString *);


/** UIScrollView Property */

/** UITextView Property */

/** UITableView Property */
KLBlockPropertyDefine(kl_tableDelegate, id<UITableViewDelegate>);
KLBlockPropertyDefine(kl_tableDataSource, id<UITableViewDataSource>);
KLBlockPropertyDefine(kl_tableHeader, UIView *);
KLBlockPropertyDefine(kl_tableFooter, UIView *);
KLBlockPropertyDefine(kl_separatorColor, UIColor *);
KLBlockPropertyDefine(kl_separatorColorHex, u_int64_t);
KLBlockPropertyDefine(kl_separatorInset, UIEdgeInsets);


@end

