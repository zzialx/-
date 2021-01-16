//
//  SearchCacheManager.h
//  DaPeiShi
//
//  Created by admin on 2019/1/16.
//  Copyright © 2019年 candy.chen. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SearchCacheManager : NSObject
@property(nonatomic,strong)YYCache * cache;
+ (SearchCacheManager *)sharedManager;
- (void)cacheSearchHistoryList:(NSArray*)history;
- (void)cacheSearchHistoryContent:(NSString*)content;
- (NSArray*)getSearchHistory;
- (void)deleateOneHistory:(NSInteger)index;
- (void)deleateAllHistroy;
@end

NS_ASSUME_NONNULL_END
