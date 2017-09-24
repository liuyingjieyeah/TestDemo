//
//  UIView+YJExtension.m
//  TestDemo
//
//  Created by 刘英杰 on 2017/9/23.
//  Copyright © 2017年 刘英杰. All rights reserved.
//

#import "UIView+YJExtension.h"

@implementation UIView (YJExtension)

- (CGFloat)view_x{
    return self.frame.origin.x;
}
-(void)setView_x:(CGFloat)view_x{
    CGRect dcFrame = self.frame;
    dcFrame.origin.x = view_x;
    self.frame = dcFrame;
}

-(CGFloat)view_y{
    return self.frame.origin.y;
}
-(void)setView_y:(CGFloat)view_y{
    CGRect dcFrame = self.frame;
    dcFrame.origin.y = view_y;
    self.frame = dcFrame;
}

-(CGPoint)view_origin{
    return self.frame.origin;
}
-(void)setView_origin:(CGPoint)view_origin{
    CGRect dcFrame = self.frame;
    dcFrame.origin = view_origin;
    self.frame = dcFrame;
}

-(CGFloat)view_width{
    return self.frame.size.width;
}
-(void)setView_width:(CGFloat)view_Width{
    CGRect dcFrame = self.frame;
    dcFrame.size.width = view_Width;
    self.frame = dcFrame;
}

-(CGFloat)view_height{
    return self.frame.size.height;
}
-(void)setView_height:(CGFloat)view_Height{
    CGRect dcFrame = self.frame;
    dcFrame.size.height = view_Height;
    self.frame = dcFrame;
}

-(CGSize)view_size{
    return self.frame.size;
}
- (void)setView_size:(CGSize)view_size{
    CGRect dcFrame = self.frame;
    dcFrame.size = view_size;
    self.frame = dcFrame;
}

-(CGFloat)view_centerX{
    return self.center.x;
}
-(void)setView_centerX:(CGFloat)view_centerX{
    CGPoint dcFrmae = self.center;
    dcFrmae.x = view_centerX;
    self.center = dcFrmae;
}

-(CGFloat)view_centerY{
    return self.center.y;
}
-(void)setView_centerY:(CGFloat)view_centerY{
    CGPoint dcFrame = self.center;
    dcFrame.y = view_centerY;
    self.center = dcFrame;
}

- (CGFloat)view_rightMaxX{
    return CGRectGetMaxX(self.frame);
}
- (CGFloat)view_bottomMaxY{
    return CGRectGetMaxY(self.frame);
}

- (void)setView_rightMaxX:(CGFloat)view_rightMaxX{
    self.view_x = view_rightMaxX - self.view_width;
}
- (void)setView_bottomMaxY:(CGFloat)view_bottomMaxY{
    self.view_y = view_bottomMaxY - self.view_height;
}



/*
- (BOOL)intersectWithView:(UIView *)view{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    CGRect selfRect = [self convertRect:self.bounds toView:window];
    CGRect viewRect = [view convertRect:view.bounds toView:window];
    return CGRectIntersectsRect(selfRect, viewRect);
}

- (BOOL)isShowingOnKeyWindow {
    // 主窗口
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    
    // 以主窗口左上角为坐标原点, 计算self的矩形框
    CGRect newFrame = [keyWindow convertRect:self.frame fromView:self.superview];
    CGRect winBounds = keyWindow.bounds;
    
    // 主窗口的bounds 和 self的矩形框 是否有重叠
    BOOL intersects = CGRectIntersectsRect(newFrame, winBounds);
    
    return !self.isHidden && self.alpha > 0.01 && self.window == keyWindow && intersects;
}

+(instancetype)dc_viewFromXib{
    return [[NSBundle mainBundle]loadNibNamed:NSStringFromClass(self) owner:nil options:nil].firstObject;
}

*/










@end
