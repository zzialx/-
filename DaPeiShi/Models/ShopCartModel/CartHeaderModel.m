//
//  CartHeaderModel.m
//  XBM
//
//  Created by isaac on 2018/6/8.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "CartHeaderModel.h"
#import "CartGoodsModel.h"
@implementation CartHeaderModel
-(instancetype)initWithDictionary:(NSDictionary *)dic{
    self = [super init];
    if (self) {
        _isSelect = NO;
        _coupon = MakeStringNotNil(dic[@"coupon"]);
        _priceShopSum = MakeStringNotNil(dic[@"priceShopSum"]);
        _shopId = MakeStringNotNil(dic[@"shopId"]);
        _shopName = MakeStringNotNil(dic[@"shopName"]);
        _shopIcon = MakeStringNotNil(dic[@"shopIcon"]);
        _cartInfo = [[NSMutableArray alloc]init];
        if ([dic[@"cartInfo"] isKindOfClass:[NSArray class]]) {
            for (NSDictionary *dicGoods in dic[@"cartInfo"]) {
                CartGoodsModel *model = [[CartGoodsModel alloc]initWithDictionary:dicGoods];
                [_cartInfo addObject:model];
            }
        }
    }
    return self;
}
@end
