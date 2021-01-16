//
//  TR_ShopGoodsModel.m
//  DaPeiShi
//
//  Created by admin on 2019/3/22.
//  Copyright © 2019年 candy.chen. All rights reserved.
//

#import "TR_ShopGoodsModel.h"

@implementation TR_ShopGoodsModel
+(NSDictionary *)modelCustomPropertyMapper
{
    return @{@"maxPrice":@"price.maxPrice",@"minPrice":@"price.minPrice"};
}
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{};
}
@end
