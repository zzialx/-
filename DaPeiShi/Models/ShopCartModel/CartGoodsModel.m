//
//  CartGoodsModel.m
//  XBM
//
//  Created by isaac on 2018/6/8.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "CartGoodsModel.h"

@implementation CartGoodsModel
-(instancetype)initWithDictionary:(NSDictionary *)dic{
    self = [super init];
    if (self) {
        _isSelect = NO;
        _goodsId = MakeStringNotNil(dic[@"goodsId"]);
         _goodsTitle = MakeStringNotNil(dic[@"goodsTitle"]);
         _normDesc = MakeStringNotNil(dic[@"normDesc"]);
         _normId = MakeStringNotNil(dic[@"normId"]);
         _picUrl = MakeStringNotNil(dic[@"picUrl"]);
         _price = MakeStringNotNil(dic[@"price"]);
         _priceSum = MakeStringNotNil(dic[@"priceSum"]);
         _productNum = MakeStringNotNil(dic[@"productNum"]);
         _whetherOnShelf = MakeStringNotNil(dic[@"whetherOnShelf"]);
        _status = MakeStringNotNil(dic[@"status"]);
        _collectionStatus = MakeStringNotNil(dic[@"collectionStatus"]);
    }
    return self;
}
@end
