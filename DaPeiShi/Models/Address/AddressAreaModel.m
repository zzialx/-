//
//  AddressAreaModel.m
//  TeaExchange
//
//  Created by isaac on 2018/3/28.
//  Copyright © 2018年 isaac. All rights reserved.
//

#import "AddressAreaModel.h"

@implementation AddressAreaModel
-(instancetype)initWithDictionary:(NSDictionary *)dic{
    self = [super init];
    if (self) {
        _pid = MakeStringNotNil(dic[@"pid"]);
        _addressId =  MakeStringNotNil(dic[@"id"]);
        _areaId =  MakeStringNotNil(dic[@"areaId"]);
        _name =  MakeStringNotNil(dic[@"name"]);
        _pinyin = MakeStringNotNil(dic[@"pinyin"]);
        _isSelect = NO;
    }
    return self;
}
@end
