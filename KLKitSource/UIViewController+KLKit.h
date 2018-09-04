//
//  UIViewController+KLKit.h
//  Gailvlun
//
//  Created by 李乾 on 2018/3/26.
//  Copyright © 2018年 ShitWillDie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (KLKit)

- (void)kl_addChildViewController:(UIViewController *)childController toContainerView:(UIView *)containerView;

- (void)kl_addChildViewController:(UIViewController *)childController toContainerView:(UIView *)containerView frame:(CGRect)frame;

- (void)kl_removeChildViewController:(UIViewController *)viewController;


- (void)kl_AddLeftBarButtonItemWithTitle:(NSString *)title
                                   color:(UIColor *)color
                                  action:(SEL)action;
- (void)kl_AddLeftBarButtonItemWithIcon:(UIImage *)icon
                                 action:(SEL)action;

- (void)kl_AddRightBarButtonItemWithTitle:(NSString *)title
                                    color:(UIColor *)color
                                  action:(SEL)action;
- (void)kl_AddRightBarButtonItemWithIcon:(UIImage *)icon
                                 action:(SEL)action;

- (void)kl_AddLeftBarButtonItemWithView:(UIView *)view;
- (void)kl_AddRightBarButtonItemWithView:(UIView *)view;


- (UIBarButtonItem *)kl_barButtonItemWithTitle:(NSString *)title
                                         color:(UIColor *)color
                                          font:(UIFont *)font
                                        action:(SEL)action;

- (UIBarButtonItem *)kl_barButtonItemWithIcon:(UIImage *)icon
                                       action:(SEL)action;

@end
