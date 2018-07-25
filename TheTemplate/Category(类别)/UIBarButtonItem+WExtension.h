//
//  UIBarButtonItem+WExtension.h
//  TheTemplate
//
//  Created by yunjobs on 2018/6/26.
//  Copyright © 2018年 walker. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (WExtension)

@property (nonatomic, strong) UIColor *barButtonItemColor;

@property (nonatomic, strong) NSString *barButtonItemTitle;

+ (instancetype)itemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action;

+ (instancetype)itemWithtitle:(NSString *)title titleColor:(UIColor *)color target:(id)target action:(SEL)action;

@end
