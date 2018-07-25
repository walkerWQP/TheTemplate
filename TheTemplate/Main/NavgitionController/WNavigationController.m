//
//  WNavigationController.m
//  TheTemplate
//
//  Created by yunjobs on 2018/6/26.
//  Copyright © 2018年 walker. All rights reserved.
//

#import "WNavigationController.h"

@interface WNavigationController ()

@property (nonatomic,strong) UIButton *backBtn;

@end

@implementation WNavigationController

+ (void)load {
    
    // 获取当前整个应用程序下的所有导航条的外观
    //    UINavigationBar *navBar = [UINavigationBar appearance];
    // 只影响当前类下面的导航条
    // 获取当前类下面的导航条
    UINavigationBar *navbar = [UINavigationBar appearanceWhenContainedIn:self, nil];
    
    [navbar setBackgroundImage:[UIImage imageWithColor:THEMECOLOR] forBarMetrics:UIBarMetricsDefault];
    
    
    NSMutableDictionary *mDict = [NSMutableDictionary dictionary];
    mDict[NSForegroundColorAttributeName] = [UIColor whiteColor];
    navbar.titleTextAttributes = mDict;
    
    //去掉黑线
    [navbar setShadowImage:[[UIImage alloc] init]];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.backBtn = ({
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
        btn.titleLabel.hidden = YES;
        [btn addTarget:self action:@selector(backBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        btn.contentEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
        btn.frame = CGRectMake(0, 0, 44, 40);
        btn;
    });
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count > 0) {
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:self.backBtn];
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:YES];
}


- (void)backBtnClicked:(UIButton *)btn {
    [self popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
