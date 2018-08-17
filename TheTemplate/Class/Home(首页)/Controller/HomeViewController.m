//
//  HomeViewController.m
//  TheTemplate
//
//  Created by yunjobs on 2018/6/26.
//  Copyright © 2018年 walker. All rights reserved.
//

#import "HomeViewController.h"
#import "TestViewController.h"
#import "PageViewController.h"

@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource,ZJPayPopupViewDelegate>
{
    UITableView * _tableView;
}

@property (nonatomic, strong) UIButton *passwordBtn;
@property (nonatomic, strong) ZJPayPopupView *payPopupView;
@property (nonatomic, strong) UIButton  *pageBtn;

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
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, APP_WIDTH, APP_HEIGHT * 0.3) style:UITableViewStyleGrouped];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    [self.view addSubview:_tableView];
    
    self.passwordBtn = [[UIButton alloc] initWithFrame:CGRectMake(20, _tableView.frame.size.height + 20, APP_WIDTH - 40, 40)];
    [self.passwordBtn setTitle:@"点击输入密码" forState:UIControlStateNormal];
    [self.passwordBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.passwordBtn.backgroundColor = [UIColor greenColor];
    [self.passwordBtn addTarget:self action:@selector(passwordBtnSelector:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.passwordBtn];
    
    self.pageBtn = [[UIButton alloc] initWithFrame:CGRectMake(20, self.passwordBtn.frame.size.height +  _tableView.frame.size.height + 30, APP_WIDTH - 40, 40)];
    [self.pageBtn setTitle:@"点击进入分页效果" forState:UIControlStateNormal];
    [self.pageBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.pageBtn.backgroundColor = [UIColor greenColor];
    [self.pageBtn addTarget:self action:@selector(pageBtnSelector:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.pageBtn];
    
    
    
    
}

- (void)pageBtnSelector:(UIButton *)sender {
    PageViewController *pageVC = [[PageViewController alloc] init];
    [self.navigationController pushViewController:pageVC animated:YES];
}

- (void)passwordBtnSelector:(UIButton *)sender {
    self.payPopupView = [[ZJPayPopupView alloc] init];
    self.payPopupView.delegate = self;
    [self.payPopupView showPayPopView];
}

#pragma mark - ZJPayPopupViewDelegate

- (void)didClickForgetPasswordButton {
    NSLog(@"点击了忘记密码");
}

- (void)didPasswordInputFinished:(NSString *)password {
    if ([password isEqualToString:@"123456"]) {
        NSLog(@"输入的密码正确");
    } else {
        NSLog(@"输入错误:%@",password);
        [self.payPopupView didInputPayPasswordError];
    }
}

//点击空白收回键盘
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
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
