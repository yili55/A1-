//
//  YLLimitFreeViewController.m
//  A1爱限免
//
//  Created by qianfeng on 15-7-11.
//  Copyright (c) 2015年 yili. All rights reserved.
//

#import "YLLimitFreeViewController.h"
#import "YLlimitfreeController.h"
@interface YLLimitFreeViewController ()

@end

@implementation YLLimitFreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"will");
   //
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark 跳转到相应的视图
-(void)viewWillAppear:(BOOL)animated
{
[self performSegueWithIdentifier:@"limitFree" sender:self];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    NSLog(@"ddd");
    YLlimitfreeController *lfc=(YLlimitfreeController *)[segue destinationViewController];
    YLLimitFreeViewController *lvc=(YLLimitFreeViewController *)sender;
    lfc.title=@"限免";
    //lfc.urlString=@"http://iappfree.candou.com:8080/free/applications/limited?currency=rmb&";
    lfc.urlString=@"http://iappfree.candou.com:8080/free/applications/limited?currency=rmb&page=%d&category_id=%@";
    NSLog(@"rrr");
}


@end
