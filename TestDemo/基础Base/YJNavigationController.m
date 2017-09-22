//
//  YJNavigationController.m
//  TestDemo
//
//  Created by 刘英杰 on 2017/9/21.
//  Copyright © 2017年 刘英杰. All rights reserved.
//

#import "YJNavigationController.h"
// Controllers

// Models

// Views

// Vendors
#import "GQGesVCTransition.h"
// Categories
#import "UIBarButtonItem+YJBarButtonItem.h"
// Others

@interface YJNavigationController ()<UIGestureRecognizerDelegate>
@end

@implementation YJNavigationController

#pragma mark - load初始化一次
+ (void)load{
    [self setUpBase];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [GQGesVCTransition validateGesBackWithType:GQGesVCTransitionTypePanWithPercentRight withRequestFailToLoopScrollView:YES]; //手势返回
    
}

#pragma mark - <初始化>
+ (void)setUpBase
{
    UINavigationBar *bar = [UINavigationBar appearance];
    bar.barTintColor = BackGroundC;
    [bar setShadowImage:[UIImage new]];
    [bar setTintColor:[UIColor clearColor]];
    
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    // 设置导航栏字体颜色
    UIColor * naiColor = [UIColor blackColor];
    attributes[NSForegroundColorAttributeName] = naiColor;
    attributes[NSFontAttributeName] = PF20Font;
    bar.titleTextAttributes = attributes;
}


#pragma mark - <返回>
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    if (self.childViewControllers.count >= 1) {
        //返回按钮自定义
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"navigationbar_back"] style:UIBarButtonItemStyleDone target:self action:@selector(backClick)];
        //影藏BottomBar
        viewController.hidesBottomBarWhenPushed = YES;
    }
    //跳转
    [super pushViewController:viewController animated:animated];
}

#pragma mark - 点击
- (void)backClick {
    [self popViewControllerAnimated:YES];
}


/**
 如果单单只是想控制所有界面上方的BarStyle可以打开上面的代码打开这行代码并且在那个界面重写上面的代码
 @return UIViewController
 */
- (UIViewController *)childViewControllerForStatusBarStyle{
    return self.topViewController;
}


//支持创酷哦界面朝向
//- (NSUInteger)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window
//{
//    return UIInterfaceOrientationMaskPortrait;
//}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
