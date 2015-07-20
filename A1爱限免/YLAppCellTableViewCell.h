//
//  YLAppCellTableViewCell.h
//  A1爱限免
//
//  Created by qianfeng on 15-7-8.
//  Copyright (c) 2015年 yili. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YLAppModel.h"

@interface YLAppCellTableViewCell : UITableViewCell


//获取数据模型
@property(nonatomic,strong)YLAppModel *app;
//显示所在行数
@property (nonatomic,assign) NSInteger  row;
+(id)appWithTableView:(UITableView *)tableView androw:(NSInteger )row;
-(id)initWithTableView:(UITableView *)tableView androw:(NSInteger )row;
@end
