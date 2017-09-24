//
//  MessageViewController.m
//  TestDemo
//
//  Created by 刘英杰 on 2017/9/22.
//  Copyright © 2017年 刘英杰. All rights reserved.
//

#import "MessageViewController.h"
//#import "MJRefresh.h"
#import "DetailViewController.h"

@interface MessageViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)UITableView *tableView;

@end

@implementation MessageViewController

#pragma mark - LifeCyle
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if (self.navigationController.navigationBar.barTintColor == BackGroundC)return;
    self.navigationController.navigationBar.barTintColor = BackGroundC;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self creatTableView];
    [self setUpTab];

}

#pragma mark - initialize
- (void)setUpTab{
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = BackGroundC;
//    self.tableView.backgroundColor = self.view.backgroundColor;
}



- (void)creatTableView{
//    CGSize windowsRect = [UIScreen mainScreen].bounds.size;
//    CGRect tableRect = CGRectMake(0, 0, windowsRect.width, windowsRect.height);
    _tableView = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.bounces = YES;
    _tableView.contentInset = UIEdgeInsetsMake(TopHeight, 0, 0, 0);
    _tableView.separatorStyle = UITableViewCellAccessoryNone;
    [self.view addSubview:_tableView];
    
    if (@available(iOS 11.0, *)){
        _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        _tableView.estimatedRowHeight = 0;
        _tableView.estimatedSectionHeaderHeight=0;
        _tableView.estimatedSectionFooterHeight=0;
    }else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
//    self.tableView.mj_header.automaticallyChangeAlpha = YES;
//    self.tableView.mj_header = [MJRefreshHeader headerWithRefreshingBlock:^{
//        [self reFreshData];
//    }];
//    self.tableView.mj_footer = [MJRefreshFooter footerWithRefreshingBlock:^{
//        [self loadMore];
//    }];
}

- (void)reFreshData{
//    [_tableView.mj_header endRefreshing];
}

- (void)loadMore{
//    [_tableView.mj_footer endRefreshing];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"messageCellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
    }
    cell.textLabel.text = @"---";
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:true];
    /*
    NSArray *array = @[@"Test_VC",@"Test_VC1",@"Test_VC2",@"Test_VC3",@"Test_VC4",@"Test_VC5"].mutableCopy;
    Class VC = NSClassFromString(array[indexPath.row]);
    if (VC) {
        UIViewController *aVC = [VC new];
        aVC.title = arrayVC[indexPath.row];
        [self.navigationController pushViewController:aVC animated:YES];
    }*/
    [self.navigationController pushViewController:[DetailViewController new] animated:true];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return [UIView new];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44.0;
}




@end
