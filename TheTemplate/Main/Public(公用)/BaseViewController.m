//
//  BaseViewController.m
//  TheTemplate
//
//  Created by yunjobs on 2018/6/26.
//  Copyright © 2018年 walker. All rights reserved.
//

#import "BaseViewController.h"
#import "WNavigationController.h"

static MBProgressHUD *W_Hud;

@interface BaseViewController ()

@property (nonatomic, strong) void(^backBlock)(void);

@end

@implementation BaseViewController

- (UILabel *)hintLabel
{
    if (_hintLabel == nil) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, APP_WIDTH, 100)];
        label.center = CGPointMake(APP_WIDTH*0.5, (APP_HEIGHT-APP_NAVH)*0.5);
        label.text = @"没有相关数据";
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = RGB(180, 180, 180);
        label.font = [UIFont systemFontOfSize:16];
        label.hidden = YES;
        _hintLabel = label;
        [self.view addSubview:label];
    }
    return _hintLabel;
}

- (MBProgressHUD *)hud
{
    if (W_Hud == nil) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            UIWindow *window = [UIApplication sharedApplication].keyWindow;
            W_Hud = [[MBProgressHUD alloc] initWithView:window];
            [window addSubview:W_Hud];
        });
    }
    return W_Hud;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    //改变状态栏颜色
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    //兼容iOS7.0导航栏问题
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 7.0)
    {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    
    self.view.backgroundColor = backColor;
    self.navigationController.navigationBar.translucent = NO;
    
    // 添加网络失败通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(networkNotifyHander:) name:kNetworkNotification object:nil];
    
    //    NSLog(@"%f",APP_HEIGHT);
    //    NSLog(@"%f",[self yq_viewHeight]);
    //    NSLog(@"%f",[self yq_navHeight]);
    //    NSLog(@"%f",[self yq_tabbarHeight]);
}

- (void)setIsShowNoMoreData:(BOOL)isShowNoMoreData
{
    _isShowNoMoreData = isShowNoMoreData;
    self.hintLabel.hidden = !isShowNoMoreData;
}

- (void)presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion
{
    [super presentViewController:viewControllerToPresent animated:flag completion:completion];
    
    //    isKindOfClass来确定一个对象是否是一个类的成员，或者是派生自该类的成员
    //    　　isMemberOfClass只能确定一个对象是否是当前类的成员
    UIViewController *vc = nil;
    if ([viewControllerToPresent isKindOfClass:[WNavigationController class]]) {
        vc = viewControllerToPresent.childViewControllers[0];
    }else if ([viewControllerToPresent isKindOfClass:[self class]]) {
        vc = viewControllerToPresent;
    }
    if (vc != nil) {
        UIBarButtonItem *back = [UIBarButtonItem itemWithImage:@"back" highImage:@"back" target:self action:@selector(backButnClicked:)];
        vc.navigationItem.leftBarButtonItem = back;
    }
}

// 添加一个自定义的返回按钮  block 处理点击事件
- (void)addBackButton:(void(^)(void))block
{
    UIBarButtonItem *back = [UIBarButtonItem itemWithImage:@"back" highImage:@"back" target:self action:@selector(backButnClicked:)];
    self.navigationItem.leftBarButtonItem = back;
    if (block) {
        self.backBlock = block;
    }
}

-(void)backButnClicked:(id)sender
{
    if (self.backBlock) {
        self.backBlock();
    }else{
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

/// 网络失败时处理
- (void)networkNotifyHander:(NSNotification *)notification {
    self.hud.hidden = YES;
    NSError *error = notification.object;
    if (error.code == -1001) {
        //        NSError *error = [NSError errorWithDomain:@"请求超时!" code:-1001 userInfo:@{@"errorkey":@"请求超时!"}];
        [WToast w_ToastText:@"请求超时!" bottomOffset:100];
    }else if (error.code == -10086){
        [WToast w_ToastText:@"已断开与互联网的连接!" bottomOffset:100];
    }else {
        //        NSError *error = [NSError errorWithDomain:@"网络请求失败!" code:-1001 userInfo:@{@"errorkey":@"网络请求失败!"}];
        [WToast w_ToastText:@"网络请求失败!" bottomOffset:100];
    }
}


@end
