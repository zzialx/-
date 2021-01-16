//
//  TR_GoodsInfoModel.m
//  DaPeiShi
//
//  Created by admin on 2019/3/18.
//  Copyright © 2019年 candy.chen. All rights reserved.
//

#import "TR_GoodsInfoModel.h"

@implementation TR_GoodsInfoModel
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"normList":@[@"goodsNormLst",@"normList"]};
}

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"goodsFiles" : [TR_FileModel class],
                    @"goodsNormInfoLst":[TR_NormalModel class],
                    @"b2cGattrsVals":[TR_GoodsAttrsModel class],
                    @"shopCouponLst":[TR_DiscountModel class],
             @"secKillActInfo":[TR_SecondKillModel class],
             @"saleInfo":[TR_SaleInfoModel class]
            
                    };
}
@end
