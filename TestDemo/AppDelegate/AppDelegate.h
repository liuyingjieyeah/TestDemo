//
//  AppDelegate.h
//  TestDemo
//
//  Created by 刘英杰 on 2017/9/21.
//  Copyright © 2017年 刘英杰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "YJRootTabBarController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


//+ (void)IMLogin : (void(^)(YWConversationViewController *conversationVc))loginSuccess;
//+ (void)IMLogin;
//+ (void)IMLoginOut;
//+ (BOOL)isCurrentViewControllerVisible:(UIViewController *)viewController;

@property(nonatomic, strong) YJRootTabBarController *rootTabbarCtr;

@end

