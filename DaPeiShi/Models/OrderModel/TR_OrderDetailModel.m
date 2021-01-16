//
//  TR_OrderDetailModel.m
//  DaPeiShi
//
//  Created by candy.chen on 2019/1/4.
//  Copyright © 2019年 candy.chen. All rights reserved.
//

#import "TR_OrderDetailModel.h"

@implementation TR_OrderDetailModel

+(NSDictionary *)modelCustomPropertyMapper
{
    return @{@"goodsModel":@"goodsList"};
}

+ (NSDictionary *)modelContainerPropertyGenericClass
{
    return @{@"goodsModel":[TR_OrderGoodsModel class]};
}

@end
