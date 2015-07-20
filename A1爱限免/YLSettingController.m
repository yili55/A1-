//
//  YLSettingController.m
//  A1爱限免
//
//  Created by qianfeng on 15-7-11.
//  Copyright (c) 2015年 yili. All rights reserved.
//

#import "YLSettingController.h"
#import "YLMyDownLoadController.h"
#import "YLMyFavouriteController.h"
@interface YLSettingController ()

@end

@implementation YLSettingController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    //NSLog(@"ggg");
    if ([[segue destinationViewController] isKindOfClass:[YLMyFavouriteController class]]) {
        //NSLog(@"%@",NSStringFromClass([YLMyFavouriteController class]));
        
    }else if ([[segue destinationViewController] isKindOfClass:[YLMyDownLoadController class]])
    {
       // NSLog(@"%@",NSStringFromClass([YLMyDownLoadController class]));
    }
}


@end
