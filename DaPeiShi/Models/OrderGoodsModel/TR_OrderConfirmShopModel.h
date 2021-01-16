//
//  TR_OrderShopModel.h
//  DaPeiShi
//
//  Created by isaac on 2019/3/19.
//  Copyright © 2019年 candy.chen. All rights reserved.
//

#import "TR_Model.h"

NS_ASSUME_NONNULL_BEGIN

@interface TR_OrderConfirmShopModel : TR_Model
@property (copy, nonatomic) NSString *expressFee;
@property (copy, nonatomic) NSString *orderNum;
@property (copy, nonatomic) NSString *shopIcon;
@property (copy, nonatomic) NSString *shopId;
@property (copy, nonatomic) NSString *shopName;
@property (copy, nonatomic) NSString *couponMoney;
@property (copy, nonatomic) NSString *shopGoodsSum;
@property (strong,nonatomic) NSArray *goodsList;
@property (copy, nonatomic) NSString *couponId;
@property (copy, nonatomic) NSString *orderRemark;
@end

NS_ASSUME_NONNULL_END
