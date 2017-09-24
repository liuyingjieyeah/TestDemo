//
//  ViewController.m
//  TestDemo
//
//  Created by 刘英杰 on 2017/9/21.
//  Copyright © 2017年 刘英杰. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController+CWLateralSlide.h"
#import "LeftMenuViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    //ENUM
    self.testClass = TestTwo;
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 50)];
    btn.center = self.view.center;
    [btn addTarget:self action:@selector(drawerMaskAnimationLeft) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:@"Click" forState:UIControlStateNormal];
    [self.view addSubview:btn];
    
    // 注册手势驱动
//    __weak typeof(self)weakSelf = self;
//    [self cw_registerShowIntractiveWithEdgeGesture:NO direction:CWDrawerTransitionDirectionLeft transitionBlock:^{
//        [weakSelf drawerMaskAnimationLeft];
//    }];
}


/** 左滑抽屉菜单
 *  CWDrawerAnimationTypeDefault/CWDrawerAnimationTypeMask
 */
- (void)drawerMaskAnimationLeft{
//    LeftMenuViewController *vc = [[LeftMenuViewController alloc] init];
//    CWLateralSlideConfiguration *conf1 = [CWLateralSlideConfiguration configurationWithDistance:0 maskAlpha:0.4 scaleY:0.8 direction:CWDrawerTransitionDirectionRight backImage:[UIImage imageNamed:@"lena"]];

//    [self cw_presentViewController:vc configuration:conf1];//默认使用nil
}


@end
