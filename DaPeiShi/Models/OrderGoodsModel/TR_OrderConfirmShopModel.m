//
//  TR_OrderShopModel.m
//  DaPeiShi
//
//  Created by isaac on 2019/3/19.
//  Copyright © 2019年 candy.chen. All rights reserved.
//

#import "TR_OrderConfirmGoodsModel.h"
#import "TR_OrderConfirmShopModel.h"

@implementation TR_OrderConfirmShopModel

+ (NSDictionary *)modelContainerPropertyGenericClass
{
    return @{@"goodsList":[TR_OrderConfirmGoodsModel class]};
}

@end
