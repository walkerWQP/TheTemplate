//
//  MainTabBarController.m
//  TheTemplate
//
//  Created by yunjobs on 2018/6/26.
//  Copyright © 2018年 walker. All rights reserved.
//

#import "MainTabBarController.h"
#import "HomeViewController.h"
#import "MineViewController.h"
#import "WNavigationController.h"

@interface MainTabBarController ()

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self buildMainTabbarController];
}

#pragma mark ======= 实现方法 =======
- (void)buildMainTabbarController {
    [self setupChildViewController:@"首页" viewController:[HomeViewController new] image:@"home" selectedImage:@"home"];
    
    [self setupChildViewController:@"我的" viewController:[MineViewController new] image:@"mine" selectedImage:@"mine"];
}

#pragma mark ======= 方法 =======
- (void)setupChildViewController:(NSString *)title viewController:(UIViewController *)controller image:(NSString *)image selectedImage:(NSString *)selectedImage {
    UITabBarItem *item = [[UITabBarItem alloc]init];
    item.image = [UIImage imageNamed:image];
    item.selectedImage = [UIImage imageNamed:selectedImage];;
    item.title = title;
    controller.tabBarItem = item;
    WNavigationController *navController = [[WNavigationController alloc]initWithRootViewController:controller];
    [self addChildViewController:navController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
