//
//  YLAppDetailController.m
//  A1爱限免
//
//  Created by qianfeng on 15-7-10.
//  Copyright (c) 2015年 yili. All rights reserved.
//

#import "YLAppDetailController.h"
#import "YLAppDetailView.h"
#import "YLAppDetailModel.h"
#import "AFHTTPRequestOperationManager.h"
#import "YLAppPhotoShowController.h"
@interface YLAppDetailController ()
@property (strong, nonatomic) IBOutlet YLAppDetailView *appDetailVIew;
@property(nonatomic,strong)YLAppDetailModel * appDetail;
@property(nonatomic,strong)NSMutableArray *nearByAppDetailArray;
@property(nonatomic,strong)NSDictionary *appDic;

@end


@implementation YLAppDetailController

//-(YLAppDetailModel *)appDetail
//{
//    if (_appDetail == nil) {
//        _appDetail=[[YLAppDetailModel alloc]initWith:self.appDic];
//    }
//    return _appDetail;
//
//}
#pragma mark 获取app详情
-(void)sendRequest
{
    //创建下载地址
    // NSString *s = [NSString stringWithFormat:DETAIL_URL, self.model.applicationId.intValue];
    //NSString *s=@"http://iappfree.candou.com:8080/free/applications/503264290?currency=rmb";
    NSString *s=[NSString stringWithFormat:@"http://iappfree.candou.com:8080/free/applications/%@?currency=rmb",self.applicationId];
   // NSLog(@"s = %@",s);
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //此处设置后返回的默认是NSData的数据
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:s parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        //解析下载的数据为词典数据
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        // NSLog(@"%@",dict);
        self.appDetail=[YLAppDetailModel appDetailModelWith:dict];
        self.appDetailVIew.appDetailModel=self.appDetail;

        //NSLog(@"%@",self.appDetail);
       // NSLog(@"%@",[self.appDetail.photos[0] objectForKey:@"smallUrl"]);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}
#pragma mark 获取附近人使用的app
-(void)loadAppArray
{
    //下载附近使用数据 longitude=%lf&latitude=%lf
//    double longitude = 116.344539;
//    double latitude = 40.034346;
    NSString *nearbyUrl = @"http:iappfree.candou.com:8080/free/applications/recommend?longitude=116.344539&latitude=40.034346";
    
    //NSLog(@"nearbyUrl = %@",nearbyUrl);
    
    // http:iappfree.candou.com:8080/free/applications/recommend?longitude=116.344539&latitude=40.034346
    //网络下载数据
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //此处设置后返回的默认是NSData的数据
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:nearbyUrl parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        //转换为词典数据
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        //NSLog(@"nearby dict = %@",dict);
        
        NSArray *apps=[dict objectForKey:@"applications"];
       // NSLog(@"%@",[apps componentsJoinedByString:@"\n"]);
        NSMutableArray *objs=[NSMutableArray array];
        for (NSDictionary *dic in apps) {
            YLAppDetailModel *appDetail=[YLAppDetailModel appDetailModelWith:dic];
           // NSLog(@"%@",appDetail);
            [objs addObject:appDetail];
        }
        self.appDetailVIew.nearByApps=objs;
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.appDetailVIew.nvc=self.navigationController;
    [self sendRequest];
    [self loadAppArray];
  
   // NSLog(@"%@",[self.appDetailVIew.nearByApps componentsJoinedByString:@"\n"]);
    
    
  //  NSLog(@"%@",self.appDetail);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation 跳转到下一个视图

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    //跳转到图片显示详情页
    if ([[segue destinationViewController] isKindOfClass: [YLAppPhotoShowController class]]) {
        YLAppPhotoShowController *apc=(YLAppPhotoShowController *)[segue destinationViewController];
        apc.photos=self.appDetailVIew.appDetailModel.photos;
    }
    
}


@end
