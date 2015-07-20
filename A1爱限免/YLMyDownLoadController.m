//
//  YLMyDownLoadController.m
//  A1爱限免
//
//  Created by qianfeng on 15-7-11.
//  Copyright (c) 2015年 yili. All rights reserved.
//

#import "YLMyDownLoadController.h"
#import "YLDataCenter.h"
#import "YLAppDetailModel.h"
#import "UIImageView+AFNetworking.h"
#import "YLAppDetailController.h"
@interface YLMyDownLoadController ()
@property(nonatomic,retain)NSArray *appArray;
@property (weak, nonatomic) IBOutlet UIScrollView *loadScrollerView;
@end

@implementation YLMyDownLoadController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.automaticallyAdjustsScrollViewInsets=NO;
    self.title=@"我的下载";
    [self creatDownLoads];

    
}
#pragma mark 获取所有下载的app，并且显示到视图
-(void)creatDownLoads
{
    // 取得收藏的数组 数组里面存放的AppModel
    _appArray = [[YLDataCenter sharedInstance] getAllDownloadArray];
    for (int i = 0 ; i < _appArray.count; i++) {
        YLAppDetailModel *adm = [_appArray objectAtIndex:i];
        CGFloat x=i%3;
        CGFloat y=i/3;
        
        UIImageView *appImageView=[[UIImageView alloc]initWithFrame:CGRectMake(30+x*100, y*140, 80, 120)];
        UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 80, 80)];
        [imageView setImageWithURL:[NSURL URLWithString:adm.iconUrl]];
        UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(10, 90, 80, 40)];
        label.text=adm.name;
        label.numberOfLines=0;
        label.font=[UIFont systemFontOfSize: 15];
        [appImageView addSubview:label];
        [appImageView addSubview:imageView];
        [self.loadScrollerView addSubview:appImageView];
        
        //增加手势
        appImageView.userInteractionEnabled=YES;
        appImageView.tag=[adm.applicationId integerValue];
        UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(appTap:)];
        [appImageView addGestureRecognizer:tap];
        
    }
    self.loadScrollerView.contentSize=CGSizeMake(375, (self.loadScrollerView.subviews.count/3+1)*140);
  //  NSLog(@"LoadscrollerView=%@-----",NSStringFromCGRect(self.loadScrollerView.frame));
    self.loadScrollerView.scrollEnabled=YES;
}

#pragma mark 跳转到详情页
-(void)appTap:(UITapGestureRecognizer *)tap
{
    UIStoryboard *story=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    YLAppDetailController *adc=[story instantiateViewControllerWithIdentifier:@"YLAppDetailController"];
    adc.applicationId=[NSString stringWithFormat:@"%lu",tap.view.tag ];
    [self.navigationController pushViewController:adc animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
