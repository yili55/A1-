//
//  YLAppDetailView.h
//  A1爱限免
//
//  Created by qianfeng on 15-7-10.
//  Copyright (c) 2015年 yili. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YLAppDetailModel.h"
@interface YLAppDetailView : UIView
@property(nonatomic,strong)YLAppDetailModel *appDetailModel;
@property(nonatomic,strong)NSMutableArray *nearByApps;
@property(nonatomic,retain)UINavigationController *nvc;
@end
