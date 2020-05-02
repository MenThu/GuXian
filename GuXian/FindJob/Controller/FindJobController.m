//
//  FindJobController.m
//  GuXian
//
//  Created by menthu on 2020/5/2.
//  Copyright © 2020 menthu. All rights reserved.
//

#import "FindJobController.h"
#import "DeviceManager.h"
#import "CommonHead.h"
#import "UIImage+Extend.h"
#import "UITableView+PlaceHoldView.h"
#import "JobCell.h"

@interface FindJobController () <UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topSearchViewRight2Super;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *searchContainerView2Top;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topContainerViewHeight;

@property (weak, nonatomic) IBOutlet UITextField *searchTextField;

@property (weak, nonatomic) IBOutlet UIButton *allButton;
@property (weak, nonatomic) IBOutlet UIButton *beginCategory;
@property (weak, nonatomic) IBOutlet UIButton *shanghaiCategory;
@property (weak, nonatomic) IBOutlet UIButton *wuhanCategory;
@property (weak, nonatomic) IBOutlet UIButton *moreCategory;
@property (nonatomic, strong) NSArray <UIButton *> *buttonArray;


@property (weak, nonatomic) IBOutlet UITableView *jobTableView;
@property (nonatomic, strong) NSMutableArray <NSNumber *> *tableSource;

@end

@implementation FindJobController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self->_isNavibarHidden = YES;
    
    self.buttonArray = @[self.allButton, self.beginCategory, self.shanghaiCategory, self.wuhanCategory];
    for (UIButton *button in self.buttonArray) {
        [button setBackgroundImage:[UIImage createImgWithColor:RGBA(44, 50, 100, 1) imgSize:CGSizeMake(1, 1)]
                          forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage createImgWithColor:RGBA(236, 94, 122, 1) imgSize:CGSizeMake(1, 1)]
                          forState:UIControlStateSelected];
        button.layer.cornerRadius = 16.f;
        button.layer.masksToBounds = YES;
    }
    [self clickCategoryButton:self.allButton];
    
    @weakify(self);
    self.jobTableView.placeHoldView = [PlaceHoldView placeHoldWithImg:@"nodata" placeHold:@"没有数据哟" placeHoldOffset:CGPointZero tapView:^{
        @strongify(self);
        for (NSInteger index = 0; index < 10; index ++) {
            [self.tableSource addObject:@(0)];
        }
        [self.jobTableView reloadData];
    }];
    [self.jobTableView registerNib:[UINib nibWithNibName:@"JobCell" bundle:nil] forCellReuseIdentifier:@"JobCell"];
    self.tableSource = [[NSMutableArray alloc] init];
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    self.searchContainerView2Top.constant = 25 + getStatusBarHeight();
    self.topContainerViewHeight.constant = 175.f + (getStatusBarHeight() - 20);
}

- (IBAction)clickCategoryButton:(UIButton *)sender {
    if (!sender.selected) {
        for (UIButton *button in self.buttonArray) {
            if (button != sender) {
                button.selected = NO;
            }
        }
        sender.selected = YES;
    }
}


#pragma mark - TextFieldDelegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if (string.length > 0) {
        self.topSearchViewRight2Super.constant = 60;
    }else{
        NSMutableString *currentString = [NSMutableString stringWithString:textField.text];
        [currentString replaceCharactersInRange:range withString:string];
        self.topSearchViewRight2Super.constant = currentString.length > 0 ? 60 : 10;
    }
    return YES;
}


#pragma mark - TableView相关代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.tableSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JobCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JobCell" forIndexPath:indexPath];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

@end
