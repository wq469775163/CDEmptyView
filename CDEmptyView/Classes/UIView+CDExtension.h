//
//  UIView+CDExtension.h
//  CDProgramme
//
//  Created by 王乾 on 2018/9/11.
//  Copyright © 2018年 ChangDao. All rights reserved.
//  可以集成自己项目中的分类。前缀还是建议用三个字母

#import <UIKit/UIKit.h>

@interface UIView (CDExtension)

@property (nonatomic, assign) CGFloat cd_x;
@property (nonatomic, assign) CGFloat cd_y;
@property (nonatomic, assign) CGFloat cd_width;
@property (nonatomic, assign) CGFloat cd_height;
@property (nonatomic, assign) CGFloat cd_centerX;
@property (nonatomic, assign) CGFloat cd_centerY;
@property (nonatomic, assign) CGSize  cd_size;
@property (nonatomic, assign) CGPoint cd_origin;
@property (nonatomic, assign, readonly) CGFloat cd_maxX;
@property (nonatomic, assign, readonly) CGFloat cd_maxY;

@end
