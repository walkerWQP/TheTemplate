//
//  UIView+Frame.m
//  TheTemplate
//
//  Created by yunjobs on 2018/6/26.
//  Copyright © 2018年 walker. All rights reserved.
//

#import "UIView+Frame.h"

@implementation UIView (Frame)

- (CGFloat)w_width {
    return self.bounds.size.width;
}

- (void)setW_width:(CGFloat)w_width {
    CGRect frame = self.frame;
    frame.size.width = w_width;
    self.frame = frame;
}

- (CGFloat)w_height {
    return self.bounds.size.height;
}

- (void)setW_height:(CGFloat)w_height {
    CGRect frame = self.frame;
    frame.size.height = w_height;
    self.frame = frame;
}

- (CGFloat)w_x {
    return self.frame.origin.x;
}

- (void)setW_x:(CGFloat)w_x {
    CGRect frame = self.frame;
    frame.origin.x = w_x;
    self.frame = frame;
}

- (CGFloat)w_y {
    return self.frame.origin.y;
}

- (void)setW_y:(CGFloat)w_y {
    CGRect frame = self.frame;
    frame.origin.y = w_y;
    self.frame = frame;
}

- (CGFloat)w_right {
    return CGRectGetMaxX(self.frame);
}

- (void)setW_right:(CGFloat)w_right {
    self.w_x = w_right - self.w_width;
}


- (CGFloat)w_bottom {
    return CGRectGetMaxY(self.frame);
}

- (void)setW_bottom:(CGFloat)w_bottom {
    self.w_y = w_bottom - self.w_height;
}

- (void)setW_size:(CGSize)w_size {
    CGRect frame = self.frame;
    frame.size = w_size;
    self.frame = frame;
}

- (CGSize)w_size {
    return self.frame.size;
}

- (void)setW_origin:(CGPoint)w_origin {
    CGRect frame = self.frame;
    frame.origin = w_origin;
    self.frame = frame;
}

- (CGPoint)w_origin {
    return self.frame.origin;
}

- (void)setW_centerX:(CGFloat)w_centerX{
    CGPoint center = self.center;
    center.x = w_centerX;
    self.center = center;
}

- (CGFloat)w_centerX {
    return self.center.x;
}

- (void)setW_centerY:(CGFloat)w_centerY{
    CGPoint center = self.center;
    center.y = w_centerY;
    self.center = center;
}

- (CGFloat)w_centerY {
    return self.center.y;
}


@end
