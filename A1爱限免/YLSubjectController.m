//
//  YLSubjectController.m
//  A1爱限免
//
//  Created by qianfeng on 15-7-8.
//  Copyright (c) 2015年 yili. All rights reserved.
//

#import "YLSubjectController.h"
#import "YLlimitfreeController.h"
@interface YLSubjectController ()

@end

@implementation YLSubjectController

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
    [self performSegueWithIdentifier:@"subject" sender:self];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    YLlimitfreeController *lfc=(YLlimitfreeController *)[segue destinationViewController];
    lfc.title=@"专题";
    lfc.urlString=@"http://iappfree.candou.com:8080/free/special?page=%d&limit=5%@";
    //lfc.urlString=@"http://iappfree.candou.com:8080/free/special?";
}


@end
