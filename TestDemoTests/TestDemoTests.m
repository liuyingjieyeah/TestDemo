//
//  TestDemoTests.m
//  TestDemoTests
//
//  Created by 刘英杰 on 2017/9/21.
//  Copyright © 2017年 刘英杰. All rights reserved.
//

#import "TestUnit.h"
#import <XCTest/XCTest.h>

@interface TestDemoTests : XCTestCase

@end

//点击这个菱形运行所有测试
@implementation TestDemoTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

//添加新方法，并单独执行该测试方法
- (void)testAdd{
    XCTAssert([TestUnit addWithNum1:3 num2:4] == 7,@"加法算法错误");
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
