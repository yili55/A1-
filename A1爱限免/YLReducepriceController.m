//
//  YLReducepriceController.m
//  A1爱限免
//
//  Created by qianfeng on 15-7-8.
//  Copyright (c) 2015年 yili. All rights reserved.
//

#import "YLReducepriceController.h"
#import "YLlimitfreeController.h"
@interface YLReducepriceController ()

@end

@implementation YLReducepriceController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //adc.urlString=@"http://iappfree.candou.com:8080/free/applications/sales?currency=rmb&page=1&category_id=";
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark 跳转到相应的视图
-(void)viewWillAppear:(BOOL)animated
{
    NSLog(@"reducePrice");
    [self performSegueWithIdentifier:@"reducePrice" sender:self];
}
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    YLlimitfreeController *lfc=(YLlimitfreeController *)[segue destinationViewController];
   // YLReducepriceController *rc=(YLReducepriceController *)sender;
   // NSLog(@"%@",self.title);
    lfc.title=@"降价";
    lfc.urlString=@"http://iappfree.candou.com:8080/free/applications/sales?currency=rmb&page=%d&category_id=%@";
     // lfc.urlString=@"http://iappfree.candou.com:8080/free/applications/sales?currency=rmb&";
}

@end
