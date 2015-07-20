//
//  YLLimitFreeContentView.h
//  A1爱限免
//
//  Created by qianfeng on 15-7-8.
//  Copyright (c) 2015年 yili. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MJRefresh.h"


@interface YLLimitFreeContentView : UIView


//url地址
@property(nonatomic,copy)NSString *urlString;
//分类编号
@property(nonatomic,copy)NSString * categoryId;
//当前页
@property(nonatomic,assign)NSUInteger  currentPage;
//数据源
@property(nonatomic,strong)NSMutableArray *objs;
@end
