//
//  WMarco.h
//  TheTemplate
//
//  Created by yunjobs on 2018/6/26.
//  Copyright © 2018年 walker. All rights reserved.
//

#ifndef WMarco_h
#define WMarco_h

//系统版本
#define IOS_VERSION_11_OR_ABOVE (([[[UIDevice currentDevice] systemVersion] floatValue] >= 11.0)? (YES):(NO))
#define IOS_VERSION_10_OR_ABOVE (([[[UIDevice currentDevice] systemVersion] floatValue] >= 10.0)? (YES):(NO))
#define IOS_VERSION_9_OR_ABOVE (([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0)? (YES):(NO))
#define IOS_VERSION_8_OR_ABOVE (([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)? (YES):(NO))
#define IOS_VERSION_7_OR_ABOVE (([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0 && [[[UIDevice currentDevice] systemVersion] floatValue]<8.0)? (YES):(NO))
#define IOS_VERSION_6_OR_ABOVE (([[[UIDevice currentDevice] systemVersion] floatValue] >= 6.0 && [[[UIDevice currentDevice] systemVersion] floatValue]<8.0)? (YES):(NO))
//判断iphone版本
#define IS_IPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
#define IS_IPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)
#define IS_IPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define isPad  ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)

//屏幕宽高
#define APP_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define APP_HEIGHT ([[UIScreen mainScreen] bounds].size.height)

#define APP_NAVH ([UIScreen mainScreen].bounds.size.height==812 ? 88 : 64)
#define APP_TABH ([UIScreen mainScreen].bounds.size.height==812 ? 83 : 49)
#define APP_BottomH ([UIScreen mainScreen].bounds.size.height==812 ? 34 : 0)

#define HexColorInt32_t(rgbValue) \
[UIColor colorWithRed:((float)((0x##rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((0x##rgbValue & 0x00FF00) >> 8))/255.0 blue:((float)(0x##rgbValue & 0x0000FF))/255.0  alpha:1]

//判断是否iPhone X
#define IS_iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

// status bar height.
#define STATUS_BAR_HEIGHT (IS_iPhoneX ? 44.f : 20.f)

// Navigation bar height.
#define NAVIGATION_BAR_HEIGHT 44.f

// Status bar & navigation bar height.
#define STATUS_AND_NAVIGATION_HEIGHT (IS_iPhoneX ? 88.f : 64.f)

// Tabbar height.
#define TAB_BAR_HEIGHT (IS_iPhoneX ? (49.f + 34.f) : 49.f)

// Tabbar safe bottom margin.
#define TAB_BAR_SAFE_BOTTOM_MARGIN (IS_iPhoneX ? 34.f : 0.f)


#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

#endif /* WMarco_h */
