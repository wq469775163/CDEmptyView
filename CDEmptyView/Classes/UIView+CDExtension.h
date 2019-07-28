//
//  UIView+CDExtension.h
//  CDProgramme
//
//  Created by 王乾 on 2018/9/11.
//  Copyright © 2018年 ChangDao. All rights reserved.
//  可以集成自己项目中的分类。前缀还是建议用三个字母

#import <UIKit/UIKit.h>

@interface UIView (CDExtension)

@property (nonatomic, assign) CGFloat hp_x;
@property (nonatomic, assign) CGFloat hp_y;
@property (nonatomic, assign) CGFloat hp_width;
@property (nonatomic, assign) CGFloat hp_height;
@property (nonatomic, assign) CGFloat hp_centerX;
@property (nonatomic, assign) CGFloat hp_centerY;
@property (nonatomic, assign) CGSize  hp_size;
@property (nonatomic, assign) CGPoint hp_origin;
@property (nonatomic, assign, readonly) CGFloat hp_maxX;
@property (nonatomic, assign, readonly) CGFloat hp_maxY;

@end
