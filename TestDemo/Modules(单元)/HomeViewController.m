//
//  HomeViewController.m
//  TestDemo
//
//  Created by 刘英杰 on 2017/9/22.
//  Copyright © 2017年 刘英杰. All rights reserved.
//

// Controllers
#import "HomeViewController.h"
#import "MessageViewController.h"
#import "LeftMenuViewController.h"
// Models

// Views
#import "YJNavSearchBarView.h"
// Vendors
#import "MJRefresh.h"
#import "UIViewController+CWLateralSlide.h"

// Categories
#import "UIBarButtonItem+YJBarButtonItem.h"
// Others


@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource>

/* collectionView */
@property (nonatomic, strong)UITableView *tableView;

/* 滚回顶部按钮 */
@property (strong , nonatomic)UIButton *backTopButton;

@end

@implementation HomeViewController

#pragma mark - LifeCyle
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if (self.navigationController.navigationBar.barTintColor == RGBA(231, 23, 37, 1.0))return;
    self.navigationController.navigationBar.barTintColor = RGBA(231, 23, 37, 1.0);
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setUpBase];
    [self setUpNav];
    [self setUpGoodsData];
    [self setUpScrollToTopView];
    
    // 注册手势驱动
    __weak typeof(self)weakSelf = self;
    [self cw_registerShowIntractiveWithEdgeGesture:YES direction:CWDrawerTransitionDirectionLeft transitionBlock:^{
        [weakSelf drawerMaskAnimationLeft];
    }];
}

#pragma mark - initialize
- (void)setUpBase{
    self.view.backgroundColor = BackGroundC;
    self.tableView.backgroundColor = self.view.backgroundColor;
//    self.automaticallyAdjustsScrollViewInsets = NO;
}

#pragma mark - 导航栏处理
- (void)setUpNav{
    //二维码-richScanItemClick
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem ItemWithImage:[UIImage imageNamed:@"richScan"] WithHighlighted:[UIImage imageNamed:@"richScan"] Target:self action:@selector(drawerMaskAnimationLeft)];//drawerMaskAnimationLeft
    //消息
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem ItemWithImage:[UIImage imageNamed:@"message"] WithHighlighted:[UIImage imageNamed:@"message"] Target:self action:@selector(messageItemClick)];
    
    //中间搜索及语音
    YJNavSearchBarView *searchBarVc = [[YJNavSearchBarView alloc] init];
    searchBarVc.placeholdLabel.text = @"618 100元红包等你来抢";
    searchBarVc.frame = CGRectMake(60, 25, ScreenW - 120, 35);
    searchBarVc.voiceButtonClickBlock = ^{
        NSLog(@"语音点击回调");
    };
    searchBarVc.searchViewBlock = ^{
        NSLog(@"搜索");
    };
    self.navigationItem.titleView = searchBarVc;
}

#pragma mark - 加载数据
- (void)setUpGoodsData{
//    _gridItem = [DCGridItem mj_objectArrayWithFilename:@"GoodsGrid.plist"];
//    _youLikeItem = [DCRecommendItem mj_objectArrayWithFilename:@"HomeHighGoods.plist"];
}

#pragma mark - 滚回顶部
- (void)setUpScrollToTopView{
    _backTopButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:_backTopButton];
    [_backTopButton addTarget:self action:@selector(ScrollToTop) forControlEvents:UIControlEventTouchUpInside];
    [_backTopButton setImage:[UIImage imageNamed:@"btn_UpToTop"] forState:UIControlStateNormal];
    _backTopButton.hidden = YES;
    _backTopButton.frame = CGRectMake(ScreenW - 50, ScreenH - (60+TabBarHeight), 40, 40);
}

#pragma mark - <UIScrollViewDelegate>
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    //判断回到顶部按钮是否隐藏
    _backTopButton.hidden = (scrollView.contentOffset.y > ScreenH) ? NO : YES;
}

#pragma mark - collectionView滚回顶部
- (void)ScrollToTop{
    [self.tableView scrollRectToVisible:CGRectMake(0, 0, 1, 1) animated:YES];
}

/****************************TableView********************************/

#pragma mark - LazyLoad
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.bounces = YES;
        _tableView.separatorStyle = UITableViewCellAccessoryNone;
//        _tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
        _tableView.contentInset = UIEdgeInsetsMake(TopHeight, 0, TabBarHeight, 0);
        _tableView.scrollIndicatorInsets = _tableView.contentInset;
        [self.view addSubview:_tableView];
        
        if (@available(iOS 11.0, *)){
            _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
            _tableView.estimatedRowHeight = 0;
            _tableView.estimatedSectionHeaderHeight=0;
            _tableView.estimatedSectionFooterHeight=0;
        }else {
            self.automaticallyAdjustsScrollViewInsets = NO;
        }
        
        //添加刷新
        self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self reFreshData];
        }];
        //自动更改透明度
        self.tableView.mj_header.automaticallyChangeAlpha = YES;
        self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
            [self loadMore];
        }];
    }
    return _tableView;
}

- (void)reFreshData{
    [_tableView.mj_header endRefreshing];
}

- (void)loadMore{
    [_tableView.mj_footer endRefreshing];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 80;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"homeCellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:true];
    
    [self.navigationController pushViewController:[[MessageViewController alloc]init] animated:true];
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


/** 左滑抽屉菜单
 *  CWDrawerAnimationTypeDefault/CWDrawerAnimationTypeMask
 */
- (void)drawerMaskAnimationLeft{
    LeftMenuViewController *vc = [[LeftMenuViewController alloc] init];
    CWLateralSlideConfiguration *conf1 = [CWLateralSlideConfiguration configurationWithDistance:0 maskAlpha:0.4 scaleY:0.8 direction:CWDrawerTransitionDirectionLeft backImage:[UIImage imageNamed:@"lena"]];
//    [self cw_presentViewController:vc configuration:nil];//新版默认nil
    [self cw_showDrawerViewController:vc animationType:CWDrawerAnimationTypeMask configuration:conf1];
    
}



#pragma mark - 二维码扫码
- (void)richScanItemClick{
//    LBXScanViewStyle *style = [[LBXScanViewStyle alloc]init];
//    style.centerUpOffset = 44;
//    style.photoframeAngleStyle = LBXScanViewPhotoframeAngleStyle_Outer;
//    style.photoframeLineW = 6;
//    style.photoframeAngleW = 24;
//    style.photoframeAngleH = 24;
//    style.anmiationStyle = LBXScanViewAnimationStyle_LineMove;
//    style.animationImage = [UIImage imageNamed:@"CodeScan.bundle/qrcode_scan_light_green"];
//    SubLBXScanViewController *vc = [[SubLBXScanViewController alloc]init];
//    vc.title = @"扫一扫";
//    vc.style = style;
//    vc.isQQSimulator = YES;
//
//    DCNavigationController *nav = [[DCNavigationController alloc]initWithRootViewController:vc];
//    [self presentViewController:nav animated:YES completion:nil];
//
//    vc.scanResult = ^(NSString *strScanned){
//        NSLog(@"扫码结果");
//    };
}

#pragma mark - 消息
- (void)messageItemClick{
    MessageViewController *messageVc = [[MessageViewController alloc] init];
    messageVc.title = @"消息中心";
    [self.navigationController pushViewController:messageVc animated:YES];
}



#pragma 设置StatusBar为白色
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

@end
