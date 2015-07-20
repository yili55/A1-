//
//  YLRankController.m
//  A1爱限免
//
//  Created by qianfeng on 15-7-8.
//  Copyright (c) 2015年 yili. All rights reserved.
//

#import "YLRankController.h"
#import "YLlimitfreeController.h"
@interface YLRankController ()

@end

@implementation YLRankController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated
{
   
  [self performSegueWithIdentifier:@"rank" sender:self];
    
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    YLlimitfreeController *lfc=(YLlimitfreeController *)[segue destinationViewController];
    lfc.title=@"热榜";
    //lfc.urlString=@"http://open.candou.com/mobile/hot/page/%d&category_id=%@";
    lfc.urlString=@"http://open.candou.com/mobile/hot/page/%d&category_id=%@";
}


@end
