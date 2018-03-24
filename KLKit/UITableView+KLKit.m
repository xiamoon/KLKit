//
//  UITableView+KLKit.m
//  KLKit
//
//  Created by 李乾 on 2018/3/24.
//  Copyright © 2018年 liqian. All rights reserved.
//

#import "UITableView+KLKit.h"
#import <objc/runtime.h>

const void *kl_numberOfSectionsKey = "com.kaleo.kl_numberOfSectionsKey";
const void *kl_numberOfRowsKey = "com.kaleo.kl_numberOfRowsKey";
const void *kl_cellForRowKey = "com.kaleo.kl_cellForRowKey";
const void *kl_didSelectRowKey = "com.kaleo.kl_didSelectRowKey";


@implementation UITableView (KLKit)

+ (UITableView *)tableViewWithStyle:(UITableViewStyle)style {
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:style];
    tableView.kl_tableFooter([UIView new]);
    return tableView;
}

- (id<KLProperty>)kl_default {
    return self.kl_tableDelegate(self).kl_tableDataSource(self);
}

- (id<KLProperty> (^)(id<UITableViewDelegate>))kl_tableDelegate {
    return ^id<KLProperty>(id<UITableViewDelegate> delegate) {
        self.delegate = delegate;
        return self;
    };
}

- (id<KLProperty> (^)(id<UITableViewDataSource>))kl_tableDataSource {
    return ^id<KLProperty>(id<UITableViewDataSource> dataSource) {
        self.dataSource = dataSource;
        return self;
    };
}

- (id<KLProperty> (^)(UIView *))kl_tableHeader {
    return ^id<KLProperty>(UIView *header) {
        self.tableHeaderView = header;
        return self;
    };
}

- (id<KLProperty> (^)(UIView *))kl_tableFooter {
    return ^id<KLProperty>(UIView *footer) {
        self.tableFooterView = footer;
        return self;
    };
}

- (id<KLProperty> (^)(UIColor *))kl_separatorColor {
    return ^id<KLProperty>(UIColor *color) {
        self.separatorColor = color;
        return self;
    };
}

- (id<KLProperty> (^)(u_int64_t))kl_separatorColorHex {
    return ^id<KLProperty>(u_int64_t hex) {
        UIColor *color = [self _colorFromHexValue:hex];
        self.separatorColor = color;
        return self;
    };
}

- (id<KLProperty> (^)(UIEdgeInsets))kl_separatorInset {
    return ^id<KLProperty>(UIEdgeInsets edges) {
        self.separatorInset = edges;
        return self;
    };
}


#pragma mark - UITableViewDataSource / UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.kl_numberOfSections;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section { 
    return self.kl_numberOfRows(section);
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    return self.kl_cellForRow(tableView, indexPath);
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.kl_didSelectRow(tableView, indexPath);
}


#pragma mark - Setters / Getters
- (void)setKl_numberOfSections:(NSInteger)kl_numberOfSections {
    objc_setAssociatedObject(self, kl_numberOfSectionsKey, @(kl_numberOfSections), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSInteger)kl_numberOfSections {
    return [objc_getAssociatedObject(self, kl_numberOfSectionsKey) integerValue];
}

- (void)setKl_numberOfRows:(NSInteger (^)(NSInteger))kl_numberOfRows {
    objc_setAssociatedObject(self, kl_numberOfRowsKey, kl_numberOfRows, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSInteger (^)(NSInteger))kl_numberOfRows {
    return objc_getAssociatedObject(self, kl_numberOfRowsKey);
}

- (void)setKl_cellForRow:(UITableViewCell *(^)(UITableView *, NSIndexPath *))kl_cellForRow {
    objc_setAssociatedObject(self, kl_cellForRowKey, kl_cellForRow, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UITableViewCell *(^)(UITableView *, NSIndexPath *))kl_cellForRow {
    return objc_getAssociatedObject(self, kl_cellForRowKey);
}

- (void)setKl_didSelectRow:(void (^)(UITableView *, NSIndexPath *))kl_didSelectRow {
    objc_setAssociatedObject(self, kl_didSelectRowKey, kl_didSelectRow, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void (^)(UITableView *, NSIndexPath *))kl_didSelectRow {
    return objc_getAssociatedObject(self, kl_didSelectRowKey);
}


#pragma mark - Private.
- (UIColor *)_colorFromHexValue:(u_int64_t)hex {
    return [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16)) / 255.0
                           green:((float)((hex & 0xFF00) >> 8)) / 255.0
                            blue:((float)(hex & 0xFF)) / 255.0 alpha:1.0];
}

@end
