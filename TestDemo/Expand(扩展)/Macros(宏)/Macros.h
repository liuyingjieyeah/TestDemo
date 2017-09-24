//
//  Macros.h
//  TestDemo
//
//  Created by 刘英杰 on 2017/9/22.
//  Copyright © 2017年 刘英杰. All rights reserved.
//

#ifndef Macros_h
#define Macros_h


/** 屏幕高度 */
#define ScreenH [UIScreen mainScreen].bounds.size.height
/** 屏幕宽度 */
#define ScreenW [UIScreen mainScreen].bounds.size.width

/******************    TabBar          *************/
#define MallClassKey   @"rootVCClassString"
#define MallTitleKey   @"title"
#define MallImgKey     @"imageName"
#define MallSelImgKey  @"selectedImageName"
/*****************  屏幕适配  ******************/
#define iphone6p (ScreenH == 763)
#define iphone6 (ScreenH == 667)
#define iphone5 (ScreenH == 568)
#define iphone4 (ScreenH == 480)


#define StatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height//44px or 20px
#define NavBarHeight 44.0
#define TabBarHeight (Device_Is_iPhoneX? 83 : 49) //83px or 49px
#define TopHeight (StatusBarHeight + NavBarHeight)

#define Device_Is_iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)





/** 商品详情数据高度 */
#define ShopDetailScreenH (ScreenH - 55- 64 - 35 - 30)

//全局背景色
#define BackGroundC RGB(245,245,245)
/** 没有导航栏的屏幕高度 */
#define ScreenHNoNavi ([UIScreen mainScreen].bounds.size.height - 64 - 49)
/** 导航栏颜色 */
#define YKCNaviColor RGB(255,255,255)
/** 普通级标签文字，标签栏等颜色 */
#define YKCNormalColor RGB(51,51,51);
/** 辅助性文字颜色(如 tabbar) */
#define YKCAssistColor [UIColor darkGrayColor]
/** 程序主色调(如 tabbar选中颜色) */
#define YKCMainColor RGB(237,0,0)
/** 分割线颜色 */
#define YKCLineColor RGB(204,204,204)

//色值
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r,g,b) RGBA(r,g,b,1.0f)


//字体
#define PFR [[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0 ? @"PingFangSC-Regular" : @"PingFang SC"
#define PFR20Font [UIFont fontWithName:PFR size:20];
#define PFR18Font [UIFont fontWithName:PFR size:18];
#define PFR16Font [UIFont fontWithName:PFR size:16];
#define PFR15Font [UIFont fontWithName:PFR size:15];
#define PFR14Font [UIFont fontWithName:PFR size:14];
#define PFR13Font [UIFont fontWithName:PFR size:13];
#define PFR12Font [UIFont fontWithName:PFR size:12];
#define PFR11Font [UIFont fontWithName:PFR size:11];
#define PFR10Font [UIFont fontWithName:PFR size:10];


#define IMP_BLOCK_SELF(type) __weak type *block_self=self;





#endif /* Macros_h */
