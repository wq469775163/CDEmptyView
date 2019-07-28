//
//  CDDisplayEmptyView.m
//  CDPlaceholder_iphone
//
//  Created by 王乾 on 2019/6/21.
//  Copyright © 2019 changdao. All rights reserved.
//

#import "CDDisplayEmptyView.h"

@interface CDDisplayEmptyView ()

@property (nonatomic, weak) id <CDDisplayEmptyViewDelegate>delegate;

@end

@implementation CDDisplayEmptyView

+ (instancetype)displayEmptyTarget:(id)target action:(SEL)action emptyType:(CDDisplayEmptyType)emptyType{
    
    CDDisplayEmptyView *view = nil;
    
    if (CDDisplayEmptyTypeDismissData == emptyType) {

        
    } else if (CDDisplayEmptyTypeDismissNetWork == emptyType) {
        
        // 没有网络
        view = [CDDisplayEmptyView emptyActionViewWithImageStr:@"dismiss_network" titleStr:@"网络好像出问题了~" detailStr:@"请检查网络连接后重试～" btnTitleStr:@"重试" target:target action:action];
        view.subViewMargin = 20;
        view.imageBetweenTitleSpace = 50;
        view.titleBetweenDetailsSpace = 15;
        view.detailsBetweenButtonSpace = 85;
        
        view.titleLabFont = [UIFont systemFontOfSize:20];
        view.titleLabTextColor =  [UIColor whiteColor];
        
        view.detailLabFont = [UIFont systemFontOfSize:14];
        view.detailLabTextColor = [UIColor whiteColor];
        
        view.actionBtnWidth = 206;
        view.actionBtnHeight = 69;
        view.actionBtnFont = [UIFont systemFontOfSize:18];
        view.actionBtnTitleColor = [UIColor whiteColor];
        view.actionBtnBackGroundImage = [UIImage imageNamed:@"dismiss_button"];
    }
    return view;
}
#pragma mark - Intial Methods

#pragma mark - Target Methods

#pragma mark - Public Methods

#pragma mark - Private Method

#pragma mark - Setter Getter Methods

@end
