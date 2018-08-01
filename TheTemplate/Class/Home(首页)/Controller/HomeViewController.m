//
//  HomeViewController.m
//  TheTemplate
//
//  Created by yunjobs on 2018/6/26.
//  Copyright © 2018年 walker. All rights reserved.
//

#import "HomeViewController.h"
#import "TestViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"首页";
    self.view.backgroundColor = backColor;
    [self makeHomeViewControllerUI];
    
}

- (void)makeHomeViewControllerUI {
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 60)];
    [button setTitle:@"点击事件" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(rightBtn:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    
    
    
}





- (void)rightBtn:(UIButton *)sender {
    
    TestViewController *testVC = [[TestViewController alloc] init];
    [self.navigationController pushViewController:testVC animated:YES];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
