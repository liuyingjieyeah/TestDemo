//
//  YJConsts.h
//  TestDemo
//
//  Created by 刘英杰 on 2017/9/22.
//  Copyright © 2017年 刘英杰. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface YJConsts : NSObject

/** 常量数 */
UIKIT_EXTERN CGFloat const Margin;


/** 重要标题或操作按钮字体大小(如导航栏标题，主页标题) */
UIKIT_EXTERN NSInteger const YKCNaviFont;
/** 用于大多数(如首页信息，个人资料) */
UIKIT_EXTERN NSInteger const YKCInfoFont;
/** 用于大多数(如购买信息，对话信息) */
UIKIT_EXTERN NSInteger const YKCBuyAndDialogueFont;
/** 用于大多数(如购买辅助描述信息) */
UIKIT_EXTERN NSInteger const YKCDescribeFont;
/** 用于辅助性文字(如次要购买信息描述) */
UIKIT_EXTERN NSInteger const YKCMinorBuyFont;
/** 用于辅助性文字(如标签栏文字) */
UIKIT_EXTERN CGFloat const YKCTabBarFont;
/** 所有控件左边开始位置以及彼此之间距离 */
UIKIT_EXTERN CGFloat const YKCLeftMargin;


@end
