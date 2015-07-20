//
//  YLAppFreeController.m
//  A1爱限免
//
//  Created by qianfeng on 15-7-11.
//  Copyright (c) 2015年 yili. All rights reserved.
//

#import "YLAppFreeController.h"
#import "YLlimitfreeController.h"
@interface YLAppFreeController ()

@end

@implementation YLAppFreeController

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
    NSLog(@"appFree");
    [self performSegueWithIdentifier:@"appFree" sender:self];
}
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    YLlimitfreeController *lfc=(YLlimitfreeController *)[segue destinationViewController];
   lfc.urlString=@"http://iappfree.candou.com:8080/free/applications/free?currency=rmb&page=%d&category_id=%@";
     //lfc.urlString=@"http://iappfree.candou.com:8080/free/applications/free?currency=rmb&";
    lfc.title=@"免费";
}


@end
