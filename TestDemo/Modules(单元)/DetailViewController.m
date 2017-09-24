//
//  DetailViewController.m
//  TestDemo
//
//  Created by 刘英杰 on 2017/9/23.
//  Copyright © 2017年 刘英杰. All rights reserved.
//

#import "DetailViewController.h"
#import "UIImage+YJImage.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = BackGroundC;
    
    UILabel *vcv = [UILabel new];
    vcv.backgroundColor = [UIColor grayColor];
    vcv.frame = CGRectMake(90, 32, 89, 49);
    vcv.text = @"切圆角";
    vcv.textAlignment = NSTextAlignmentCenter;
    vcv.center = self.view.center;
    [self.view addSubview:vcv];
    
    
    UIImage *img = [UIImage imageNamed:@"lena.png"];
    UIImageView *imgView = [[UIImageView alloc]initWithImage:[self CGContextClip:img cornerRadius:512/2]];
    imgView.backgroundColor = BackGroundC;
    imgView.frame = CGRectMake(0, 200, 60, 60);
    [self.view addSubview:imgView];

    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(100, 200, 60, 60)];
    button.backgroundColor = BackGroundC;
    [button setImage:[self CGContextClip:img cornerRadius:512/2] forState:UIControlStateNormal];
    button.layer.masksToBounds = YES;
    [self.view addSubview:button];
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(200, 200, 60, 60)];
    view.layer.contents = (__bridge id _Nullable)([self CGContextClip:img cornerRadius:512/2].CGImage);
    view.backgroundColor = BackGroundC;
    view.clipsToBounds=YES;
    [self.view addSubview:view];
    
    UIImage *img2 = [UIImage yj_circleImage:@"lena.png"];
    UIImageView *imgView2 = [[UIImageView alloc]initWithImage:img2];
    imgView2.backgroundColor = BackGroundC;
    imgView2.frame = CGRectMake(0, 300, 60, 60);
    [self.view addSubview:imgView2];
}

// CGContext 裁剪圆角
- (UIImage *)CGContextClip:(UIImage *)img cornerRadius:(CGFloat)c {
    int w = img.size.width * img.scale;
    int h = img.size.height * img.scale;
    
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(w, h), true, 1.0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    ///首先为了不让其有像素混合的问题,先把背景绘制出来
    CGContextSetFillColorWithColor(context, [BackGroundC CGColor]);//[UIColor whiteColor]
    CGContextFillRect(context, CGRectMake(0, 0, w, h));
    CGContextDrawPath(context, kCGPathFillStroke); //根据坐标绘制路径
    
    CGContextMoveToPoint(context, 0, c);
    CGContextAddArcToPoint(context, 0, 0, c, 0, c);
    CGContextAddLineToPoint(context, w-c, 0);
    CGContextAddArcToPoint(context, w, 0, w, c, c);
    CGContextAddLineToPoint(context, w, h-c);
    CGContextAddArcToPoint(context, w, h, w-c, h, c);
    CGContextAddLineToPoint(context, c, h);
    CGContextAddArcToPoint(context, 0, h, 0, h-c, c);
    CGContextAddLineToPoint(context, 0, c);
    CGContextClosePath(context);
    
    CGContextClip(context);     // 先裁剪 context，再画图，就会在裁剪后的 path 中画
    [img drawInRect:CGRectMake(0, 0, w, h)];       // 画图
    CGContextDrawPath(context, kCGPathFill);
    
    UIImage *ret = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return ret;
}

@end
