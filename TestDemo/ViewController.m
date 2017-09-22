//
//  ViewController.m
//  TestDemo
//
//  Created by 刘英杰 on 2017/9/21.
//  Copyright © 2017年 刘英杰. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //ENUM
    self.testClass = TestTwo;
    
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 50)];
    btn.center = self.view.center;
    [btn setTitle:@"Click" forState:UIControlStateNormal];
    [self.view addSubview:btn];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
