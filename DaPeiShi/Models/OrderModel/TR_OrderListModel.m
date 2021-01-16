//
//  TR_OrderListModel.m
//  DaPeiShi
//
//  Created by candy.chen on 2019/1/3.
//  Copyright © 2019年 candy.chen. All rights reserved.
//

#import "TR_OrderListModel.h"

@implementation TR_OrderListModel

+(NSDictionary *)modelCustomPropertyMapper
{
    return @{@"orderGoodsList":@"goodsLst"};
}

+ (NSDictionary *)modelContainerPropertyGenericClass
{
    return @{@"orderGoodsList":[TR_OrderGoodsModel class]};
}

@end
