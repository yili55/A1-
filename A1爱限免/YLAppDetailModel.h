//
//  YLAppDetailModel.h
//  A1爱限免
//
//  Created by qianfeng on 15-7-10.
//  Copyright (c) 2015年 yili. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YLAppDetailModel : NSObject

@property(nonatomic,copy)NSString * applicationId;

@property(nonatomic,copy)NSString * slug;

@property(nonatomic,copy)NSString * name;

@property(nonatomic,copy)NSString * releaseDate;

@property(nonatomic,copy)NSString * currentVersion;

@property(nonatomic,copy)NSString * currentPrice;

@property(nonatomic,copy)NSString * lastPrice;

@property(nonatomic,copy)NSString * priceTrend;

@property(nonatomic,copy)NSString * expireDatetime;

@property(nonatomic,copy)NSString * categoryId;

@property(nonatomic,copy)NSString * categoryName;

@property(nonatomic,copy)NSString * fileSize;

@property(nonatomic,copy)NSString * description;

@property(nonatomic,copy)NSString * des;

@property(nonatomic,copy)NSString * description_long;

@property(nonatomic,copy)NSString * systemRequirements;

@property(nonatomic,copy)NSString * sellerId;

@property(nonatomic,copy)NSString * sellerName;

@property(nonatomic,copy)NSString * language;

@property(nonatomic,copy)NSString * iconUrl;

@property(nonatomic,copy)NSString * itunesUrl;

@property(nonatomic,copy)NSString * downloads;

@property(nonatomic,copy)NSString * starCurrent;

@property(nonatomic,copy)NSString * starOverall;

@property(nonatomic,copy)NSString * ratingOverall;

@property(nonatomic,copy)NSString * releaseNotes;

@property(nonatomic,copy)NSString * updateDate;

@property(nonatomic,copy)NSString * appurl;

@property(nonatomic,copy)NSString * newversion;

@property(nonatomic,retain)NSArray * photos;





-(id)initWith:(NSDictionary *)dic;
+(id)appDetailModelWith:(NSDictionary *)dic;
@end
