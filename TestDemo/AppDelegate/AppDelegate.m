//
//  AppDelegate.m
//  TestDemo
//
//  Created by 刘英杰 on 2017/9/21.
//  Copyright © 2017年 刘英杰. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+YJAppService.h"

@interface AppDelegate ()//<JPUSHRegisterDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    // 获取通讯录权限
    //[PPGetAddressBook requestAddressBookAuthorization];
    //打开日志
    //[[UMSocialManager defaultManager] openLog:YES];
    //设置友盟appkey
    [self initUMeng];
    //支付
    [self initBeeCloud];
    // 初始化键盘
    [self initKeyBoard];
    // 初始化窗口
    [self initWindow];
    //初始化聊天
    //[[SPKitExample sharedInstance] callThisInDidFinishLaunching];
    
    //注册？？？？？？？？？
    if ([[UIApplication sharedApplication] respondsToSelector:@selector(registerUserNotificationSettings:)]) {
        
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:(UIUserNotificationTypeBadge|UIUserNotificationTypeAlert|UIUserNotificationTypeSound) categories:nil];
        [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
    }
    
    // 极光推送
    
    
    //通知全局注册成功
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(networkDidLogin:) name:kJPFNetworkDidLoginNotification object:nil];
    
    //3DTouch
    [self init3DTouch];
    
//    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
//    YKCTabBarController *tabBarVc = [[YKCTabBarController alloc]init];
//    self.rootTabbarCtr = tabBarVc;
//    self.window.rootViewController = tabBarVc;
//    [self.window makeKeyAndVisible];
    [self initWindow];
    [self initAD];
    
    
//    [YKCTopWindow show];
    


    
    return YES;
}

//判断是否可以跳转到IM聊天页面
+ (BOOL)isCurrentViewControllerVisible:(UIViewController *)viewController {
    return (viewController.isViewLoaded && viewController.view.window);
}

- (void)networkDidLogin:(NSNotification *)notification {
    //登录成功
}






- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}


#pragma mark - Core Data stack

@synthesize persistentContainer = _persistentContainer;

- (NSPersistentContainer *)persistentContainer {
    // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"TestDemo"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    // Replace this implementation with code to handle the error appropriately.
                    // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    
                    /*
                     Typical reasons for an error here include:
                     * The parent directory does not exist, cannot be created, or disallows writing.
                     * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                     * The device is out of space.
                     * The store could not be migrated to the current model version.
                     Check the error message to determine what the actual problem was.
                    */
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    
    return _persistentContainer;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}

@end
