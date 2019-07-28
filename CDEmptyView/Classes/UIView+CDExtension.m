//
//  UIView+CDExtension.m
//  CDProgramme
//
//  Created by 王乾 on 2018/9/11.
//  Copyright © 2018年 ChangDao. All rights reserved.
//

#import "UIView+CDExtension.h"

@implementation UIView (CDExtension)

- (void)setHp_x:(CGFloat)hp_x {
    CGRect frame = self.frame;
    frame.origin.x = hp_x;
    self.frame = frame;
}
- (CGFloat)hp_x {
    return self.frame.origin.x;
}
- (void)setHp_y:(CGFloat)hp_y {
    
    CGRect frame = self.frame;
    frame.origin.y = hp_y;
    self.frame = frame;
}
- (CGFloat)hp_y {
    return self.frame.origin.y;
}
- (void)setHp_centerX:(CGFloat)hp_centerX{
    CGPoint center = self.center;
    center.x = hp_centerX;
    self.center = center;
}
- (CGFloat)hp_centerX {
    return self.center.x;
}

- (void)setHp_centerY:(CGFloat)hp_centerY {
    CGPoint center = self.center;
    center.y = hp_centerY;
    self.center = center;
}
- (CGFloat)hp_centerY {
    return self.center.y;
}

- (void)setHp_width:(CGFloat)hp_width {
    CGRect frame = self.frame;
    frame.size.width = hp_width;
    self.frame = frame;
}
- (CGFloat)hp_width {
    return self.frame.size.width;
}

- (void)setHp_height:(CGFloat)hp_height {
    CGRect frame = self.frame;
    frame.size.height = hp_height;
    self.frame = frame;
}
- (CGFloat)hp_height {
    return self.frame.size.height;
}

- (void)setHp_size:(CGSize)hp_size {
    CGRect frame = self.frame;
    frame.size = hp_size;
    self.frame = frame;
}
- (CGSize)hp_size {
    return self.frame.size;
}

- (void)setHp_origin:(CGPoint)hp_origin {
    CGRect frame = self.frame;
    frame.origin = hp_origin;
    self.frame = frame;
}

- (CGPoint)hp_origin {
    return self.frame.origin;
}
- (CGFloat)hp_maxX {
    return self.frame.origin.x + self.frame.size.width;
}
- (CGFloat)hp_maxY{
    return self.frame.origin.y + self.frame.size.height;
}

@end
