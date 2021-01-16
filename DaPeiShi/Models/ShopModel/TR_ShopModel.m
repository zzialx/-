//
//  TR_ShopModel.m
//  DaPeiShi
//
//  Created by admin on 2019/1/22.
//  Copyright © 2019年 candy.chen. All rights reserved.
//

#import "TR_ShopModel.h"

@implementation TR_ShopModel
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
             @"shopDescribeScore":@"shopScoreStatisticVo.desc.score",
             @"shopDescribeScoreLevel":@"shopScoreStatisticVo.desc.flag",
             @"logisticServiceScore":@"shopScoreStatisticVo.service.score",
             @"logisticServiceScoreLevel":@"shopScoreStatisticVo.service.flag",
             @"serviceAttitudeScore":@"shopScoreStatisticVo.express.score",
             @"serviceAttitudeScoreLevel":@"shopScoreStatisticVo.express.flag",
             @"goodsCount":@"goodsCountVO.total",
             @"hotGoodsCount":@"goodsCountVO.hotSaleAmount",
             @"goodsAddShop":@"goodsCountVO.newSaleAmount",
             @"recShop":@"goodsCountVO.recommendAmount",
             };
}

@end


