//
//  YLAppPhotoShowController.m
//  A1爱限免
//
//  Created by qianfeng on 15-7-10.
//  Copyright (c) 2015年 yili. All rights reserved.
//

#import "YLAppPhotoShowController.h"
#import "UIImageView+AFNetworking.h"
#import "YLAppDetailModel.h"
@interface YLAppPhotoShowController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *photoShowScrollerView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@end

@implementation YLAppPhotoShowController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self prepareScroller];
    [self preparePageControl];
    
    
}
#pragma mark 布局滚动图片
-(void)prepareScroller
{
   
    
    
   // self.photoShowScrollerView.backgroundColor=[UIColor redColor];
    self.automaticallyAdjustsScrollViewInsets=NO;
    self.photoShowScrollerView.bounces=NO;
    self.photoShowScrollerView.scrollEnabled=YES;
    self.photoShowScrollerView.pagingEnabled=YES;

    
    
    NSLog(@"%lu",_photos.count);
    for (int i=0; i<_photos.count; i++) {
        //NSLog(@"%@",photos[i]);
        UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(375*i, 0, 375, 562)];
        [imageView setImageWithURL:[NSURL URLWithString:[_photos[i] objectForKey:@"originalUrl"]]];
        [self.photoShowScrollerView addSubview:imageView];
      //  NSLog(@"%@",NSStringFromCGRect(imageView.frame) );
        
    }
    NSLog(@"%d",self.photoShowScrollerView.subviews.count);

    NSLog(@"%@",[self.photoShowScrollerView.subviews componentsJoinedByString:@"\n"]);
    self.photoShowScrollerView.contentSize=CGSizeMake((self.photoShowScrollerView.subviews.count-1)*375, 562);
}
-(void)preparePageControl
{
    self.pageControl.numberOfPages=_photoShowScrollerView.subviews.count;
    self.pageControl.enabled=NO;
    //self.pageControl.currentPageIndicatorTintColor
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    _pageControl.currentPage=scrollView.contentOffset.x/375;
}
-(void)setPhotos:(NSArray *)photos
{
    _photos=photos;

}
-(void)awakeFromNib
{
 
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
