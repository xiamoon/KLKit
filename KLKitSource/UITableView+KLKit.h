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

@property (nonatomic, strong) NSInteger (^kl_numberOfSections) (void);
@property (nonatomic, strong) NSInteger (^kl_numberOfRows) (NSInteger section);
@property (nonatomic, strong) UITableViewCell* (^kl_cellForRow) (UITableView *tableView, NSIndexPath *indexPath);
@property (nonatomic, strong) CGFloat (^kl_heightForRow) (UITableView *tableView, NSIndexPath *indexPath);
@property (nonatomic, strong) void (^kl_didSelectRow) (UITableView *tableView, NSIndexPath *indexPath);
@property (nonatomic, strong) CGFloat (^kl_heightForHeaderInSection) (UITableView *tableView, NSInteger section);
@property (nonatomic, strong) CGFloat (^kl_heightForFooterInSection) (UITableView *tableView, NSInteger section);


+ (UITableView *)tableViewWithStyle:(UITableViewStyle)style;

@end
