//
//  MapViewController.m
//  TheTemplate
//
//  Created by duxiu on 2018/8/18.
//  Copyright © 2018年 walker. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController ()<AMapLocationManagerDelegate, AMapGeoFenceManagerDelegate, MAMapViewDelegate>


@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"地图";
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    CLLocation *location = [locations lastObject];
    CLLocationDegrees latitude = location.coordinate.latitude;
    CLLocationDegrees longitude = location.coordinate.longitude;
    //some code
    
    NSLog(@"%f",latitude);
    NSLog(@"%f",longitude);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
