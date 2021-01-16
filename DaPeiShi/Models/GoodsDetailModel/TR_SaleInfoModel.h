//
//  TR_SaleInfoModel.h
//  DaPeiShi
//
//  Created by admin on 2019/4/11.
//  Copyright © 2019年 candy.chen. All rights reserved.
//

#import "TR_Model.h"
#import "TR_DiscountModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface TR_SaleInfoModel : TR_Model
@property(nonatomic,copy)NSString* expressFee ;///<物流费用 ,
@property(nonatomic,strong)NSArray<TR_DiscountModel*> * goodsCouponLst;///<优惠券列表
@property(nonatomic,copy)NSString* maxPrice ;///< 最高价格 ,
@property(nonatomic,copy)NSString* minPrice ;///<最低价格 ,
@property(nonatomic,assign)NSInteger monthSales ;///<月销量 ,
@property(nonatomic,copy)NSString* pointRule ;///<积分规则 ,
@property(nonatomic,copy)NSString* service;///< 服务 ,
@property(nonatomic,assign)NSInteger totalStock ;///<库存

@end

NS_ASSUME_NONNULL_END
