//
//  LocationManager.m
//  GuXian
//
//  Created by menthu on 2020/5/3.
//  Copyright © 2020 menthu. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>
#import "LocationManager.h"
#import "NSString+Extend.h"
#import "CommonHead.h"

@interface LocationManager () <CLLocationManagerDelegate>{
    NSString *currentCity;//当前城市
    NSString *strlatitude;//经度
    NSString *strlongitude;//纬度
}

@property (nonatomic, strong) CLLocationManager *locationmanager;
@property (nonatomic, strong) NSMutableArray *callBackArray;

@end

@implementation LocationManager

kSingleM

- (instancetype)init{
    if (self = [super init]) {
        self.callBackArray = @[].mutableCopy;
    }
    return self;
}

- (CLLocationManager *)locationmanager{
    if (_locationmanager == nil) {
        CLLocationManager *locationmanager = [[CLLocationManager alloc]init];
        locationmanager.delegate = self;
        [locationmanager requestAlwaysAuthorization];
        [locationmanager requestWhenInUseAuthorization]; //设置寻址精度
        locationmanager.desiredAccuracy = kCLLocationAccuracyBest;
        locationmanager.distanceFilter = 5.0;
        _locationmanager = locationmanager;
    }
    return _locationmanager;
}

+ (void)getCurrentLocationCity:(void (^) (BOOL isSucc, NSString *cityName, NSString *errMsg))callBack{
    [LocationManager.shareInstance.callBackArray addObject:callBack];
    [LocationManager.shareInstance getLocation];
}

- (void)getLocation{ //判断定位功能是否打开
    if ([CLLocationManager locationServicesEnabled]) {
        [self.locationmanager startUpdatingLocation];
    }else{
        [self calloutsideWith:1 errMsg:@"无定位权限" cityName:nil];
    }
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    [self.locationmanager stopUpdatingLocation];
    [self calloutsideWith:1 errMsg:@"无定位权限" cityName:nil];
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    [self.locationmanager stopUpdatingLocation]; //旧址
    CLLocation *currentLocation = [locations lastObject];
    CLGeocoder *geoCoder = [[CLGeocoder alloc]init]; //打印当前的经度与纬度
    @weakify(self);
    [geoCoder reverseGeocodeLocation:currentLocation completionHandler:^(NSArray <CLPlacemark *> * __nullable placemarks, NSError * __nullable error) {
        @strongify(self);
        if (placemarks.count > 0) {
            CLPlacemark *placeMark = placemarks[0];
            if (placeMark.locality.isExist) {
//                NSLog(@"----%@",placeMark.country);//当前国家
//                NSLog(@"%@",placeMark.locality);//当前的城市
//                NSLog(@"%@",placeMark.subLocality);//当前的位置
//                NSLog(@"%@",placeMark.thoroughfare);//当前街道
//                NSLog(@"%@",placeMark.name);//具体地址
                [self calloutsideWith:0 errMsg:nil cityName:placeMark.locality];
            }
        }else{
            [self calloutsideWith:2 errMsg:@"城市反编码失败" cityName:nil];
        }
    }];
}

- (void)calloutsideWith:(NSInteger)errCode errMsg:(NSString *)errMsg cityName:(NSString *)cityName{
    [self.callBackArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        void (^callBack) (BOOL isSucc, NSString *cityName, NSString *errMsg) =
        (void (^) (BOOL isSucc, NSString *cityName, NSString *errMsg))obj;
        callBack(errCode == 0, cityName, errMsg);
    }];
    [self.callBackArray removeAllObjects];
}

@end
