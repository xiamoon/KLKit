//
//  UIViewController+KLKit.m
//  Gailvlun
//
//  Created by 李乾 on 2018/3/26.
//  Copyright © 2018年 ShitWillDie. All rights reserved.
//

#import "UIViewController+KLKit.h"

@implementation UIViewController (KLKit)

- (void)kl_addChildViewController:(UIViewController *)childController toContainerView:(UIView *)containerView {
    [self kl_addChildViewController:childController toContainerView:containerView frame:containerView.bounds];
}

- (void)kl_addChildViewController:(UIViewController *)childController toContainerView:(UIView *)containerView frame:(CGRect)frame {
    [self addChildViewController:childController];
    childController.view.frame = frame;
    [containerView addSubview:childController.view];
    [childController didMoveToParentViewController:self];
    BOOL equalWidth = NO;
    if (CGRectGetWidth(frame) == CGRectGetWidth(containerView.frame)) {
        equalWidth = YES;
    }
    BOOL equalHeight = NO;
    if (CGRectGetHeight(frame) == CGRectGetHeight(containerView.frame)) {
        equalHeight = YES;
    }
    [childController.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(CGRectGetMinX(frame));
        make.top.offset(CGRectGetMinY(frame));
        if (equalWidth) {
            make.right.offset(0);
        }else {
            make.width.mas_equalTo(CGRectGetWidth(frame));
        }
        if (equalHeight) {
            make.bottom.offset(0);
        }else {
            make.height.mas_equalTo(CGRectGetHeight(frame));
        }
    }];
}

- (void)kl_removeChildViewController:(UIViewController *)viewController {
    [viewController willMoveToParentViewController:nil];
    [viewController.view removeFromSuperview];
    [viewController removeFromParentViewController];
}


- (void)kl_AddLeftBarButtonItemWithTitle:(NSString *)title
                                   color:(UIColor *)color
                                  action:(SEL)action {
    self.navigationItem.leftBarButtonItem = [self kl_barButtonItemWithTitle:title color:color action:action];
}

- (void)kl_AddLeftBarButtonItemWithIcon:(UIImage *)icon
                                 action:(SEL)action {
    self.navigationItem.leftBarButtonItem = [self kl_barButtonItemWithIcon:icon action:action];
}

- (void)kl_AddRightBarButtonItemWithTitle:(NSString *)title
                                    color:(UIColor *)color
                                   action:(SEL)action {
    self.navigationItem.rightBarButtonItem = [self kl_barButtonItemWithTitle:title color:color action:action];
}

- (void)kl_AddRightBarButtonItemWithIcon:(UIImage *)icon
                                  action:(SEL)action {
    self.navigationItem.rightBarButtonItem = [self kl_barButtonItemWithIcon:icon action:action];
}

- (void)kl_AddLeftBarButtonItemWithView:(UIView *)view {
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:view];
    self.navigationItem.leftBarButtonItem = item;
}

- (void)kl_AddRightBarButtonItemWithView:(UIView *)view {
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:view];
    self.navigationItem.rightBarButtonItem = item;
}


- (UIBarButtonItem *)kl_barButtonItemWithTitle:(NSString *)title
                                      color:(UIColor *)color
                                     action:(SEL)action {
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:self action:action];
    if (color) {
        item.tintColor = color;
    }
    return item;
}

- (UIBarButtonItem *)kl_barButtonItemWithTitle:(NSString *)title
                                         color:(UIColor *)color
                                          font:(UIFont *)font
                                        action:(SEL)action {
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:self action:action];
    if (color) {
        item.tintColor = color;
    }
    if (font) {
        [item setTitleTextAttributes:@{NSFontAttributeName : font} forState:UIControlStateNormal];
        [item setTitleTextAttributes:@{NSFontAttributeName : font} forState:UIControlStateDisabled];
        [item setTitleTextAttributes:@{NSFontAttributeName : font} forState:UIControlStateHighlighted];
        [item setTitleTextAttributes:@{NSFontAttributeName : font} forState:UIControlStateSelected];
    }
    return item;
}

- (UIBarButtonItem *)kl_barButtonItemWithIcon:(UIImage *)icon
                                    action:(SEL)action {
    QMUIButton *button = [QMUIButton new];
    if (icon.size.width >= 44.0) {
        button.frame = CGRectMake(0, 0, icon.size.width, 44.0);
    }else {
        icon = [icon qmui_imageWithSpacingExtensionInsets:UIEdgeInsetsMake(0, 44-icon.size.width, 0, 0)];
        button.frame = CGRectMake(0, 0, 44.0, 44.0);
    }
    button.kl_btnImage(icon, KLNormal);
    button.kl_btnAction(self, action);
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:button];
    return item;
}

@end
