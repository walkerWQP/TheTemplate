//
//  WSaveManage.m
//  TheTemplate
//
//  Created by yunjobs on 2018/6/26.
//  Copyright © 2018年 walker. All rights reserved.
//

#import "WSaveManage.h"

@implementation WSaveManage

+ (void)setObject:(id)value forKey:(NSString *)defaultName
{
    if (value == nil || defaultName == nil) {
        NSLog(@"存储值不能为空");
    }else{
        [[NSUserDefaults standardUserDefaults] setObject:value forKey:defaultName];
    }
}

+ (id)objectForKey:(NSString *)defaultName
{
    if (defaultName == nil) {
        NSLog(@"获取key为空");
        return nil;
    }
    return [[NSUserDefaults standardUserDefaults] objectForKey:defaultName];
}

+ (void)removeObjectForKey:(NSString *)defaultName
{
    if (defaultName == nil) {
        NSLog(@"获取key为空");
    }else{
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:defaultName];
    }
}

+ (void)w_addObject:(id)value forKey:(NSString *)defaultName
{
    if (value == nil || defaultName == nil) {
        NSLog(@"存储值不能为空");
    }else{
        id tempValue = [[NSUserDefaults standardUserDefaults] objectForKey:defaultName];
        if ([value isKindOfClass:[NSArray class]]) {
            if ([tempValue isKindOfClass:[NSArray class]]) {
                NSMutableArray *mArr = [NSMutableArray arrayWithArray:tempValue];
                [mArr insertObject:value atIndex:0];
                [[NSUserDefaults standardUserDefaults] setObject:mArr forKey:defaultName];
            }else if ([tempValue isKindOfClass:[NSDictionary class]]){
                // 暂时用不到不处理
                //NSMutableDictionary *mDict = [NSMutableDictionary dictionaryWithDictionary:tempValue];
                //[mDict setObject:value forKey:@""];
                //[[NSUserDefaults standardUserDefaults] setObject:mDict forKey:defaultName];
            }else if (tempValue == nil && [value isKindOfClass:[NSDictionary class]]){
                NSArray *arr = @[value];
                [[NSUserDefaults standardUserDefaults] setObject:arr forKey:defaultName];
            }
        }else if ([value isKindOfClass:[NSDictionary class]]){
            if ([tempValue isKindOfClass:[NSArray class]]) {
                NSMutableArray *mArr = [NSMutableArray arrayWithArray:tempValue];
                [mArr insertObject:value atIndex:0];
                [[NSUserDefaults standardUserDefaults] setObject:mArr forKey:defaultName];
            }else if ([tempValue isKindOfClass:[NSDictionary class]]){
                // 暂时用不到不处理
                //NSMutableDictionary *mDict = [NSMutableDictionary dictionaryWithDictionary:tempValue];
                //[mDict setObject:value forKey:@""];
                //[[NSUserDefaults standardUserDefaults] setObject:mDict forKey:defaultName];
            }else if (tempValue == nil && [value isKindOfClass:[NSDictionary class]]){
                NSArray *arr = @[value];
                [[NSUserDefaults standardUserDefaults] setObject:arr forKey:defaultName];
            }
        }else{
            NSLog(@"其他类型");
        }
    }
}
+ (void)w_removeIndex:(NSInteger)index forKey:(NSString *)defaultName
{
    id tempValue = [[NSUserDefaults standardUserDefaults] objectForKey:defaultName];
    if ([tempValue isKindOfClass:[NSArray class]]) {
        NSMutableArray *mArr = [NSMutableArray arrayWithArray:tempValue];
        if (index >= mArr.count) {
            NSLog(@"数组溢出");
        }else{
            [mArr removeObjectAtIndex:index];
        }
        [[NSUserDefaults standardUserDefaults] setObject:mArr forKey:defaultName];
    }else if ([tempValue isKindOfClass:[NSDictionary class]]){
        
    }else{
        
    }
}
+ (void)w_updateIndex:(NSInteger)index object:(id)value forKey:(NSString *)defaultName
{
    id tempValue = [[NSUserDefaults standardUserDefaults] objectForKey:defaultName];
    if ([tempValue isKindOfClass:[NSArray class]]) {
        NSMutableArray *mArr = [NSMutableArray arrayWithArray:tempValue];
        if (index >= mArr.count) {
            NSLog(@"数组溢出");
        }else{
            [mArr removeObjectAtIndex:index];
            [mArr insertObject:value atIndex:index];
        }
        [[NSUserDefaults standardUserDefaults] setObject:mArr forKey:defaultName];
        
    }else if ([tempValue isKindOfClass:[NSDictionary class]]){
        
    }else{
        
    }
}

@end
