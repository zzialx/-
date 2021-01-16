//
//  CollectionStoreGoodsModel.m
//  XBM
//
//  Created by isaac on 2018/7/17.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "CollectionStoreGoodsModel.h"

@implementation CollectionStoreGoodsModel
-(instancetype)initWithDictionary:(NSDictionary *)dic{
    
    if (self = [super init]) {
        _picUrl = MakeStringNotNil(dic[@"pic"]);
        _price = MakeStringNotNil(dic[@"price"]);
        _goodsId = MakeStringNotNil(dic[@"goodsId"]);
        _maxPrice = MakeStringNotNil(dic[@"maxPrice"]);
        _minPrice = MakeStringNotNil(dic[@"minPrice"]);
        _produceFlag = MakeStringNotNil(dic[@"produceFlag"]);
        _killPrice = MakeStringNotNil(dic[@"killPrice"]);
        _originalPrice = MakeStringNotNil(dic[@"originalPrice"]);
    }
    return self;
}
@end
