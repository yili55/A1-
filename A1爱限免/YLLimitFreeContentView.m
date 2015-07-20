//
//  YLLimitFreeContentView.m
//  A1爱限免
//
//  Created by qianfeng on 15-7-8.
//  Copyright (c) 2015年 yili. All rights reserved.
//

#import "YLLimitFreeContentView.h"
#import "YLAppCellTableViewCell.h"
#import "AFHTTPRequestOperationManager.h"
@interface YLLimitFreeContentView()<UITableViewDataSource,UITableViewDelegate,MJRefreshBaseViewDelegate>
@property(nonatomic,weak)IBOutlet  UITableView *tableView;
@property(nonatomic,weak)MJRefreshFooterView * footRefresh;
@property(nonatomic,weak)MJRefreshHeaderView * headRefresh;
@end
@implementation YLLimitFreeContentView
-(void)setObjs:(NSArray *)objs
{
    _objs=objs;
    [self.tableView reloadData];
}
#pragma mark 数据源代理
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.objs.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YLAppCellTableViewCell *cell=[YLAppCellTableViewCell appWithTableView:tableView androw:indexPath.row];
   // NSLog(@"%lu",indexPath.row);
    cell.app=self.objs[indexPath.row];
    return cell;

}
#pragma mark 上拉下拉刷新数据代理
-(void)refreshViewBeginRefreshing:(MJRefreshBaseView *)refreshView
{
   
    if (refreshView == _headRefresh) {
        _currentPage=1;
        
        
    }else{
        _currentPage++;
    }
    [self loadData];
    [self.tableView reloadData];

}
#pragma mark  加载或刷新数据
-(void)loadData
{
    //1,获得数据，
    //下载附近使用数据
    //NSString *nearbyUrl = @"http://iappfree.candou.com:8080/free/applications/limited?currency=rmb&page=1&category_id=";//[NSString stringWithFormat:NEARBY_APP_URL, longitude, latitude];
    //NSString *nearbyUrl =[NSString stringWithFormat:@"%@page=%lu&category_id=%@",self.urlString,(unsigned long)self.currentPage,self.categoryId];
     NSString *nearbyUrl =[NSString stringWithFormat:self.urlString,(unsigned long)self.currentPage,self.categoryId];
    //NSLog(@"nearbyUrl = %@",nearbyUrl);
    
    
    //网络下载数据
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //此处设置后返回的默认是NSData的数据
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:nearbyUrl parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSError * error;
        //转换为词典数据
        NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        if (error) NSLog(@"error");
        NSArray * dicts = jsonDict[@"applications"];
        NSMutableArray * objs = [NSMutableArray array];
        for (NSDictionary * dic in dicts)
        {
            YLAppModel *app=[YLAppModel appWithDIc:dic];
            [objs addObject:app];
        }
        //把数据给封装好的模型
        
        if (self.currentPage==1) {
            [self.objs removeAllObjects];
        }
        [self.objs addObjectsFromArray:objs];
        
        [self.tableView reloadData];
        [_footRefresh endRefreshing];
        [_headRefresh endRefreshing];
        
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

/**加载下拉和上拉*/
-(void)awakeFromNib
{
    MJRefreshHeaderView *heade=[MJRefreshHeaderView header];
    heade.scrollView=self.tableView;
    heade.delegate=self;
    
    self.headRefresh=heade;
    [self.tableView addSubview:self.headRefresh];
    MJRefreshFooterView *foot=[MJRefreshFooterView footer];
    foot.scrollView=self.tableView;
    foot.delegate=self;
    self.footRefresh=foot;
    // self.footRefresh.frame=CGRectMake(0, 64, 375, 64);
    //NSLog(@"%@",NSStringFromCGRect(self.footRefresh.frame));
    [self.tableView addSubview:self.footRefresh];
}

-(void)willMoveToSuperview:(UIView *)newSuperview
{
 
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   
}
- (void)dealloc
{
    [_headRefresh free];
    [_footRefresh free];
}

@end
