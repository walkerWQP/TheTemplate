//
//  BaseViewController.h
//  TheTemplate
//
//  Created by yunjobs on 2018/6/26.
//  Copyright © 2018年 walker. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

@property (strong, nonatomic) MBProgressHUD *hud;

/// 是否显示没有更多数据
@property (nonatomic, strong) UILabel       *hintLabel;
@property (assign, nonatomic) BOOL          isShowNoMoreData;

/// 添加一个自定义的返回按钮  block 处理点击事件
- (void)addBackButton:(void(^)(void))block;

@end
