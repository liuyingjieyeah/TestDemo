//
//  YJBaseViewController.h
//  TestDemo
//
//  Created by 刘英杰 on 2017/9/21.
//  Copyright © 2017年 刘英杰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YJBaseViewController : UIViewController

@property (nonatomic) BOOL invalidGesture;

+ (instancetype)shareInstance;

@end
