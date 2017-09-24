//
//  UIView+YJExtension.h
//  TestDemo
//
//  Created by 刘英杰 on 2017/9/23.
//  Copyright © 2017年 刘英杰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (YJExtension)

@property (nonatomic , assign) CGFloat view_width;
@property (nonatomic , assign) CGFloat view_height;
@property (nonatomic , assign) CGSize  view_size;
@property (nonatomic , assign) CGFloat view_x;
@property (nonatomic , assign) CGFloat view_y;
@property (nonatomic , assign) CGPoint view_origin;
@property (nonatomic , assign) CGFloat view_centerX;
@property (nonatomic , assign) CGFloat view_centerY;
@property (nonatomic , assign) CGFloat view_rightMaxX;
@property (nonatomic , assign) CGFloat view_bottomMaxY;

@end
