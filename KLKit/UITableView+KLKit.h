//
//  UITableView+KLKit.h
//  KLKit
//
//  Created by 李乾 on 2018/3/24.
//  Copyright © 2018年 liqian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KLProperty.h"

@interface UITableView (KLKit) <KLProperty, UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, assign) NSInteger kl_numberOfSections;
@property (nonatomic, assign) NSInteger (^kl_numberOfRows) (NSInteger section);
@property (nonatomic, assign) UITableViewCell* (^kl_cellForRow) (UITableView *tableView, NSIndexPath *indexPath);
@property (nonatomic, assign) void (^kl_didSelectRow) (UITableView *tableView, NSIndexPath *indexPath);

+ (UITableView *)tableViewWithStyle:(UITableViewStyle)style;

@end
