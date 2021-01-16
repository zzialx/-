//
//  BrowseModel.m
//  XBM
//
//  Created by isaac on 2018/6/26.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "BrowseModel.h"

@implementation BrowseModel
-(instancetype)initWithDictionary:(NSDictionary *)dic{
    self = [super init];
    if (self) {
        _isSelect = NO;
        _realId = MakeStringNotNil(dic[@"realId"]);
        _evaluateNum = MakeStringNotNil(dic[@"evaluateNum"]);
        _favoriteNum = MakeStringNotNil(dic[@"favoriteNum"]);
        _goodsStatus = MakeStringNotNil(dic[@"goodsStatus"]);
        _goodsTitle = MakeStringNotNil(dic[@"goodsTitle"]);
        _payNum = MakeStringNotNil(dic[@"payNum"]);
        _pic = MakeStringNotNil(dic[@"pic"]);
        _produceFlag = MakeStringNotNil(dic[@"produceFlag"]);
        _collectionSign = MakeStringNotNil(dic[@"collectionSign"]);
        _goodsId = MakeStringNotNil(dic[@"goodsId"]);
        _minPrice = MakeStringNotNil(dic[@"minPrice"]);
        _maxPrice = MakeStringNotNil(dic[@"maxPrice"]);
        _originalPrice = MakeStringNotNil(dic[@"originalPrice"]);
        _killPrice = MakeStringNotNil(dic[@"killPrice"]);
    }
    return self;
}
@end
