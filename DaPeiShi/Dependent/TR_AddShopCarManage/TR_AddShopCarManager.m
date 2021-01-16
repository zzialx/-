//
//  TR_AddShopCarManager.m
//  DaPeiShi
//
//  Created by admin on 2019/3/20.
//  Copyright © 2019年 candy.chen. All rights reserved.
//

#import "TR_AddShopCarManager.h"

@interface TR_AddShopCarManager ()

@end

static TR_AddShopCarManager *manager = nil;

@implementation TR_AddShopCarManager
+ (TR_AddShopCarManager *)sharedManager{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[self alloc]init];
    });
    return manager;
}
- (void)addShopCarWithGoodsModel:(TR_GoodsInfoModel*)model completionBlock:(BoolBlock)block{
    
}

@end
