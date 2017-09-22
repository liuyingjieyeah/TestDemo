//
//  AppDelegate+YJAppService.h
//  TestDemo
//
//  Created by 刘英杰 on 2017/9/21.
//  Copyright © 2017年 刘英杰. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate (YJAppService)

/** 初始化 UMeng*/
-(void)initUMeng;
/** 初始化支付*/
-(void)initBeeCloud;
/** 初始化键盘*/
- (void)initKeyBoard;
/** 初始化界面*/
- (void)initWindow;
/** 初始化广告界面*/
- (void)initAD;
/** 初始化3DTouch功能*/
- (void)init3DTouch;

@end
