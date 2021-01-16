//
//  TR_ShopDetailModel.m
//  DaPeiShi
//
//  Created by admin on 2019/1/22.
//  Copyright © 2019年 candy.chen. All rights reserved.
//

#import "TR_ShopDetailModel.h"

@implementation TR_ShopDetailModel
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"newestLst":@[@"newLst"]};
}
+ (NSDictionary *)modelContainerPropertyGenericClass {
    
    return @{@"newestLst" : [TR_ShopGoodsModel class],
                    @"hotLst" : [TR_ShopGoodsModel class],
                    @"recommendLst" : [TR_ShopGoodsModel class],
                    @"bannerLst" : [TR_BannerModel class],
                    @"shopCouponLst":[TR_DiscountModel class]
                    };
    
}


@end
