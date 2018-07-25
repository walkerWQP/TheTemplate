//
//  UIView+Frame.h
//  TheTemplate
//
//  Created by yunjobs on 2018/6/26.
//  Copyright © 2018年 walker. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Frame)

@property (nonatomic, assign) CGFloat w_width;
@property (nonatomic, assign) CGFloat w_height;

@property (nonatomic, assign) CGFloat w_x;
@property (nonatomic, assign) CGFloat w_y;

@property (nonatomic, assign) CGFloat w_bottom;
@property (nonatomic, assign) CGFloat w_right;

@property (nonatomic, assign) CGSize w_size;
@property (nonatomic, assign) CGPoint w_origin;

@property (nonatomic, assign) CGFloat w_centerX;
@property (nonatomic, assign) CGFloat w_centerY;

@end
