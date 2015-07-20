//
//  ViewController.m
//  A1爱限免
//
//  Created by qianfeng on 15-7-8.
//  Copyright (c) 2015年 yili. All rights reserved.
//

#import "ViewController.h"
#import "AFHTTPRequestOperationManager.h"
#import "YLAppModel.h"
@interface ViewController ()
@property(nonatomic,strong)NSArray * apps;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   // self.apps;
   // NSLog(@"%@",self.apps);
       //2,封装模型
    //3,封装view，并且显示数据
    
}
-(NSArray *)apps
{
    if (_apps == nil) {
       
        //1,获得数据，
        //下载附近使用数据
        NSString *nearbyUrl = @"http://iappfree.candou.com:8080/free/applications/limited?currency=rmb&page=1&category_id=";//[NSString stringWithFormat:NEARBY_APP_URL, longitude, latitude];
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
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"Error: %@", error);
        }];
    }
    return _apps;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
