//
//  KLButton.h
//  Gailvlun
//
//  Created by 李乾 on 2018/4/28.
//  Copyright © 2018年 ShitWillDie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KLProperty.h"

@interface KLButton : UIControl
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) UIImage *icon;
@property (nonatomic, assign) KLBtnLayoutType layoutType;
@end
