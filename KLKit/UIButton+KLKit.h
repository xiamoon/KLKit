//
//  UIButton+KLKit.h
//  KLKit
//
//  Created by 李乾 on 2018/3/24.
//  Copyright © 2018年 liqian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KLProperty.h"

@interface UIButton (KLKit) <KLProperty>
@property (nonatomic, assign) KLBtnLayoutType layoutType;
@property (nonatomic, assign) CGFloat contentSpacing;
@end
