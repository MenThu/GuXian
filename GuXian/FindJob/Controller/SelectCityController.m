//
//  SelectCityController.m
//  GuXian
//
//  Created by menthu on 2020/5/3.
//  Copyright © 2020 menthu. All rights reserved.
//

#import <CoreFoundation/CoreFoundation.h>
#import "SelectCityController.h"
#import "LocationManager.h"
#import "Masonry.h"
#import "NSString+Extend.h"
#import "CitySectionHead.h"
#import "CityCell.h"
#import "SelectIndexView.h"

static CGFloat const CITY_HEIGHT = 50;
static CGFloat const HOT_CITY_LABEL_HEIGHT = 50;
static CGFloat const HOT_ICON_HEIGHT = 30;
static CGFloat const INDEX_VIEW_WIDTH = 25;

@interface CityAttribute : NSObject

@property (nonatomic, strong) NSString *cityName;
@property (nonatomic, strong) NSString *pinyinFirstCharacter;

@end

@interface SelectCityModel : NSObject

@property (nonatomic, strong) NSString *initialCharacter;
@property (nonatomic, strong) NSArray <CityAttribute *> *cityArray;

@end

@interface SelectCityController ()

@property (nonatomic, strong) UIView *tableHeadView;
@property (nonatomic, weak) UILabel *locationCityLabel;
@property (nonatomic, weak) UIView *hotCityView;
@property (nonatomic, weak) UILabel *firstHotCity;
@property (nonatomic, weak) UILabel *secondHotCity;
@property (nonatomic, weak) UILabel *thirdHotCity;
@property (nonatomic, strong) NSDictionary <NSString *, NSMutableArray <CityAttribute *> *> *citySource;
@property (nonatomic, strong) NSArray <NSString *> *allKeys;
@property (nonatomic, weak) SelectIndexView *indexView;
@property (nonatomic, weak) UILabel *hintLabel;

@end

@implementation SelectCityController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"选择城市";
    [self configCityData];
    [self configView];
}

- (void)configCityData{
    NSMutableDictionary *citySource = [NSMutableDictionary dictionary];
    NSArray <NSDictionary *> *tempArray = [[NSArray alloc] initWithContentsOfFile:[NSBundle.mainBundle pathForResource:@"city" ofType:@"plist"]];
    for (NSDictionary *param in tempArray) {
        NSArray <NSString *> *citys = param[@"cities"];
        for (NSString *cityName in citys) {
            @autoreleasepool {
                NSString *pinyin = cityName.getPinyin;
                CityAttribute *attribute = CityAttribute.new;
                attribute.cityName = cityName;
                attribute.pinyinFirstCharacter = [pinyin substringWithRange:NSMakeRange(0, 1)];
                NSMutableArray <CityAttribute *> *cityArray = citySource[attribute.pinyinFirstCharacter];
                if (!cityArray || ![cityArray isKindOfClass:NSMutableArray.class]) {
                    cityArray = [NSMutableArray array];
                    citySource[attribute.pinyinFirstCharacter] = cityArray;
                }
                [cityArray addObject:attribute];
            }
        }
    }
    
    //按照key排序
    self.allKeys = [citySource.allKeys sortedArrayUsingComparator:^NSComparisonResult(NSString *  _Nonnull obj1, NSString *  _Nonnull obj2) {
        return [obj1 compare:obj2];
    }];
    
    self.citySource = citySource;
}

- (void)configView{
    [self configTableHeadView];
    [self configTableView];
    [self configIndexView];
}

- (void)configIndexView{
    @weakify(self);
    SelectIndexView *indexView = [[SelectIndexView alloc] init];
    [self.view addSubview:(_indexView = indexView)];
    indexView.allKeys = self.allKeys;
    indexView.clickCallBack = ^(NSInteger status, NSInteger index) {
        if (status == 0) {
            self.hintLabel.hidden = NO;
        }else if (status == 2){
            self.hintLabel.hidden = YES;
            return;
        }
        [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:index] atScrollPosition:UITableViewScrollPositionTop animated:NO];
        self.hintLabel.text = self.allKeys[index];
    };
    [indexView mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.top.bottom.right.equalTo(self.view);
        make.width.mas_equalTo(INDEX_VIEW_WIDTH);
    }];
}

- (void)configTableView{
    self.tableView.placeHoldView = nil;
    self.tableView.mj_header.hidden = YES;
    self.tableView.mj_footer.hidden = YES;
    self.tableView.tableHeaderView = self.tableHeadView;
    [self.tableView registerNib:[UINib nibWithNibName:@"CityCell" bundle:nil] forCellReuseIdentifier:@"CityCell"];
    [self.tableView registerClass:CitySectionHead.class forHeaderFooterViewReuseIdentifier:@"CitySectionHead"];
}

- (void)configTableHeadView{
    UILabel *locationCityLabel = UILabel.new;
    locationCityLabel.textAlignment = NSTextAlignmentCenter;
    locationCityLabel.textColor = UIColor.blackColor;
    locationCityLabel.font = [UIFont systemFontOfSize:15.f];
    [LocationManager getCurrentLocationCity:^(BOOL isSucc, NSString * _Nonnull cityName, NSString * _Nonnull errMsg) {
        locationCityLabel.text = isSucc ? cityName : errMsg;
    }];
    
    UILabel *tempLabel = UILabel.new;
    tempLabel.text = @"热门城市";
    tempLabel.font = [UIFont systemFontOfSize:15];
    tempLabel.textColor = UIColor.grayColor;
    tempLabel.textAlignment = NSTextAlignmentCenter;
    
    UILabel *firstHotCity = [self getHotCityLabelWith:@"广州"];
    firstHotCity.tag = 0;
    UILabel *secondHotCity = [self getHotCityLabelWith:@"杭州"];
    secondHotCity.tag = 1;
    UILabel *thirdHotCity = [self getHotCityLabelWith:@"深圳"];
    thirdHotCity.tag = 2;
    
    UIView *hotCityView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1000, 1000)];
    hotCityView.backgroundColor = RGBA(240, 243, 246, 1);
    [hotCityView addSubview:tempLabel];
    [hotCityView addSubview:(_firstHotCity = firstHotCity)];
    [hotCityView addSubview:(_secondHotCity = secondHotCity)];
    [hotCityView addSubview:(_thirdHotCity = thirdHotCity)];
    
    UIView *tableHeadView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1000, 1000)];
    tableHeadView.backgroundColor = UIColor.whiteColor;
    [tableHeadView addSubview:(_locationCityLabel = locationCityLabel)];
    [tableHeadView addSubview:(_hotCityView = hotCityView)];
    self.tableHeadView = tableHeadView;
    
    [tempLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(hotCityView).offset(10);
        make.left.equalTo(hotCityView).offset(15);
        make.height.mas_equalTo(HOT_ICON_HEIGHT);
    }];
    
    [firstHotCity mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(tempLabel.mas_bottom).offset(10);
        make.left.equalTo(tempLabel);
        make.height.mas_equalTo(HOT_CITY_LABEL_HEIGHT);
    }];
    
    [secondHotCity mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(firstHotCity.mas_right).offset(10);
        make.centerY.equalTo(firstHotCity);
        make.width.height.equalTo(firstHotCity);
    }];
    
    [thirdHotCity mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(secondHotCity.mas_right).offset(10);
        make.centerY.equalTo(firstHotCity);
        make.width.height.equalTo(firstHotCity);
        make.right.equalTo(hotCityView).offset(-20);
    }];
    
    [locationCityLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(tableHeadView);
        make.left.equalTo(tableHeadView).offset(10);
        make.height.mas_equalTo(CITY_HEIGHT);
    }];
    
    [hotCityView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(locationCityLabel.mas_bottom);
        make.left.bottom.right.equalTo(tableHeadView);
    }];
}

- (UILabel *)getHotCityLabelWith:(NSString *)text{
    UILabel *hotCityLabel = UILabel.new;
    hotCityLabel.backgroundColor = UIColor.whiteColor;
    hotCityLabel.text = text;
    hotCityLabel.font = [UIFont systemFontOfSize:17];
    hotCityLabel.textColor = UIColor.blackColor;
    hotCityLabel.textAlignment = NSTextAlignmentCenter;
    hotCityLabel.layer.cornerRadius = 25.f;
    hotCityLabel.layer.masksToBounds = YES;
    hotCityLabel.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *tapLabelGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapLabel:)];
    [hotCityLabel addGestureRecognizer:tapLabelGesture];
    
    return hotCityLabel;
}

- (void)tapLabel:(UITapGestureRecognizer *)gesture{
    UILabel *label = (UILabel *)gesture.view;
    [self popWithCityName:label.text];
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    self.tableHeadView.bounds = CGRectMake(0, 0, CGRectGetWidth(self.tableView.bounds), CITY_HEIGHT+HOT_ICON_HEIGHT+HOT_CITY_LABEL_HEIGHT+20);
    self.tableView.tableHeaderView = self.tableHeadView;
    self.tableView.frame = self.view.bounds;
}

#pragma mark - TableView代理
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.allKeys.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.citySource[self.allKeys[section]].count;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    CitySectionHead *head = (CitySectionHead *)[tableView dequeueReusableHeaderFooterViewWithIdentifier:@"CitySectionHead"];
    if (!head) {
        head = [[CitySectionHead alloc] initWithReuseIdentifier:@"sectionHeader"];
    }
    head.firstCharasetLabel.text = self.allKeys[section];
    return head;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 60;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 45.f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    }
    cell.textLabel.text = self.citySource[self.allKeys[indexPath.section]][indexPath.row].cityName;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cityName = self.citySource[self.allKeys[indexPath.section]][indexPath.row].cityName;
    [self popWithCityName:cityName];
}

- (void)popWithCityName:(NSString *)cityName{
    if (self.callBack) {
        self.callBack(cityName);
        self.callBack = nil;
    }
    [self.navigationController popViewControllerAnimated:YES];
}

- (UILabel *)hintLabel{
    if (_hintLabel == nil) {
        UILabel *hintLabel = UILabel.new;
        hintLabel.hidden = YES;
        hintLabel.font = [UIFont boldSystemFontOfSize:23];
        hintLabel.textColor = UIColor.whiteColor;
        hintLabel.layer.cornerRadius = 12;
        hintLabel.layer.masksToBounds = YES;
        hintLabel.textAlignment = NSTextAlignmentCenter;
        hintLabel.backgroundColor = RGBA(0, 0, 0, 0.6);
        [self.view addSubview:(_hintLabel = hintLabel)];
        @weakify(self);
        [hintLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            @strongify(self);
            make.width.height.mas_equalTo(80);
            make.center.equalTo(self.view);
        }];
    }
    return _hintLabel;
}

@end

@implementation SelectCityModel

@end

@implementation CityAttribute


@end
