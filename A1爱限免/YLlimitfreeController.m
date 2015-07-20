//
//  YLlimitfreeController.m
//  A1爱限免
//
//  Created by qianfeng on 15-7-8.
//  Copyright (c) 2015年 yili. All rights reserved.
//

#import "YLlimitfreeController.h"
#import "YLLimitFreeContentView.h"
#import "AFHTTPRequestOperationManager.h"
#import "YLAppModel.h"
#import "YLAppCellTableViewCell.h"
#import "YLAppDetailController.h"
#import "YLSettingController.h"
@interface YLlimitfreeController ()
@property(nonatomic,weak)IBOutlet YLLimitFreeContentView *contentView;
@property(nonatomic,strong)NSMutableArray *dataArray;
@end

@implementation YLlimitfreeController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.dataArray=[NSMutableArray array];
  //  self.contentView.=NO;
    self.automaticallyAdjustsScrollViewInsets=NO;
    //self.urlString=@"http://iappfree.candou.com:8080/free/applications/limited?currency=rmb&";
    self.currentPage=1;
    self.categoryId=@"";
    self.contentView.currentPage=1;
    self.contentView.categoryId=@"";
    self.contentView.urlString=self.urlString;
   // self.title=self.myTitleName;
    [self sendRequest];
    
}

-(void)setUrlString:(NSString *)urlString
{
    _urlString=urlString;
}
-(void)setMyTitleName:(NSString *)myTitleName
{
    _myTitleName=myTitleName;
    self.title=myTitleName;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)sendRequest
{
    //1,获得数据，
    //下载附近使用数据
    //NSString *nearbyUrl = @"http://iappfree.candou.com:8080/free/applications/limited?currency=rmb&page=1&category_id=";//[NSString stringWithFormat:NEARBY_APP_URL, longitude, latitude];
    //NSString *nearbyUrl =[NSString stringWithFormat:@"%@page=%lu&category_id=%@",self.urlString,(unsigned long)self.currentPage,self.categoryId];
    NSString *nearbyUrl =[NSString stringWithFormat:self.urlString,(unsigned long)self.currentPage,self.categoryId];    NSLog(@"nearbyUrl = %@",nearbyUrl);
    
    
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
            [self.dataArray removeAllObjects];
        }
        [self.dataArray addObjectsFromArray:objs];
        
        self.contentView.objs=self.dataArray;
       
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

#pragma mark - Navigation

 //In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    //NSLog(@"%@",sender);
    if ([[segue destinationViewController] isKindOfClass:[YLSettingController class]]) {
      //  NSLog(@"%@",NSStringFromClass([YLSettingController class]));
        
    }else if ([[segue destinationViewController] isKindOfClass:[YLAppDetailController class]])
    {
        YLAppCellTableViewCell *cell=(YLAppCellTableViewCell *)sender;
        //NSLog(@"%@",cell.app.applicationId);
        YLAppDetailController *appDetailC=(YLAppDetailController *)[segue destinationViewController];
        appDetailC.applicationId=cell.app.applicationId;
    }
   
}


@end
