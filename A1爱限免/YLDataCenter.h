//
//  YLDataCenter.h
//  A1爱限免
//
//  Created by qianfeng on 15-7-11.
//  Copyright (c) 2015年 yili. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"
#import "YLAppDetailModel.h"
@interface YLDataCenter : NSObject

@property(nonatomic,strong)FMDatabase *appDataBase;
//获取单例对象的方法
+(id)sharedInstance;

//点击记录记录相关
-(BOOL) isExistAppRecord:(YLAppDetailModel *)model;
-(void) addAppRecord:(YLAppDetailModel *)model;
-(void) deleteAppRecord:(YLAppDetailModel *)model;
- (NSArray *) getAllBrowseArray;

//收藏记录相关
-(BOOL) isExistFavoriteRecord:(YLAppDetailModel *)model;
-(void) addFavoriteRecord:(YLAppDetailModel *)model;
-(void) deleteFavoriteRecord:(YLAppDetailModel *)model;
-(NSUInteger) getAppFavoriteCount;
-(NSArray *) getAllFavoriteArray;

//下载记录相关
-(BOOL) isExistDownloadRecord:(YLAppDetailModel *)model;
-(void) addDownloadRecord:(YLAppDetailModel *)model;
-(NSUInteger) getAppDownloadCount;
-(NSArray *) getAllDownloadArray;
@end
