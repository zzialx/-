//
//  CollectionStoreModel.m
//  XBM
//
//  Created by isaac on 2018/6/12.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "CollectionStoreModel.h"
#import "CollectionStoreGoodsModel.h"
@implementation CollectionStoreModel
-(instancetype)initWithDictionary:(NSDictionary *)dic{
    self = [super init];
    if (self) {
        _isSelect = NO;
        _collectionId = MakeStringNotNil(dic[@"collectionId"]);
        _collectionNum = MakeStringNotNil(dic[@"collectionNum"]);
        _multiScore = MakeStringNotNil(dic[@"multiScore"]);
        _saleNum = MakeStringNotNil(dic[@"saleNum"]);
        _shopIcon = MakeStringNotNil(dic[@"shopIcon"]);
        _shopName = MakeStringNotNil(dic[@"shopName"]);
        _pic = [[NSMutableArray alloc]init];
        _shopId = MakeStringNotNil(dic[@"shopId"]);
        if ([dic[@"goods"] isKindOfClass:[NSArray class]] && [dic[@"goods"] count] > 0) {
            for (NSDictionary *dicModel in dic[@"goods"]) {
                CollectionStoreGoodsModel *model = [[CollectionStoreGoodsModel alloc]initWithDictionary:dicModel];
                [_pic addObject:model];
            }
           
        }
    }
    return self;
}
@end
