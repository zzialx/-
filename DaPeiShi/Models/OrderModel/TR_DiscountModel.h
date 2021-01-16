//
//  TR_DiscountModel.h
//  DaPeiShi
//
//  Created by candy.chen on 2019/1/4.
//  Copyright © 2019年 candy.chen. All rights reserved.
//

#import "TR_Model.h"

NS_ASSUME_NONNULL_BEGIN

@interface TR_DiscountModel : TR_Model

@property (copy, nonatomic) NSString *beginTime;
@property (copy, nonatomic) NSString *couponId;///<优惠券id
@property (copy, nonatomic) NSString *couponMoney;
@property (copy, nonatomic) NSString *couponName;
@property (copy, nonatomic) NSString *endTime;
@property (copy, nonatomic) NSString *feeLimit;
@property (copy, nonatomic) NSString *note;
@property (copy, nonatomic) NSString *receiveSign;
@property (copy, nonatomic) NSString *shopId;
@property (copy, nonatomic) NSString *contact;
@property (copy, nonatomic) NSString *shopName;
@property (copy, nonatomic) NSString *goodsTypeIds;
@property (assign, nonatomic)NSInteger count;
@property(assign, nonatomic) BOOL showDetail;
@property(assign, nonatomic) BOOL isSelect;
@property (copy, nonatomic) NSString *useScope;

@end

NS_ASSUME_NONNULL_END
