//
//  UIScrollView+CDEmpty.m
//  CDProgramme
//
//  Created by 王乾 on 2018/9/11.
//  Copyright © 2018年 ChangDao. All rights reserved.
//

#import "UIScrollView+CDEmpty.h"
#import "CDEmptyView.h"

#import <objc/runtime.h>

static const char *KEmptyViewkey = "KEmptyViewkey";

@implementation UIScrollView (CDEmpty)

- (void)setCd_emptyView:(CDEmptyView *)cd_emptyView {
    
    // addSubview添加同一个View，会先从View移除之后再添加
    objc_setAssociatedObject(self, KEmptyViewkey, cd_emptyView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self addSubview:cd_emptyView];
}
- (CDEmptyView *)cd_emptyView {
    return objc_getAssociatedObject(self, KEmptyViewkey);
}
#pragma mark - Private Method
- (NSInteger)totalDataCount {
    
    NSInteger totalCount = 0;
    if ([self isKindOfClass:[UITableView class]]) {
        UITableView *tableView = (UITableView *)self;
        
        for (NSInteger section = 0; section < tableView.numberOfSections; section++) {
            totalCount += [tableView numberOfRowsInSection:section];
        }
    } else if ([self isKindOfClass:[UICollectionView class]]) {
        UICollectionView *collectionView = (UICollectionView *)self;
        
        for (NSInteger section = 0; section < collectionView.numberOfSections; section++) {
            totalCount += [collectionView numberOfItemsInSection:section];
        }
    }
    return totalCount;
}
- (void)getDataAndSet{
    
    if ([self totalDataCount] == 0) {
        [self show];
    } else {
        [self hide];
    }
}
- (void)show{
    
    //当不自动显隐时，内部自动调用show方法时也不要去显示，要显示的话只有手动去调用 cd_showEmptyView
    if (!self.cd_emptyView.autoShowEmptyView) {
        self.cd_emptyView.hidden = true;
        return;
    }
    
    [self cd_showEmptyView];
}
- (void)hide{
    
    if (!self.cd_emptyView.autoShowEmptyView) {
        self.cd_emptyView.hidden = true;
        return;
    }
    
    [self cd_hideEmptyView];
}
#pragma mark - Public Method
- (void)cd_showEmptyView{
    
    [self.cd_emptyView.superview layoutSubviews];
    
    self.cd_emptyView.hidden = false;
    //让 emptyBGView 始终保持在最上层
    [self bringSubviewToFront:self.cd_emptyView];
}
- (void)cd_hideEmptyView{
    self.cd_emptyView.hidden = true;
    [self.cd_emptyView.guideView removeFromSuperview];
}

- (void)cd_startLoading{
    
    self.cd_emptyView.hidden = true;
}
- (void)cd_endLoading{
    if ([self totalDataCount] == 0) {
        self.cd_emptyView.hidden = false;
    }else{
        self.cd_emptyView.hidden = true;
    }
}

@end

@implementation UITableView (Empty)

+ (void)load {
    
    // 类或者分类一旦被加载到运行时，就会调用+ (void)load 这个方法
    // 目前项目中视图是否展示通过类数据count自行判断的，先不用交换刷新方法，手动控制空视图显隐
 /*
    Method reloadData = class_getInstanceMethod(self, @selector(reloadData));
    Method cd_reloadData = class_getInstanceMethod(self, @selector(cd_reloadData));
    method_exchangeImplementations(reloadData, cd_reloadData);
    
    //section
    //    Method insertSections = class_getInstanceMethod(self, @selector(insertSection:withRowAnimation:));
    //    Method cd_insertSections = class_getInstanceMethod(self, @selector(cd_insertSections:withRowAnimation:));
    //    method_exchangeImplementations(insertSections, cd_insertSections);
    
    Method deleteSections = class_getInstanceMethod(self, @selector(deleteSections:withRowAnimation:));
    Method cd_deleteSections = class_getInstanceMethod(self, @selector(cd_deleteSections:withRowAnimation:));
    method_exchangeImplementations(deleteSections, cd_deleteSections);
    
    ///row
    Method insertRowsAtIndexPaths = class_getInstanceMethod(self, @selector(insertRowsAtIndexPaths:withRowAnimation:));
    Method cd_insertRowsAtIndexPaths = class_getInstanceMethod(self, @selector(cd_insertRowsAtIndexPaths:withRowAnimation:));
    method_exchangeImplementations(insertRowsAtIndexPaths, cd_insertRowsAtIndexPaths);
    
    Method deleteRowsAtIndexPaths = class_getInstanceMethod(self, @selector(deleteRowsAtIndexPaths:withRowAnimation:));
    Method cd_deleteRowsAtIndexPaths = class_getInstanceMethod(self, @selector(cd_deleteRowsAtIndexPaths:withRowAnimation:));
    method_exchangeImplementations(deleteRowsAtIndexPaths, cd_deleteRowsAtIndexPaths);
  */
}

- (void)cd_reloadData{
    [self cd_reloadData];
    [self getDataAndSet];
}
///section
- (void)cd_insertSections:(NSIndexSet *)sections withRowAnimation:(UITableViewRowAnimation)animation{
    [self cd_insertSections:sections withRowAnimation:animation];
    [self getDataAndSet];
}
- (void)cd_deleteSections:(NSIndexSet *)sections withRowAnimation:(UITableViewRowAnimation)animation{
    [self cd_insertSections:sections withRowAnimation:animation];
    [self getDataAndSet];
}

///row
- (void)cd_insertRowsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation{
    [self cd_insertRowsAtIndexPaths:indexPaths withRowAnimation:animation];
    [self getDataAndSet];
}
- (void)cd_deleteRowsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation{
    [self cd_deleteRowsAtIndexPaths:indexPaths withRowAnimation:animation];
    [self getDataAndSet];
}

@end

@implementation UICollectionView (Empty)
+ (void)load{
    
    /*
    Method reloadData = class_getInstanceMethod(self, @selector(reloadData));
    Method cd_reloadData = class_getInstanceMethod(self, @selector(cd_reloadData));
    method_exchangeImplementations(reloadData, cd_reloadData);
    
    ///section
    Method insertSections = class_getInstanceMethod(self, @selector(insertSections:));
    Method cd_insertSections = class_getInstanceMethod(self, @selector(cd_insertSections:));
    method_exchangeImplementations(insertSections, cd_insertSections);
    
    Method deleteSections = class_getInstanceMethod(self, @selector(deleteSections:));
    Method cd_deleteSections = class_getInstanceMethod(self, @selector(cd_deleteSections:));
    method_exchangeImplementations(deleteSections, cd_deleteSections);
    
    ///item
    //    Method insertItemsAtIndexPaths = class_getInstanceMethod(self, @selector(insertItemsAtIndexPaths:));
    //    Method cd_insertItemsAtIndexPaths = class_getInstanceMethod(self, @selector(cd_insertItemsAtIndexPaths:));
    //    method_exchangeImplementations(insertItemsAtIndexPaths, cd_insertItemsAtIndexPaths);
    
    //    Method deleteItemsAtIndexPaths = class_getInstanceMethod(self, @selector(deleteItemsAtIndexPaths:));
    //    Method cd_deleteItemsAtIndexPaths = class_getInstanceMethod(self, @selector(cd_deleteItemsAtIndexPaths:));
    //    method_exchangeImplementations(deleteItemsAtIndexPaths, cd_deleteItemsAtIndexPaths);
    */
}
- (void)cd_reloadData{
    [self cd_reloadData];
    [self getDataAndSet];
}
///section
- (void)cd_insertSections:(NSIndexSet *)sections{
    [self cd_insertSections:sections];
    [self getDataAndSet];
}
- (void)cd_deleteSections:(NSIndexSet *)sections{
    [self cd_deleteSections:sections];
    [self getDataAndSet];
}
///item
- (void)cd_insertItemsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths{
    [self cd_insertItemsAtIndexPaths:indexPaths];
    [self getDataAndSet];
}
- (void)cd_deleteItemsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths{
    [self cd_deleteItemsAtIndexPaths:indexPaths];
    [self getDataAndSet];
}
@end
