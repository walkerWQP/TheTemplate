//
//  WGuideManage.m
//  TheTemplate
//
//  Created by yunjobs on 2018/6/26.
//  Copyright © 2018年 walker. All rights reserved.
//

#import "WGuideManage.h"
#import "WNavigationController.h"
#import "MainTabBarController.h"
#import "LoginViewController.h"
#import "WGuideViewController.h"



@implementation WGuideManage

//#warning lyq:需要根据业务重新修改引导页逻辑
+ (UIViewController *)chooseRootController
{
    //    // 定义一个窗口的根控制器
    UIViewController *rootVc = [[UIViewController alloc] init];
    
    //   获取当前的最新版本号 2.0
    NSString *curVersion =  [NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"];
    
    // 获取上一次的版本号  1.0.1
    NSString *oldVersion = [WSaveManage objectForKey:LVersion];
    
    
    if ((curVersion!=nil&&![curVersion isEqualToString:oldVersion]) || oldVersion==nil) {
        [WSaveManage setObject:curVersion forKey:LVersion];
        
        WGuideViewController *newFeatureVc = [[WGuideViewController alloc] init];
        
        rootVc = newFeatureVc;
        
    }else{ // 没有最新的版本号
        
        if ([[WSaveManage objectForKey:LRegistFlag] isEqualToString:@"1"]) {
            MainTabBarController *tabBarVc = [[MainTabBarController alloc] init];
            rootVc = tabBarVc;
        }else{
            //判断有没有登录  如果登录过就进入主框架界面
            NSString *status = [WSaveManage objectForKey:LOGINSTATUS];
            if (status != nil && [status isEqualToString:@"1"])
            {
                MainTabBarController *tabBarVc = [[MainTabBarController alloc] init];
                rootVc = tabBarVc;
            }
            else{// 否则就进入登录页
//                LoginViewController *loginVC = [[LoginViewController alloc] init];
//                WNavigationController *loginVCNav = [[WNavigationController alloc] initWithRootViewController:loginVC];
//                rootVc = loginVCNav;
                // 设置登录状态
                [WSaveManage setObject:@"1" forKey:LOGINSTATUS];
                MainTabBarController *tabBarVc = [[MainTabBarController alloc] init];
                rootVc = tabBarVc;
//                UIWindow *window = [UIApplication sharedApplication].keyWindow;
//                UIViewController *rootVC = [WGuideManage chooseRootController];
//                window.rootViewController = rootVC;
            }
        }
    }
    
    
    
    return rootVc;
}

@end
