//
//  MessageViewController.m
//  TestDemo
//
//  Created by 刘英杰 on 2017/9/22.
//  Copyright © 2017年 刘英杰. All rights reserved.
//

#import "MessageViewController.h"
#import "MJRefresh.h"
#import "DetailViewController.h"
#import "CYLTableViewPlaceHolder.h"

#import "WeChatStylePlaceHolder.h"
#import "XTNetReloader.h"

static const CGFloat CYLDuration = 1.0;
#define CYLRandomData [NSString stringWithFormat:@"随机数据---%d", arc4random_uniform(1000000)]

@interface MessageViewController ()<CYLTableViewPlaceHolderDelegate,WeChatStylePlaceHolderDelegate,UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *dataSource;
@property (nonatomic, assign, getter=isNoResult) BOOL noResult;

@end

@implementation MessageViewController

#pragma mark - LifeCyle
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if (self.navigationController.navigationBar.barTintColor == BackGroundC)return;
    self.navigationController.navigationBar.barTintColor = BackGroundC;

    [self.tableView cyl_reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpTab];
}

#pragma mark - initialize
- (void)setUpTab{
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = BackGroundC;
    self.tableView.backgroundColor = self.view.backgroundColor;
}


/**
 *  lazy load dataSource
 *
 *  @return NSMutableArray
 */
- (NSMutableArray *)dataSource {
    if (_dataSource == nil) {
        _dataSource = [[NSMutableArray alloc] init];
    }
    return _dataSource;
}

- (BOOL)isNoResult {
    _noResult = (self.dataSource.count == 0);
    return _noResult;
}



-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.bounces = YES;
        _tableView.contentInset = UIEdgeInsetsMake(TopHeight, 0, 0, 0);
        _tableView.separatorStyle = UITableViewCellAccessoryNone;
        [self.view addSubview:_tableView];
        
        _tableView.estimatedRowHeight = 0;
        _tableView.estimatedSectionHeaderHeight=0;
        _tableView.estimatedSectionFooterHeight=0;
        
        if (@available(iOS 11.0, *)){
            _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
            
        }else {
            self.automaticallyAdjustsScrollViewInsets = NO;
        }
        
        _tableView.mj_header.automaticallyChangeAlpha = YES;
        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self reFreshData];
        }];
        _tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
            [self loadMore];
        }];
        // 马上进入刷新状态
        [self.tableView.mj_header beginRefreshing];
    }
    return _tableView;

}

- (void)reFreshData{
    if (!self.isNoResult) {
        self.dataSource = nil;
    } else {
        // 1.添加假数据
        for (int i = 0; i<5; i++) {
            [self.dataSource insertObject:CYLRandomData atIndex:0];
        }
    }
    // 2.模拟1秒后刷新表格UI（真实开发中，可以移除这段gcd代码）
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(CYLDuration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 刷新表格
        [self.tableView cyl_reloadData];
        // 拿到当前的下拉刷新控件，结束刷新状态
        [self.tableView.mj_header endRefreshing];
    });
}

- (void)loadMore{
    [_tableView.mj_footer endRefreshing];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"messageCellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%@ - %@", @"Random Data", self.dataSource[indexPath.row]];
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


#pragma mark - CYLTableViewPlaceHolderDelegate Method

- (UIView *)makePlaceHolderView {
    UIView *taobaoStyle = [self taoBaoStylePlaceHolder];
    UIView *weChatStyle = [self weChatStylePlaceHolder];
    return (arc4random_uniform(2)==0)?taobaoStyle:weChatStyle;
}

- (UIView *)taoBaoStylePlaceHolder {
    __block XTNetReloader *netReloader = [[XTNetReloader alloc]initWithFrame:CGRectMake(0, 0, 0, 0) reloadBlock:^{
        [self.tableView.mj_header beginRefreshing];
    }];
    return netReloader;
}

- (UIView *)weChatStylePlaceHolder {
    WeChatStylePlaceHolder *weChatStylePlaceHolder = [[WeChatStylePlaceHolder alloc] initWithFrame:self.tableView.frame];
    weChatStylePlaceHolder.delegate = self;
    return weChatStylePlaceHolder;
}

#pragma mark - WeChatStylePlaceHolderDelegate Method

- (void)emptyOverlayClicked:(id)sender {
    [self.tableView.mj_header beginRefreshing];
}

@end
