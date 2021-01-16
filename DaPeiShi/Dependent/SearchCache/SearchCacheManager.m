//
//  SearchCacheManager.m
//  DaPeiShi
//
//  Created by admin on 2019/1/16.
//  Copyright © 2019年 candy.chen. All rights reserved.
//

#import "SearchCacheManager.h"

static NSString * HISTORY = @"search_history";
static SearchCacheManager *instance = nil;

@implementation SearchCacheManager
+ (SearchCacheManager *)sharedManager{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc]init];
    });
    return instance;
}
- (instancetype)init {
    self = [super init];
    if (self) {
        self.cache = [YYCache cacheWithName:HISTORY];
    }
    return self;
}
- (void)cacheSearchHistoryList:(NSArray*)history{
    [self.cache setObject:history forKey:HISTORY_SEARCH_KEY];
}
- (void)cacheSearchHistoryContent:(NSString*)content{
    NSMutableArray* temp_arrary = (NSMutableArray *)[self getSearchHistory];
    if(temp_arrary!=nil){
        if (temp_arrary.count>10) {
            //先删除索引为1的数据，再加入此搜索内容
            [temp_arrary removeObjectAtIndex:0];
            [temp_arrary addObject:content];
        }else{
            [temp_arrary addObject:content];
        }
    }else{
        temp_arrary = [NSMutableArray new];
        [temp_arrary addObject:content];
    }
    [self.cache setObject:temp_arrary forKey:HISTORY_SEARCH_KEY];
}

- (NSArray*)getSearchHistory{
    NSArray * array = [NSArray new];
    array = (NSArray *)[self.cache objectForKey:HISTORY_SEARCH_KEY];
    return array;
}
- (void)deleateOneHistory:(NSInteger)index{
    NSMutableArray* temp_arrary = (NSMutableArray *)[self getSearchHistory];
    if (index < temp_arrary.count) {
        [temp_arrary removeObjectAtIndex:index];
    }
    [self.cache setObject:temp_arrary forKey:HISTORY_SEARCH_KEY];
}
- (void)deleateAllHistroy{
    [self.cache removeObjectForKey:HISTORY_SEARCH_KEY];
}
@end
