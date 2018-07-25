//
//  WToast.m
//  TheTemplate
//
//  Created by yunjobs on 2018/6/26.
//  Copyright © 2018年 walker. All rights reserved.
//

#import "WToast.h"

@interface WToast()
{
    CGFloat duration; // 显示时间
}
@end

@implementation WToast

#pragma mark - UIAlertView
/// 警告框UIAlertView
+ (void)w_AlertText:(NSString *)text {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"友情提示" message:text delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
}

#pragma mark - Toast

// 设置显示时间
- (void)setDuration:(CGFloat) duration_{
    duration = duration_;
}

// 初始化ToastView
- (UIView *)setUpTextLabel:(NSString *)text {
    // 计算大小
    UIFont *font = [UIFont boldSystemFontOfSize:14];
    CGSize textSize = [text boundingRectWithSize:CGSizeMake(280, MAXFLOAT) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName: font} context:nil].size;
    
    // 创建显示文字控件
    UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, textSize.width + 12, textSize.height + 12)];
    textLabel.backgroundColor = [UIColor clearColor];
    textLabel.textColor = [UIColor whiteColor];
    textLabel.textAlignment = NSTextAlignmentCenter;
    textLabel.font = font;
    textLabel.text = text;
    textLabel.numberOfLines = 0;
    
    // 创建显示背景
    UIView *toastView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, textLabel.frame.size.width, textLabel.frame.size.height)];
    toastView.backgroundColor = [UIColor colorWithWhite:0.000 alpha:0.75];
    toastView.alpha = 0;
    toastView.layer.cornerRadius = 5.0f;
    toastView.layer.borderWidth = 1.0f;
    toastView.layer.borderColor = [[UIColor grayColor] colorWithAlphaComponent:0.5].CGColor;
    [toastView addSubview:textLabel];
    toastView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    
    return toastView;
}

// 根据顶部偏移量显示ToastView
- (void)showToast:(UIView *)toast fromTopOffset:(CGFloat)offset {
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    toast.center = CGPointMake(window.center.x, offset + toast.frame.size.height*0.5);
    [self showToast:toast];
}
// 根据底部偏移量显示ToastView
- (void)showToast:(UIView *)toast fromBottomOffset:(CGFloat)offset {
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    toast.center = CGPointMake(window.center.x, window.frame.size.height-(offset + toast.frame.size.height*0.5));
    [self showToast:toast];
}
- (void)showToast:(UIView *)toast {
    UIWindow *view = [[[UIApplication sharedApplication] delegate] window];
    NSArray *windows = [UIApplication sharedApplication].windows;
    for (id windowView in windows) {
        NSString *viewName = NSStringFromClass([windowView class]);
        if ([@"UIRemoteKeyboardWindow" isEqualToString:viewName]) {
            view = windowView;
            break;
        }
    }
    [view addSubview:toast];
    
    [self showAnimation:toast];
    [self performSelector:@selector(hideAnimation:) withObject:toast afterDelay:duration];
}
// 显示动画
- (void)showAnimation:(UIView *)toast {
    [UIView animateWithDuration:.5 animations:^{
        toast.alpha = 0.75f;
    } completion:^(BOOL finished) {
        
    }];
}
// 隐藏动画
- (void)hideAnimation:(UIView *)toast {
    [UIView animateWithDuration:.3 animations:^{
        toast.alpha = 0.0f;
    } completion:^(BOOL finished) {
        [toast removeFromSuperview];
    }];
}

/// toast 默认位置 默认时间
+ (void)w_ToastText:(NSString *)text {
    WToast *warning = [[WToast alloc] init];
    [warning setDuration:DEFAULT_DISPLAY_DURATION];
    [warning showToast:[warning setUpTextLabel:text] fromBottomOffset:100];
}
/// toast 默认位置 自定义时间
+ (void)w_ToastText:(NSString *)text duration:(CGFloat)duration {
    WToast *warning = [[WToast alloc] init];
    [warning setDuration:duration];
    [warning showToast:[warning setUpTextLabel:text] fromBottomOffset:100];
}
/// toast 自定义距离顶部位置 自定义时间
+ (void)w_ToastText:(NSString *)text topOffset:(CGFloat)topOffset duration:(CGFloat)duration {
    WToast *warning = [[WToast alloc] init];
    [warning setDuration:duration];
    [warning showToast:[warning setUpTextLabel:text] fromTopOffset:topOffset];
}
/// toast 自定义距离底部位置 自定义时间
+ (void)w_ToastText:(NSString *)text bottomOffset:(CGFloat)bottomOffset duration:(CGFloat)duration {
    WToast *warning = [[WToast alloc] init];
    [warning setDuration:duration];
    [warning showToast:[warning setUpTextLabel:text] fromBottomOffset:bottomOffset];
}
/// toast 自定义距离顶部位置 默认时间
+ (void)w_ToastText:(NSString *)text topOffset:(CGFloat)topOffset {
    WToast *warning = [[self alloc] init];
    [warning setDuration:DEFAULT_DISPLAY_DURATION];
    [warning showToast:[warning setUpTextLabel:text] fromTopOffset:topOffset];
}
/// toast 自定义距离底部位置 默认时间
+ (void)w_ToastText:(NSString *)text bottomOffset:(CGFloat)bottomOffset {
    WToast *warning = [[WToast alloc] init];
    [warning setDuration:DEFAULT_DISPLAY_DURATION];
    [warning showToast:[warning setUpTextLabel:text] fromBottomOffset:bottomOffset];
}


@end
