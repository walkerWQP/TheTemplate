//
//  HomeViewController.m
//  TheTemplate
//
//  Created by yunjobs on 2018/6/26.
//  Copyright © 2018年 walker. All rights reserved.
//

#import "HomeViewController.h"
#import "TestViewController.h"

@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView * _tableView;
}

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
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, APP_WIDTH, APP_HEIGHT) style:UITableViewStyleGrouped];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    [self.view addSubview:_tableView];
    
    
    
}

#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * identifier = @"identifier";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    if (indexPath.row==0) {
        cell.textLabel.text=@"加载中...";
    } else if (indexPath.row==1) {
        cell.textLabel.text=@"加载中成功";
    } else if (indexPath.row==2) {
        cell.textLabel.text=@"加载中失败";
    } else if (indexPath.row==3) {
        cell.textLabel.text=@"自定义提示语";
    }
    return cell;
}
#pragma mark UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.01f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01f;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = [_tableView.dataSource tableView:tableView cellForRowAtIndexPath:indexPath];
    if ([cell.textLabel.text isEqualToString:@"加载中..."]) {
        [WProgressHUD showHUDShowText:@"加载中..."];
        [self performSelector:@selector(DelayLoad) withObject:nil afterDelay:3];
    } else if ([cell.textLabel.text isEqualToString:@"加载中成功"]) {
        [WProgressHUD showSuccessfulAnimatedText:@"加载中成功"];
        
    } else if ([cell.textLabel.text isEqualToString:@"加载中失败"]) {
        [WProgressHUD showErrorAnimatedText:@"加载中失败"];
    } else {
        [WProgressHUD showDpromptText:cell.textLabel.text];
    }
}
- (void)DelayLoad {
    [WProgressHUD hideAllHUDAnimated:YES];
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
