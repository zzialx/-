//
//  TR_DiscountListModel.h
//  DaPeiShi
//
//  Created by isaac on 2019/3/14.
//  Copyright © 2019年 candy.chen. All rights reserved.
//

#import "TR_Model.h"

NS_ASSUME_NONNULL_BEGIN

@interface TR_DiscountListModel : TR_Model
@property (copy, nonatomic) NSString *beginTime;
@property (copy, nonatomic) NSString *count;
@property (copy, nonatomic) NSString *couponId;
@property (copy, nonatomic) NSString *couponMoney;
@property (copy, nonatomic) NSString *couponName;
@property (copy, nonatomic) NSString *couponType;
@property (copy, nonatomic) NSString *endTime;
@property (copy, nonatomic) NSString *feeLimit;
@property (copy, nonatomic) NSString *flag;
@property (copy, nonatomic) NSString *shopId;
@property (copy, nonatomic) NSString *shopName;
@property (copy, nonatomic) NSString *total;
@property (copy, nonatomic) NSString *useFulType;
@property (copy, nonatomic) NSString *useScope;
@property (copy, nonatomic) NSString *tab;
@property (copy, nonatomic) NSString *userCouponId;
@property (assign, nonatomic) BOOL isSelect;
@end

NS_ASSUME_NONNULL_END
