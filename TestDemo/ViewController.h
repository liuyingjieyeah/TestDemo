//
//  ViewController.h
//  TestDemo
//
//  Created by 刘英杰 on 2017/9/21.
//  Copyright © 2017年 刘英杰. All rights reserved.
//

#import <UIKit/UIKit.h>

enum Student{
    xiaoming = 0,
    xiaohong,
    xiaoli
}Student;

typedef NS_ENUM(NSInteger, Test) {
    TestOne = 0,
    TestTwo,
    TestThree
};

@interface ViewController : UIViewController

@property (nonatomic, assign) Test testClass;

@end

