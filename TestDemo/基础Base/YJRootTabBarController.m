//
//  YJRootTabBarController.m
//  TestDemo
//
//  Created by 刘英杰 on 2017/9/21.
//  Copyright © 2017年 刘英杰. All rights reserved.
//

#import "YJRootTabBarController.h"


// Controllers
#import "YJNavigationController.h"
#import "HomeViewController.h"

// Models

// Views
#import "YJTabBar.h"

// Vendors

// Categories

// Others


@interface YJRootTabBarController ()<UITabBarControllerDelegate>

@property (nonatomic, assign) NSInteger indexFlag;

@end

@implementation YJRootTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.delegate = self;

    //更换系统TabBar
    [self creatTabBarView];
    //添加子控制器
    [self addChildViewContorller];
}

#pragma mark - 更换系统tabbar
- (void)creatTabBarView {
    YJTabBar *tabBarV = [[YJTabBar alloc]init];
    tabBarV.backgroundColor = [UIColor whiteColor];
    //KVC把系统换成自定义
    [self setValue:tabBarV forKey:@"tabBar"];
}


#pragma mark - 添加子控制器
- (void)addChildViewContorller{
    NSArray *childArray = @[
                            @{MallClassKey  : @"HomeViewController",
                              MallTitleKey  : @"首页",
                              MallImgKey    : @"tabr_01_up",
                              MallSelImgKey : @"tabr_01_down"},
                            
                            @{MallClassKey  : @"HomeViewController",
                              MallTitleKey  : @"分类",
                              MallImgKey    : @"tabr_02_up",
                              MallSelImgKey : @"tabr_02_down"},
                            
                            @{MallClassKey  : @"HomeViewController",
                              MallTitleKey  : @"购物车",
                              MallImgKey    : @"tabr_04_up",
                              MallSelImgKey : @"tabr_04_down"},
                            
                            @{MallClassKey  : @"HomeViewController",
                              MallTitleKey  : @"我的",
                              MallImgKey    : @"tabr_05_up",
                              MallSelImgKey : @"tabr_05_down"},
                            ];
    [childArray enumerateObjectsUsingBlock:^(NSDictionary *dict, NSUInteger idx, BOOL * _Nonnull stop) {
        
        UIViewController *vc = [NSClassFromString(dict[MallClassKey]) new];
        vc.navigationItem.title = ([dict[MallTitleKey] isEqualToString:@"首页"] || [dict[MallTitleKey] isEqualToString:@"分类"]) ? nil : dict[MallTitleKey];
        YJNavigationController *nav = [[YJNavigationController alloc] initWithRootViewController:vc];
        
        UITabBarItem *item = nav.tabBarItem;
        item.image = [UIImage imageNamed:dict[MallImgKey]];
        item.selectedImage = [[UIImage imageNamed:dict[MallSelImgKey]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        item.imageInsets = UIEdgeInsetsMake(6, 0,-6, 0);//（当只有图片的时候）需要自动调整
        [self addChildViewController:nav];
    }];
}

#pragma mark - 点击动画
- (void)tabBarButtonClick:(UIControl *)tabBarButton
{
    for (UIView *imageView in tabBarButton.subviews) {
        if ([imageView isKindOfClass:NSClassFromString(@"UITabBarSwappableImageView")]) {
            //需要实现的帧动画,这里根据自己需求改动
            CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
            animation.keyPath = @"transform.scale";
            animation.values = @[@1.0,@1.1,@0.9,@1.0];
            animation.duration = 0.3;
            animation.calculationMode = kCAAnimationCubic;
            //添加动画
            [imageView.layer addAnimation:animation forKey:nil];
        }
    }
}


#pragma mark - 禁止屏幕旋转
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return (toInterfaceOrientation == UIInterfaceOrientationPortrait);
}

- (BOOL)shouldAutorotate {
    return NO;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;//只支持这一个方向(正常的方向)
}


@end
