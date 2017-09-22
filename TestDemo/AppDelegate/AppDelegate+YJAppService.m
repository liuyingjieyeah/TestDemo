//
//  AppDelegate+YJAppService.m
//  TestDemo
//
//  Created by 刘英杰 on 2017/9/21.
//  Copyright © 2017年 刘英杰. All rights reserved.
//

#import "AppDelegate+YJAppService.h"
//#import <IQKeyboardManager.h>
//#import "YJRootTabBarController.h"


@implementation AppDelegate (YJAppService)

#pragma mark - 初始化友盟
- (void)initUMeng {
    
    //打开日志
//    [[UMSocialManager defaultManager] openLog:YES];
    //设置友盟appkey
//    [[UMSocialManager defaultManager] setUmSocialAppkey:@"57d2c50f67e58eb9a3002712"];
    //设置微信的appId和appKey
//    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_WechatSession appKey:@"wx061bb5998673cec4" appSecret:@"b7e6daad0d7e59d906e6499e9a0fba2e" redirectURL:@"http://mobile.umeng.com/social"];
}

#pragma mark - 初始化支付
- (void)initBeeCloud {
    
    //支付
//    [BeeCloud initWithAppID:@"28c80b09-baed-4bc0-897f-2fdfcf59fb14" andAppSecret:@"7f9e0a00-3713-47b6-bf00-f6cc0e81ab2d"];
//    [BeeCloud getCurrentMode]; //返回YES代表当前模式，返回NO代表生产模式
//    [BeeCloud initWeChatPay:@"wx061bb5998673cec4"]; //微信支付
}

#pragma mark - 初始化键盘
- (void)initKeyBoard {
    
//    [IQKeyboardManager sharedManager].shouldResignOnTouchOutside = YES;
//    [[IQKeyboardManager sharedManager]setEnableAutoToolbar:NO];
//    [[IQKeyboardManager sharedManager]setKeyboardDistanceFromTextField:60];
}

#pragma mark - 初始化主界面
- (void)initWindow {
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    YJRootTabBarController *tabBarVc = [[YJRootTabBarController alloc]init];
    self.rootTabbarCtr = tabBarVc;
    self.window.rootViewController = tabBarVc;
    [self.window makeKeyAndVisible];
}

#pragma mark - 初始化广告界面
- (void)initAD {
    
//    YKCAdViewController *launchController = [[YKCAdViewController alloc]init];
//    [self.rootTabbarCtr addChildViewController:launchController];
//    launchController.view.frame = self.rootTabbarCtr.view.frame;
//    [self.rootTabbarCtr.view addSubview:launchController.view];
}

#pragma mark - UMeng
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
    
//    BOOL result = [[UMSocialManager defaultManager] handleOpenURL:url];
//    if (!result) {
//        // 其他如支付等SDK的回调
//    }
//    return result;
    return NO;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    
//    if (![BeeCloud handleOpenUrl:url]) {
//        //handle其他类型的url
//        BOOL result = [[UMSocialManager defaultManager] handleOpenURL:url];
//        if (!result) {
//
//        }
//        return result;
//    }
    return YES;
}

//3DTouch点击后操作
- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler{
    
    if ([shortcutItem.type isEqualToString:@"store"])
    {
        [self.rootTabbarCtr setSelectedIndex:2];
        
    }else if ([shortcutItem.type isEqualToString:@"myOrder"])
    {
        [self.rootTabbarCtr setSelectedIndex:4];
        
    }else if ([shortcutItem.type isEqualToString:@"phoneConsult"])
    {
        [self.rootTabbarCtr setSelectedIndex:3];
        
    }else if ([shortcutItem.type isEqualToString:@"commonFault"])
    {
        [self.rootTabbarCtr setSelectedIndex:1];
    }
}

- (void)init3DTouch{
    //3DTouch
    if ([[[UIDevice currentDevice] systemVersion] intValue] > 9.0) {
        [self init3DTouchActionShow:YES]; //打开
    }
}


/**
 type 该item 唯一标识符
 localizedTitle ：标题
 localizedSubtitle：副标题
 icon：icon图标 可以使用系统类型 也可以使用自定义的图片
 userInfo：用户信息字典 自定义参数，完成具体功能需求
 */
-(void)init3DTouchActionShow:(BOOL)isShow
{
    UIApplication *application = [UIApplication sharedApplication];
    
    UIApplicationShortcutIcon *icon1 = [UIApplicationShortcutIcon iconWithTemplateImageName:@"shopping"];
    UIApplicationShortcutItem *item1 = [[UIApplicationShortcutItem alloc]initWithType:@"store" localizedTitle:@"商城" localizedSubtitle:nil icon:icon1 userInfo:nil];
    
    UIApplicationShortcutIcon *icon2 = [UIApplicationShortcutIcon iconWithTemplateImageName:@"my"];
    UIApplicationShortcutItem *item2 = [[UIApplicationShortcutItem alloc]initWithType:@"myOrder" localizedTitle:@"我的订单" localizedSubtitle:nil icon:icon2 userInfo:nil];
    
    UIApplicationShortcutIcon *icon3 = [UIApplicationShortcutIcon iconWithTemplateImageName:@"consulting"];
    UIApplicationShortcutItem *item3 = [[UIApplicationShortcutItem alloc]initWithType:@"phoneConsult" localizedTitle:@"手机咨询" localizedSubtitle:nil icon:icon3 userInfo:nil];
    
    UIApplicationShortcutIcon *icon4 = [UIApplicationShortcutIcon iconWithTemplateImageName:@"fault"];
    UIApplicationShortcutItem *item4 = [[UIApplicationShortcutItem alloc]initWithType:@"commonFault" localizedTitle:@"常见故障" localizedSubtitle:nil icon:icon4 userInfo:nil];
    if (isShow)
    {
        application.shortcutItems = @[item1,item2,item3,item4];
    }else
    {
        application.shortcutItems = @[];
    }
}



@end
