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
const void *kl_heightForRowKey = "com.kaleo.kl_heightForRowKey";
const void *kl_didSelectRowKey = "com.kaleo.kl_didSelectRowKey";
const void *kl_heightForHeaderInSectionKey = "com.kaleo.kl_heightForHeaderInSectionKey";
const void *kl_heightForFooterInSectionKey = "com.kaleo.kl_heightForFooterInSectionKey";


@implementation UITableView (KLKit)

+ (UITableView *)tableViewWithStyle:(UITableViewStyle)style {
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:style];
    tableView.kl_tableFooter([UIView new]);
    return tableView;
}

- (id<KLProperty>)kl_default {
    return self.kl_tableDelegate(self).kl_tableDataSource(self).kl_tableFooter([UIView new]);
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

- (id<KLProperty> (^)(BOOL))kl_showSeparator {
    return ^id<KLProperty>(BOOL show) {
        if (!show) {
            self.separatorStyle = UITableViewCellSeparatorStyleNone;
        }
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
    if (self.kl_numberOfSections) {
        return self.kl_numberOfSections();
    }
    return 1;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.kl_numberOfRows) {
        return self.kl_numberOfRows(section);
    }
    return 0;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    if (self.kl_cellForRow) {
        return self.kl_cellForRow(tableView, indexPath);
    }
    return nil;
}

#ifndef __IPHONE_8_0
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.kl_heightForRow) {
        return self.kl_heightForRow(tableView, indexPath);
    }
}
#endif

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.kl_didSelectRow) {
        self.kl_didSelectRow(tableView, indexPath);
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (self.kl_heightForHeaderInSection) {
        return self.kl_heightForHeaderInSection(tableView, section);
    }
    return 0.001;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (self.kl_heightForFooterInSection) {
        return self.kl_heightForFooterInSection(tableView, section);
    }
    return 0.001;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return nil;
}

#pragma mark - Setters / Getters
- (void)setKl_numberOfSections:(NSInteger (^)(void))kl_numberOfSections {
    objc_setAssociatedObject(self, kl_numberOfSectionsKey, kl_numberOfSections, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSInteger (^)(void))kl_numberOfSections {
    return objc_getAssociatedObject(self, kl_numberOfSectionsKey);
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

- (void)setKl_heightForRow:(CGFloat (^)(UITableView *, NSIndexPath *))kl_heightForRow {
    objc_setAssociatedObject(self, kl_heightForRowKey, kl_heightForRow, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat (^)(UITableView *, NSIndexPath *))kl_heightForRow {
    return objc_getAssociatedObject(self, kl_heightForRowKey);
}

- (void)setKl_didSelectRow:(void (^)(UITableView *, NSIndexPath *))kl_didSelectRow {
    objc_setAssociatedObject(self, kl_didSelectRowKey, kl_didSelectRow, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void (^)(UITableView *, NSIndexPath *))kl_didSelectRow {
    return objc_getAssociatedObject(self, kl_didSelectRowKey);
}

- (void)setKl_heightForHeaderInSection:(CGFloat (^)(UITableView *, NSInteger))kl_heightForHeaderInSection {
    objc_setAssociatedObject(self, kl_heightForHeaderInSectionKey, kl_heightForHeaderInSection, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat (^)(UITableView *, NSInteger))kl_heightForHeaderInSection {
    return objc_getAssociatedObject(self, kl_heightForHeaderInSectionKey);
}

- (void)setKl_heightForFooterInSection:(CGFloat (^)(UITableView *, NSInteger))kl_heightForFooterInSection {
    objc_setAssociatedObject(self, kl_heightForFooterInSectionKey, kl_heightForFooterInSection, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat (^)(UITableView *, NSInteger))kl_heightForFooterInSection {
    return objc_getAssociatedObject(self, kl_heightForFooterInSectionKey);
}

#pragma mark - Private.
- (UIColor *)_colorFromHexValue:(u_int64_t)hex {
    return [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16)) / 255.0
                           green:((float)((hex & 0xFF00) >> 8)) / 255.0
                            blue:((float)(hex & 0xFF)) / 255.0 alpha:1.0];
}

@end
