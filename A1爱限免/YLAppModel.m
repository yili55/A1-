//
//  YLAppModel.m
//  A1爱限免
//
//  Created by qianfeng on 15-7-8.
//  Copyright (c) 2015年 yili. All rights reserved.
//

#import "YLAppModel.h"

@implementation YLAppModel
-(id)initWithDic:(NSDictionary *)dic
{
    if (self =[super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}
+(id)appWithDIc:(NSDictionary *)dic
{
    return [[YLAppModel alloc]initWithDic:dic];
}
//重写description属性
//获得没有声明的key和value，将它们存储到其他的属性中去
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
   // NSLog(@"%@,%@",key,value);
    if ([key isEqualToString:@"description"]) {
        self.desc=value;
    }
}
-(NSString *)description
{
    return [NSString stringWithFormat:@"des=%@",self.desc];
}
@end
