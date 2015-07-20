//
//  YLlimitfreeController.h
//  A1爱限免
//
//  Created by qianfeng on 15-7-8.
//  Copyright (c) 2015年 yili. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YLlimitfreeController : UIViewController
//url地址
@property(nonatomic,copy)NSString *urlString;
//分类编号
@property(nonatomic,copy)NSString * categoryId;
//当前页
@property(nonatomic,assign)NSUInteger  currentPage;

@property(nonatomic,copy)NSString * myTitleName;

@end
