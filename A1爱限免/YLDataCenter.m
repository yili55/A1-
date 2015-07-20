//
//  YLDataCenter.m
//  A1爱限免
//
//  Created by qianfeng on 15-7-11.
//  Copyright (c) 2015年 yili. All rights reserved.
//

#import "YLDataCenter.h"
@implementation YLDataCenter
+(id)sharedInstance
{
    static id dataCenter = nil;
    if(dataCenter == nil)
    {
        dataCenter = [[[self class] alloc] init];
    }
    return dataCenter;
}

-(id)init
{
    if(self = [super init])
    {
        //初始化数据库
        [self initDatabase];
        
    }
    return self;
}

-(void)initDatabase
{
    
    
    
    // 创建一个数据库对象
    NSString *path = [NSString stringWithFormat:@"%@/Library/Caches/app.db", NSHomeDirectory()];
    //NSLog(@"db is %@", path);
    _appDataBase = [[FMDatabase alloc] initWithPath:path];
    
    
    // 打开数据库
    [_appDataBase open];
    
    //表格的数据结构
    //  id,applicationId,name,iconUrl,type,
    //      lastPrice,currentPrice,recordType
    
    NSString *sql = @"create table if not exists applist  ("
    " id integer primary key autoincrement not null, "
    " recordType varchar(32), "
    " applicationId integer not null, "
    " name varchar(128), "
    " iconUrl varchar(1024), "
    " type varchar(32) ,"
    " lastPrice integer, "
    " currentPrice integer "
    ");";
    [_appDataBase executeUpdate:sql];
    
    
}

#pragma mark - 浏览记录相关

-(BOOL) isExistAppRecord:(YLAppDetailModel *)model
{
    NSString *sql = [NSString stringWithFormat:
                     @"select count(*) from applist where applicationId='%@' and recordType='browse';",
                     model.applicationId];
    // executeQuery 主要用在select
    FMResultSet *set = [_appDataBase executeQuery:sql];
    // set明显只有一条记录
    if (set) {
        [set next];
        // 返回第0列
        int c = [set intForColumnIndex:0];
        [set close];
        return c>0;
    }
    return NO;
    
}
-(void) addAppRecord:(YLAppDetailModel *)model
{
    BOOL isExist = [self isExistAppRecord:model];
    if (isExist) return;
    
    NSString *sql =
    @"insert into applist ( applicationId, name, iconUrl, type ,recordType)  values (?,?,?,?,?);";
    [_appDataBase executeUpdate:sql,
     [NSNumber numberWithUnsignedInteger:model.applicationId.intValue],
     model.name,
     model.iconUrl,
     @"Limited",
     @"browse"
     ];
}
-(void) deleteAppRecord:(YLAppDetailModel *)model
{
    NSString *sql = [NSString stringWithFormat:
                     @"delete from applist where applicationId='%@' and recordType='browse'",
                     model.applicationId];
    [_appDataBase executeUpdate:sql];
}

- (NSArray *) getAllBrowseArray {
    NSString *sql = @"select * from applist where recordType='browse'";
    FMResultSet *set = [_appDataBase executeQuery:sql];
    NSMutableArray *retArr = [[NSMutableArray alloc] init];
    while ([set next]) {
        // 找一条记录
        // applicationId, name, iconUrl
        NSUInteger applicationId = [set intForColumn:@"applicationId"];
        NSString *name = [set stringForColumn:@"name"];
        NSString *iconUrl = [set stringForColumn:@"iconUrl"];
        YLAppDetailModel *am = [[YLAppDetailModel alloc] init];
        am.applicationId = [NSString stringWithFormat:@"%d",applicationId];
        am.name = name;
        am.iconUrl = iconUrl;
        [retArr addObject:am];
    }
    return [retArr copy];
}


#pragma mark - 收藏相关方法

-(BOOL) isExistFavoriteRecord:(YLAppDetailModel *)model
{
    NSString *sql = [NSString stringWithFormat:
                     @"select count(*) from applist where applicationId='%@' and recordType='favorite';",
                     model.applicationId];
    // executeQuery 主要用在select
    FMResultSet *set = [_appDataBase executeQuery:sql];
    // set明显只有一条记录
    if (set) {
        [set next];
        // 返回第0列
        int c = [set intForColumnIndex:0];
        [set close];
        return c>0;
    }
    return NO;
    
}
-(void) addFavoriteRecord:(YLAppDetailModel *)model
{
    BOOL isExist = [self isExistFavoriteRecord:model];
    if (isExist) return;
    
    NSString *sql =
    @"insert into applist ( applicationId, name, iconUrl, type ,recordType)  values (?,?,?,?,?);";
    [_appDataBase executeUpdate:sql,
     [NSNumber numberWithUnsignedInteger:model.applicationId.intValue],
     model.name,
     model.iconUrl,
     @"Limited",
     @"favorite"
     ];
    
}
-(void) deleteFavoriteRecord:(YLAppDetailModel *)model
{
    NSString *sql = [NSString stringWithFormat:
                     @"delete from applist where applicationId='%@' and recordType='favorite'",
                     model.applicationId];
    [_appDataBase executeUpdate:sql];
    
}
- (NSUInteger) getAppFavoriteCount {
    NSString *sql = @"select count(*) from applist where recordType='favorite';";
    FMResultSet *set = [_appDataBase executeQuery:sql];
    // set明显只有一条记录
    [set next];
    // 返回第0列
    int c = [set intForColumnIndex:0];
    [set close];
    return c;
}

- (NSArray *) getAllFavoriteArray {
    NSString *sql = @"select * from applist where recordType='favorite'";
    FMResultSet *set = [_appDataBase executeQuery:sql];
    NSMutableArray *retArr = [[NSMutableArray alloc] init];
    while ([set next]) {
        // 找一条记录
        // applicationId, name, iconUrl
        NSUInteger applicationId = [set intForColumn:@"applicationId"];
        NSString *name = [set stringForColumn:@"name"];
        NSString *iconUrl = [set stringForColumn:@"iconUrl"];
        YLAppDetailModel *am = [[YLAppDetailModel alloc] init];
        am.applicationId = [NSString stringWithFormat:@"%d",applicationId];
        am.name = name;
        am.iconUrl = iconUrl;
        [retArr addObject:am];
    }
    return [retArr copy];
}



#pragma mark - 下载记录相关

//下载记录相关
-(BOOL) isExistDownloadRecord:(YLAppDetailModel *)model
{
    NSString *sql = [NSString stringWithFormat:
                     @"select count(*) from applist where applicationId='%@' and recordType='download';",
                     model.applicationId];
    // executeQuery 主要用在select
    FMResultSet *set = [_appDataBase executeQuery:sql];
    // set明显只有一条记录
    if (set) {
        [set next];
        // 返回第0列
        int c = [set intForColumnIndex:0];
        [set close];
        return c>0;
    }
    return NO;
}
-(void) addDownloadRecord:(YLAppDetailModel *)model
{
    BOOL isExist = [self isExistDownloadRecord:model];
    if (isExist) return;
    
    NSString *sql =
    @"insert into applist ( applicationId, name, iconUrl, type,recordType)  values (?,?,?,?,?);";
    [_appDataBase executeUpdate:sql,
     [NSNumber numberWithUnsignedInteger:model.applicationId.intValue],
     model.name,
     model.iconUrl,
     @"Limited",
     @"download"
     ];
    
}
-(NSUInteger) getAppDownloadCount
{
    NSString *sql = @"select count(*) from applist where recordType='download';";
    FMResultSet *set = [_appDataBase executeQuery:sql];
    // set明显只有一条记录
    [set next];
    // 返回第0列
    int c = [set intForColumnIndex:0];
    [set close];
    return c;
}
-(NSArray *) getAllDownloadArray
{
    NSString *sql = @"select * from applist where recordType='download'";
    FMResultSet *set = [_appDataBase executeQuery:sql];
    NSMutableArray *retArr = [[NSMutableArray alloc] init];
    while ([set next]) {
        // 找一条记录
        // applicationId, name, iconUrl
        NSUInteger applicationId = [set intForColumn:@"applicationId"];
        NSString *name = [set stringForColumn:@"name"];
        NSString *iconUrl = [set stringForColumn:@"iconUrl"];
        YLAppDetailModel *am = [[YLAppDetailModel alloc] init];
        am.applicationId = [NSString stringWithFormat:@"%d",applicationId];
        am.name = name;
        am.iconUrl = iconUrl;
        [retArr addObject:am];
    }
    return [retArr copy];
}

@end
