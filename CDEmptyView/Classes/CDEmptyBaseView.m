//
//  CDEmptyBaseView.m
//  CDProgramme
//
//  Created by 王乾 on 2018/9/11.
//  Copyright © 2018年 ChangDao. All rights reserved.

//  1、通过willMoveToSuperview和layoutSubviews中superview得到父类的frame
//  2、在自定义UIView类内部自行设置控件中心点位置。以及坐标之类的。

#import "CDEmptyBaseView.h"

@implementation CDEmptyBaseView

- (instancetype)init {
    self = [super init];
    if (self) {
        //默认自动隐藏
        self.autoShowEmptyView = true;
        [self prepare];
    }
    return self;
}
- (void)prepare{
    
    // 自动调整view的宽度，以保证左边距和右边距不变
    // 自动调整view的高度，以保证上边距和下边距不变
    
    self.autoresizingMask = UIViewAutoresizingFlexibleWidth |  UIViewAutoresizingFlexibleHeight;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    UIView *view = self.superview;
    //判断是否是 UIScrollView，如果不是，不做操作
    if (view && [view isKindOfClass:[UIScrollView class]]) {
        self.cd_width = view.cd_width;
        self.cd_height = view.cd_height;
    }
    [self setupSubviews];
}

// 函数重写
- (void)setupSubviews{
    
}
// UIView生命周期 newSuperview为nil为销毁，否则为创建。（UIView销毁和创建的时候都会走这个函数）
- (void)willMoveToSuperview:(UIView *)newSuperview {
    [super willMoveToSuperview:newSuperview];
    
    //判断是否是 UIScrollView，如果不是，不做操作
    if (newSuperview && ![newSuperview isKindOfClass:[UIScrollView class]]) return;
    
    if (newSuperview) {
        self.cd_width = newSuperview.cd_width;
        self.cd_height = newSuperview.cd_height;
    }
}


+ (instancetype)emptyActionViewWithImageStr:(NSString *)imageStr titleStr:(NSString *)titleStr detailStr:(NSString *)detailStr btnTitleStr:(NSString *)btnTitleStr target:(id)target action:(SEL)action{
    
    CDEmptyBaseView *emptyView = [[self alloc] init];
    
    [emptyView creatEmptyViewWithImageStr:imageStr titleStr:titleStr detailStr:detailStr btnTitleStr:btnTitleStr target:target action:action];
    
    return emptyView;
}
+ (instancetype)emptyActionViewWithImageStr:(NSString *)imageStr titleStr:(NSString *)titleStr detailStr:(NSString *)detailStr btnTitleStr:(NSString *)btnTitleStr btnClickBlock:(HPActionTapBlock)btnClickBlock{
    
    CDEmptyBaseView *emptyView = [[self alloc] init];
    
    [emptyView creatEmptyViewWithImageStr:imageStr titleStr:titleStr detailStr:detailStr btnTitleStr:btnTitleStr btnClickBlock:btnClickBlock];
    
    return emptyView;
}
+ (instancetype)emptyViewWithImageStr:(NSString *)imageStr titleStr:(NSString *)titleStr detailStr:(NSString *)detailStr{
    
    CDEmptyBaseView *emptyView = [[self alloc] init];
    
    [emptyView creatEmptyViewWithImageStr:imageStr titleStr:titleStr detailStr:detailStr btnTitleStr:nil btnClickBlock:nil];
    
    return emptyView;
}

+ (instancetype)emptyViewWithCustomView:(UIView *)customView{
    
    CDEmptyBaseView *emptyView = [[self alloc] init];
    
    [emptyView creatEmptyViewWithCustomView:customView];
    
    return emptyView;
}
- (void)creatEmptyViewWithImageStr:(NSString *)imageStr titleStr:(NSString *)titleStr detailStr:(NSString *)detailStr btnTitleStr:(NSString *)btnTitleStr target:(id)target action:(SEL)action{
    
    _imageStr = imageStr;
    _titleStr = titleStr;
    _detailStr = detailStr;
    _btnTitleStr = btnTitleStr;
    _actionBtnTarget = target;
    _actionBtnAction = action;
    
    //内容物背景视图
    if (!_contentView) {
        _contentView = [[UIView alloc] initWithFrame:CGRectZero];
        [self addSubview:_contentView];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapContentView:)];
        [_contentView addGestureRecognizer:tap];
    }
}
- (void)creatEmptyViewWithImageStr:(NSString *)imageStr titleStr:(NSString *)titleStr detailStr:(NSString *)detailStr btnTitleStr:(NSString *)btnTitleStr btnClickBlock:(HPActionTapBlock)btnClickBlock{
    
    _imageStr = imageStr;
    _titleStr = titleStr;
    _detailStr = detailStr;
    _btnTitleStr = btnTitleStr;
    _btnClickBlock = btnClickBlock;
    
    //内容物背景视图
    if (!_contentView) {
        _contentView = [[UIView alloc] initWithFrame:CGRectZero];
        [self addSubview:_contentView];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapContentView:)];
        [_contentView addGestureRecognizer:tap];
    }
}
- (void)creatEmptyViewWithCustomView:(UIView *)customView{
    
    //内容物背景视图
    if (!_contentView) {
        _contentView = [[UIView alloc] initWithFrame:CGRectZero];
        [self addSubview:_contentView];
    }
    
    if (!_customView) {
        [_contentView addSubview:customView];
    }
    _customView = customView;
}
-(void)setImageStr:(NSString *)imageStr{
    _imageStr = imageStr;
    [self setupSubviews];
}
- (void)setTitleStr:(NSString *)titleStr{
    _titleStr = titleStr;
    [self setupSubviews];
}
- (void)setDetailStr:(NSString *)detailStr{
    _detailStr = detailStr;
    [self setupSubviews];
}
- (void)setBtnTitleStr:(NSString *)btnTitleStr{
    _btnTitleStr = btnTitleStr;
    [self setupSubviews];
}

- (void)tapContentView:(UITapGestureRecognizer *)tap{
    if (_tapContentViewBlock) {
        _tapContentViewBlock();
    }
}


@end
