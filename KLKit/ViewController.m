//
//  ViewController.m
//  KLKit
//
//  Created by 李乾 on 2018/3/24.
//  Copyright © 2018年 liqian. All rights reserved.
//

#import "ViewController.h"
#import "KLKit.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // UIView
    UIView *view = [UIView new];
    view.kl_frame(100, 100, 100, 100)
    .kl_bgColor([UIColor redColor])
    .kl_addToView(self.view);
    
    // UILabel
    UILabel *label = [UILabel kl_defaultAlignCenterLabelWithY:220];
    label.kl_addToView(self.view);
    
    // UIButton
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.kl_default
    .kl_btnAction(self, @selector(handleButtonAction))
    .kl_addToView(self.view);
    
    // UIImageView
    
    
    // UITextField
    UITextField *tf = [UITextField new];
    tf.kl_default
    .kl_frame(100, 300, 120, 30)
    .kl_tfText(@"这是输入框")
    .kl_tfTextColor([UIColor redColor])
    .kl_addToView(self.view);
    
    // UIScrollView
    
    // UITextView
    
    // UITableView
    UITableView *tableView = [UITableView tableViewWithStyle:UITableViewStylePlain];
    tableView.kl_default.kl_frame(0, 400, 375, 220).kl_separatorColor([UIColor purpleColor]).kl_addToView(self.view);
    tableView.kl_numberOfSections = 2;
    tableView.kl_numberOfRows = ^NSInteger(NSInteger section) {
        if (section == 0) {
            return 2;
        }else {
            return 5;
        }
    };
    tableView.kl_cellForRow = ^UITableViewCell *(UITableView *tableView, NSIndexPath *indexPath) {
        static NSString *cellId = @"cellId";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
            cell.textLabel.kl_text(@"你好");
        }
        return cell;
    };
    tableView.kl_didSelectRow = ^(UITableView *tableView, NSIndexPath *indexPath) {
        NSString *str = [NSString stringWithFormat:@"点击第%ld个cell", indexPath.row];
        NSLog(@"%@", str);
    };
}

- (void)handleButtonAction {
    NSLog(@"--------XXX");
}


@end
