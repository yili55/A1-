//
//  YLAppDetailView.m
//  A1爱限免
//
//  Created by qianfeng on 15-7-10.
//  Copyright (c) 2015年 yili. All rights reserved.
//

/*
 {
 "applicationId": "503264290",
 "slug": "dangleitis-hockey",
 "name": "策略曲棍球",
 "releaseDate": "2013-04-12",
 "currentVersion": "1.4.2",
 "currentPrice": "0",
 "lastPrice": "6",
 "priceTrend": "limited",
 "expireDatetime": "2015-07-10 11:38:40.0",
 "categoryId": 6014,
 "categoryName": "Game",
 "fileSize": "38.72",
 "description": "回合制的曲棍球策略类游戏。画面精美，玩家需要同时控制包括守门员的四个角色，角色在每回合都有一次移动、传球、射门等机会，玩家必须熟练每个球员的移动距离。游戏支持双人同机对战，玩家可以邀请好友一同游戏。",
 "description_long": "DANGLE, HIT and NEVER QUIT!
 
 Dangleitis Hockey is a challenging game of MAJOR strategy and HUGE bragging rights!
 
 Playing with the classic rules of 3 on 3 street hockey. Your goal is to pick players and command the custom squad of critters to take tactical gambles and WIN the game at all cost.
 
 -Dangleitis is the very first turn based hockey game of it's kind!
 
 -30 FREE players included!
 
 -7 ALL STAR players for purchase.
 
 -Head to Head or Single player mode",
 "systemRequirements": "与 iPhone、iPod touch、iPad 兼容。需要 iOS 4.3 或更高版本",
 "sellerId": "503264293",
 "sellerName": "Fighter Jet Studios",
 "language": "英语",
 "iconUrl": "http://photo.candou.com/i/114/2974e3a1afcf77d8574c47f2be5bcd9b",
 "itunesUrl": "http://itunes.apple.com/cn/app/dangleitis-hockey/id503264290?mt=8",
 "downloads": "1304",
 "starCurrent": "4.5",
 "starOverall": "4.5",
 "ratingOverall": "0",
 "releaseNotes": "Fix a crash when playing without network connection",
 "updateDate": "2014-10-17 15:44:50",
 "appurl": "1",
 "newversion": "1.2",
 "photos": [
 {
 "smallUrl": "http://photo.candou.com/s/o1/01ae9a9556da6ebf779c1a9c21b721d9",
 "originalUrl": "http://photo.candou.com/s/o0/01ae9a9556da6ebf779c1a9c21b721d9"
 },
 {
 "smallUrl": "http://photo.candou.com/s/o1/d03d1fe51a89d725c748944b577ba2ea",
 "originalUrl": "http://photo.candou.com/s/o0/d03d1fe51a89d725c748944b577ba2ea"
 },
 {
 "smallUrl": "http://photo.candou.com/s/o1/1db166dfbda9db67c7d2bce8105f3f72",
 "originalUrl": "http://photo.candou.com/s/o0/1db166dfbda9db67c7d2bce8105f3f72"
 }
 ]
 }
 */
#import "YLAppDetailView.h"
#import "UIImageView+AFNetworking.h"
#import "YLDataCenter.h"
#import "YLAppDetailController.h"
@interface YLAppDetailView()

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLab;
@property (weak, nonatomic) IBOutlet UILabel *lastPriceLab;
@property (weak, nonatomic) IBOutlet UILabel *fileSizeLab;
@property (weak, nonatomic) IBOutlet UILabel *categoryNameLab;
@property (weak, nonatomic) IBOutlet UILabel *starCurrentLab;
@property (weak, nonatomic) IBOutlet UIScrollView *smallImageScrollerView;
@property (weak, nonatomic) IBOutlet UIScrollView *nearByAppsScrollerView;
@property (weak, nonatomic) IBOutlet UIButton *shareBtn;
@property (weak, nonatomic) IBOutlet UIButton *favouriteBtn;
@property (weak, nonatomic) IBOutlet UIButton *downLoadBtn;

//存储轮滑的小图片
@property(nonatomic,strong)NSArray *photos;
@end

@implementation YLAppDetailView
#pragma mark 设置app详情
-(void)setAppDetailModel:(YLAppDetailModel *)appDetailModel
{
    //NSLog(@"%@",appDetailModel);
    _appDetailModel=appDetailModel;
    [self.iconImageView setImageWithURL:[NSURL URLWithString:appDetailModel.iconUrl]];
    self.nameLab.text=appDetailModel.name;
    //NSLog(@"%@",appDetailModel.name);
    self.lastPriceLab.text= [NSString stringWithFormat:@"原价$%@限免中",appDetailModel.lastPrice];
    //NSLog(@"%@",appDetailModel.lastPrice);
    self.fileSizeLab.text=[NSString stringWithFormat:@"%@MB",appDetailModel.fileSize];
    self.categoryNameLab.text=[NSString stringWithFormat:@"类型：%@",appDetailModel.categoryName];
    self.starCurrentLab.text=[NSString stringWithFormat:@"评分：%@",appDetailModel.starCurrent];
    
    YLDataCenter *dc=[YLDataCenter sharedInstance];
    
   // NSLog(@"FAV->%d",[dc isExistFavoriteRecord:self.appDetailModel]);
    if([dc isExistFavoriteRecord:self.appDetailModel])
    {
        
        [self.favouriteBtn setTitle:@"取消收藏" forState:UIControlStateNormal];
    }
    else
    {
       
        [self.favouriteBtn setTitle:@"收藏" forState:UIControlStateNormal];
    }
  self.smallImageScrollerView.userInteractionEnabled=YES;
    for(int i=0;i<appDetailModel.photos.count;i++)
    {
        NSDictionary *dic=appDetailModel.photos[i];
        UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(i*63, 5, 60, 100)];
        [imageView setImageWithURL:[NSURL URLWithString:[dic objectForKey:@"smallUrl"]]];
        [self.smallImageScrollerView addSubview:imageView];
    }
    self.smallImageScrollerView.contentSize=CGSizeMake(self.smallImageScrollerView.subviews.count*63, 100);
    self.smallImageScrollerView.scrollEnabled=YES;
    
}
#pragma mark 设置附近人使用的app
-(void)setNearByApps:(NSMutableArray *)nearByApps
{
   // NSLog(@"%@",nearByApps);
    _nearByApps=nearByApps;
    for (int i=0; i<nearByApps.count; i++) {
        YLAppDetailModel *appDe=nearByApps[i];
        UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(i*65, 0, 60, 60)];
        [imageView setImageWithURL:[NSURL URLWithString:appDe.iconUrl ]];
        [self.nearByAppsScrollerView addSubview:imageView];
        UILabel *nameLabel=[[UILabel alloc]initWithFrame:CGRectMake(i*65, 65, 60, 30)];
        nameLabel.numberOfLines=0;
        nameLabel.font=[UIFont systemFontOfSize:10];
       // [nameLabel sizeToFit];
        nameLabel.textAlignment=NSTextAlignmentCenter;
        nameLabel.text=appDe.name;
        [self.nearByAppsScrollerView addSubview:nameLabel];
        imageView.tag=[appDe.applicationId intValue];
        
        //设置手势
        UITapGestureRecognizer * tapGes=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(goToAppDetail:)];
        imageView.userInteractionEnabled=YES;
        [imageView addGestureRecognizer:tapGes];
        
    }
    self.nearByAppsScrollerView.contentSize=CGSizeMake(self.nearByAppsScrollerView.subviews.count*65, 100) ;
    self.nearByAppsScrollerView.scrollEnabled=YES;
}
#pragma mark 收藏，下载，分享响应
- (IBAction)favoriteBtn:(id)sender {
   // NSLog(@" 收藏");
    YLDataCenter *dc=[YLDataCenter sharedInstance];

     //NSLog(@"FAV->%d",[dc isExistFavoriteRecord:self.appDetailModel]);
       if([dc isExistFavoriteRecord:self.appDetailModel])
    {
        [dc deleteFavoriteRecord:self.appDetailModel];
        [sender setTitle:@"收藏" forState:UIControlStateNormal];
    }
    else
    {
        [dc addFavoriteRecord:self.appDetailModel];
        [sender setTitle:@"取消收藏" forState:UIControlStateNormal];
    }

}
- (IBAction)loadBtn:(id)sender {
   // NSLog(@"下载");
     YLDataCenter *dc=[YLDataCenter sharedInstance];
    //应用下载记录
    if(![dc isExistDownloadRecord:self.appDetailModel])
    {
        [dc addDownloadRecord:self.appDetailModel];
    }
}
- (IBAction)shareBtn:(id)sender {
 //   NSLog(@"分享");
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"分享" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"新浪微博",@"微信好友",@"微信圈子",@"邮件",@"短信",nil];
    
    [actionSheet showInView:self];
}
#pragma mark 附近人使用app详细页跳转
-(void)goToAppDetail:(UITapGestureRecognizer *)tap
{
   // YLAppDetailController *adc=[[YLAppDetailController alloc]init];
    
    
  
    UIStoryboard *story=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    YLAppDetailController *adc=[story instantiateViewControllerWithIdentifier:@"YLAppDetailController"];
    adc.applicationId=[NSString stringWithFormat:@"%lu",tap.view.tag];
    NSLog(@"%@",adc.applicationId);
    [self.nvc pushViewController:adc animated:YES];
}

@end
