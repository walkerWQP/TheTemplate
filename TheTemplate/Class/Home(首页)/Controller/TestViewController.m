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

@interface TestViewController ()<YYInfiniteLoopViewDelegate,DateTimePickerViewDelegate,HZQDatePickerViewDelegate>
{
    HZQDatePickerView *_pikerView;
}

@property (nonatomic, strong) DateTimePickerView  *datePickerView;
@property (nonatomic, strong) UIButton            *timeBtn;
@property (nonatomic, strong) NSMutableArray      *imgArray;

@end

@implementation TestViewController

- (NSMutableArray *)imgArray {
    if (!_imgArray) {
        _imgArray = [NSMutableArray array];
    }
    return _imgArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    [button setTitle:@"点击" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(rightBtn:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    [self makeTestViewControllerUI];
}

- (void)makeTestViewControllerUI {
    
    self.imgArray = [NSMutableArray arrayWithObjects:@"帮助中心背景图",@"请假列表背景图",@"请假详情背景图", nil];
    
    
    self.bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, APP_WIDTH, APP_HEIGHT * 0.3)];
    [self.view addSubview:self.bgView];
    
    YYInfiniteLoopView *loopView = [YYInfiniteLoopView
                                    infiniteLoopViewWithImageUrls:self.imgArray
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
//    DateTimePickerView *pickerView = [[DateTimePickerView alloc] init];
//
//    self.datePickerView = pickerView;
//
//    pickerView.delegate = self;
//
//    pickerView.pickerViewMode = DatePickerViewDateMode;
//
//    [self.view addSubview:pickerView];
//
//    [pickerView showDateTimePickerView];
    [self setupDateView:DateTypeOfStart]; //开始时间。  [self setupDateView:DateTypeOfEnd];  //结束时间
}

- (void)getSelectDate:(NSString *)date type:(DateType)type {
    NSLog(@"%d - %@", type, date);
    switch (type) {
        case DateTypeOfStart:
            [self.timeBtn setTitle:date forState:UIControlStateNormal];
            break;
            
        case DateTypeOfEnd:
            [self.timeBtn setTitle:date forState:UIControlStateNormal];
            break;
            
        default:
            break;
    }
}

- (void)setupDateView:(DateType)type {
    
    _pikerView = [HZQDatePickerView instanceDatePickerView];
    _pikerView.frame = CGRectMake(0, 0, APP_WIDTH, APP_HEIGHT + 20);
    [_pikerView setBackgroundColor:[UIColor clearColor]];
    _pikerView.delegate = self;
    _pikerView.type = type;
    // 今天开始往后的日期
    [_pikerView.datePickerView setMinimumDate:[NSDate date]];
    // 在今天之前的日期
    //    [_pikerView.datePickerView setMaximumDate:[NSDate date]];
    [self.view addSubview:_pikerView];
    
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
