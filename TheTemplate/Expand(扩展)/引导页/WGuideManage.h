//
//  WGuideManage.h
//  TheTemplate
//
//  Created by yunjobs on 2018/6/26.
//  Copyright © 2018年 walker. All rights reserved.
//

#import <Foundation/Foundation.h>

// 版本
#define LVersion @"version"
// 注册页面跳转到首页的标识
#define LRegistFlag @"RegistFlag"
// 是否登录过标识登录的状态(1=登录,0=没有登录)
#define LOGINSTATUS @"loginStatus"
// 保存帐号密码
#define MYACCOUNT @"myAccount"

// 是否进入全屏广告页(1=进入,0=不进入)
#define LAdvertisement @"Advertisement"

// 保存认证状态(0未认证1已认证2芝麻信用3认证协议)
#define LAuthState @"AuthState"

@class AdvertisementEntity;

@interface WGuideManage : NSObject

+ (UIViewController *)chooseRootController;

@end
