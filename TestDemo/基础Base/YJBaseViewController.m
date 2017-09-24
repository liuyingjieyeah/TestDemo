//
//  YJBaseViewController.m
//  TestDemo
//
//  Created by 刘英杰 on 2017/9/21.
//  Copyright © 2017年 刘英杰. All rights reserved.
//

#import "YJBaseViewController.h"

// Controllers
#import "YJRootTabBarController.h"

// Models

// Views

// Vendors

// Categories

// Others

@interface YJBaseViewController ()

@end

@implementation YJBaseViewController

static YJBaseViewController *_shareInstance;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpUI];
}

#pragma mark - 实例化
+ (instancetype)shareInstance {
    
    if (!_shareInstance) {
        _shareInstance = [[YJBaseViewController alloc]init];
    }
    return _shareInstance;
}

#pragma mark - 设置界面
- (void)setUpUI {
    self.view.backgroundColor = BackGroundC;
    
    //去掉navigationitem下面的阴影
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    
    //隐藏多余cell
    //    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}

#pragma mark - 收起键盘
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}



@end
