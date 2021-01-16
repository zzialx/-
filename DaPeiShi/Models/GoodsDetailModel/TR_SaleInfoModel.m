//
//  TR_SaleInfoModel.m
//  DaPeiShi
//
//  Created by admin on 2019/4/11.
//  Copyright © 2019年 candy.chen. All rights reserved.
//

#import "TR_SaleInfoModel.h"

@implementation TR_SaleInfoModel
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{
             @"goodsCouponLst":[TR_DiscountModel class],
             };
}
@end
