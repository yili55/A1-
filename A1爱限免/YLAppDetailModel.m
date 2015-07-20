//
//  YLAppDetailModel.m
//  A1爱限免
//
//  Created by qianfeng on 15-7-10.
//  Copyright (c) 2015年 yili. All rights reserved.
//

#import "YLAppDetailModel.h"

@implementation YLAppDetailModel
-(id)initWith:(NSDictionary *)dic
{
    if (self= [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}
+(id)appDetailModelWith:(NSDictionary *)dic
{
    return [[self alloc]initWith:dic];
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"description"]) {
        self.des=value;
    }
}
-(NSString *)description
{
    return [NSString stringWithFormat:@"categoryNAme=%@",self.categoryName];
}
@end
