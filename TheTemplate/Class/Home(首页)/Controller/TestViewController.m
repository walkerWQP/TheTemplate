//
//  TestViewController.m
//  TheTemplate
//
//  Created by yunjobs on 2018/7/2.
//  Copyright © 2018年 walker. All rights reserved.
//

#import "TestViewController.h"
#import "TwoViewController.h"
#import "BusinessDetailController.h"

@interface TestViewController ()<YYInfiniteLoopViewDelegate,DateTimePickerViewDelegate>

@property (nonatomic, strong) DateTimePickerView  *datePickerView;
@property (nonatomic, strong) UIButton            *timeBtn;


@end

@implementation TestViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    [button setTitle:@"点击" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(rightBtn:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    [self makeTestViewControllerUI];
}

- (void)makeTestViewControllerUI {
    
     NSArray *imgArr = @[@"http://www.zuimei666.top/data/upload/mobile/special/s0/s0_05550858506170603.jpg",@"http://www.zuimei666.top/data/upload/mobile/special/s0/s0_05550858646743538.jpg",@"http://www.zuimei666.top/data/upload/mobile/special/s0/s0_05550858706504268.jpg",@"http://www.zuimei666.top/data/upload/mobile/special/s0/s0_05550858771581030.jpg"];
    
    self.bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, APP_WIDTH, APP_HEIGHT * 0.3)];
    self.bgView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.bgView];
    
    YYInfiniteLoopView *loopView = [YYInfiniteLoopView
                                    infiniteLoopViewWithImageUrls:imgArr
                                    titles:nil
                                    didSelectedImage:^(NSInteger index) {
                                        NSLog(@"%zd",index);
                                        
                                        
                                    }];
    // 设置代理
    loopView.delegate = self;
    // loopView.timeInterval = 5;
    // loopView.animationDuration = 1.5f;
    loopView.animationType = InfiniteLoopViewAnimationTypeMoveIn;
    // 设置frame
    loopView.frame = CGRectMake(0, 0, self.bgView.frame.size.width, self.bgView.frame.size.height);
    [self.bgView addSubview:loopView];
    
    self.timeBtn = [[UIButton alloc] initWithFrame:CGRectMake(40, APP_HEIGHT * 0.3 + 40, 200, 30)];
    [self.timeBtn setTitle:@"点击" forState:UIControlStateNormal];
    [self.timeBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.timeBtn.layer.masksToBounds  = YES;
    self.timeBtn.layer.cornerRadius   = 5;
    self.timeBtn.layer.borderColor    = fengeLineColor.CGColor;
    self.timeBtn.layer.borderWidth    = 1;
    [self.timeBtn addTarget:self action:@selector(timeBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view  addSubview:self.timeBtn];
    
    
}

- (void)timeBtn : (UIButton *)sender {
    DateTimePickerView *pickerView = [[DateTimePickerView alloc] init];
    
    self.datePickerView = pickerView;
    
    pickerView.delegate = self;
    
    pickerView.pickerViewMode = DatePickerViewDateMode;
    
    [self.view addSubview:pickerView];
    
    [pickerView showDateTimePickerView];
}

- (void)didClickFinishDateTimePickerView:(NSString *)date{
    
    [self.timeBtn setTitle:date forState:UIControlStateNormal];
    
}

- (void)rightBtn : (UIButton *)sender {
//    BusinessDetailController *businessVC = [[BusinessDetailController alloc] init];
//    businessVC.urlStr = @"http://www.zugeliang01.com/";
//    [self.navigationController pushViewController:businessVC animated:YES];
    BusinessDetailController *TwoViewC = [[BusinessDetailController alloc] init];
    TwoViewC.urlStr = @"http://d.ksznxt.com/xc.html";
    TwoViewC.webTitle = @"学生活动";
    [self.navigationController pushViewController:TwoViewC animated:YES];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
