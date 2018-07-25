//
//  WSaveManage.h
//  TheTemplate
//
//  Created by yunjobs on 2018/6/26.
//  Copyright © 2018年 walker. All rights reserved.
//



//// 保存用户余额信息
//#define BALANCE @"BALANCE"
// 保存登录后的用户信息
#define USERINFO @"USERINFO"
// 保存登录后的token
#define LTOKEN @"token"
/// 保存提现账户
#define LTixianAccount @"WithdrawalAccount"
//保存消息通知的状态
#define PROMPT @"promptManage"

// 历史搜索记录
#define LHistoryRecord @"searchHistoryRecord"
// 企业历史搜索记录
#define LCHistoryRecord @"searchCHistoryRecord"

#import <Foundation/Foundation.h>

@interface WSaveManage : NSObject

+ (void)setObject:(id)value forKey:(NSString *)defaultName;

+ (id)objectForKey:(NSString *)defaultName;

+ (void)removeObjectForKey:(NSString *)defaultName;

+ (void)w_addObject:(id)value forKey:(NSString *)defaultName;
+ (void)w_removeIndex:(NSInteger)index forKey:(NSString *)defaultName;
+ (void)w_updateIndex:(NSInteger)index object:(id)value forKey:(NSString *)defaultName;

@end
