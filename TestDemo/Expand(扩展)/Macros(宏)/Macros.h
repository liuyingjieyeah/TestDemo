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

#define PF20Font [UIFont fontWithName:@"PingFang SC" size:20];
#define PF18Font [UIFont fontWithName:@"PingFang SC" size:18];
#define PF16Font [UIFont fontWithName:@"PingFang SC" size:16];
#define PF14Font [UIFont fontWithName:@"PingFang SC" size:14];
#define PF12Font [UIFont fontWithName:@"PingFang SC" size:12];
#define PF13Font [UIFont fontWithName:@"PingFang SC" size:13];
#define PF10Font [UIFont fontWithName:@"PingFang SC" size:10];
#define PF8Font [UIFont fontWithName:@"PingFang SC" size:8];


#define IMP_BLOCK_SELF(type) __weak type *block_self=self;










#endif /* Macros_h */
