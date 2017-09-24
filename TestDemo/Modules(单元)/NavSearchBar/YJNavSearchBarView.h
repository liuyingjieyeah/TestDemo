//
//  YJNavSearchBarView.h
//  TestDemo
//
//  Created by 刘英杰 on 2017/9/23.
//  Copyright © 2017年 刘英杰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YJNavSearchBarView : UIView

/* 语音按钮 */
@property (strong , nonatomic)UIButton *voiceImageBtn;
/* 占位文字 */
@property (strong , nonatomic)UILabel *placeholdLabel;

/** 语音点击回调Block */
@property (nonatomic, copy) dispatch_block_t voiceButtonClickBlock;
/** 搜索 */
@property (nonatomic, copy) dispatch_block_t searchViewBlock;


@end
