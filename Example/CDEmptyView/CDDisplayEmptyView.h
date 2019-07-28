//
//  CDDisplayEmptyView.h
//  CDPlaceholder_iphone
//
//  Created by 王乾 on 2019/6/21.
//  Copyright © 2019 changdao. All rights reserved.
//

#import "CDEmptyView.h"

typedef NS_ENUM(NSInteger, CDDisplayEmptyType) {
    CDDisplayEmptyTypeDismissNetWork,           // 没有网络
    CDDisplayEmptyTypeDismissData,              // 没有数据
    CDDisplayEmptyTypeLoadingFailure,           // 加载失败
    CDDisplayEmptyTypeLoadingSuccess,           // 加载成功
};


@protocol CDDisplayEmptyViewDelegate <NSObject>

@optional

@end

@interface CDDisplayEmptyView : CDEmptyView

+ (instancetype)displayEmptyTarget:(id)target action:(SEL)action emptyType:(CDDisplayEmptyType)emptyType;

@end
