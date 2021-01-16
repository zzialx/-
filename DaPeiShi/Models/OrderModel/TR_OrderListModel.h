//
//  TR_OrderListModel.h
//  DaPeiShi
//
//  Created by candy.chen on 2019/1/3.
//  Copyright © 2019年 candy.chen. All rights reserved.
//

#import "TR_Model.h"
#import "TR_OrderGoodsModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface TR_OrderListModel : TR_Model


//我的订单model
@property (copy, nonatomic) NSString *orderId;
@property (copy, nonatomic) NSString *orderNum;
@property (copy, nonatomic) NSString *createDate;
@property (copy, nonatomic) NSString *shopName;
@property (copy, nonatomic) NSString *shopIcon;
@property (copy, nonatomic) NSString *orderSum;
@property (strong, nonatomic) NSArray <TR_OrderGoodsModel *> *orderGoodsList;
@property (copy, nonatomic) NSString *orderStatus;
@property (copy, nonatomic) NSString *expressFee;

@property (copy, nonatomic) NSString *addrDesc;
@property (copy, nonatomic) NSString *addrId;
@property (copy, nonatomic) NSString *buyerId;
@property (copy, nonatomic) NSString *dealDate;
@property (copy, nonatomic) NSString *orderOldSum;
@property (copy, nonatomic) NSString *orderRemark;
@property (copy, nonatomic) NSString *payId;
@property (copy, nonatomic) NSString *sellerId;
@property (copy, nonatomic) NSString *settleType;
@property (copy, nonatomic) NSString *shopId;

@property (copy, nonatomic) NSString *statusDesc;
@property (copy, nonatomic) NSString *expressId;
@property (copy, nonatomic) NSString *expressNum;
@property (copy, nonatomic) NSString *senderAddrId;
@property (copy, nonatomic) NSString * shopStatus; // 店铺状态：0-未营业、1-营业中、2-歇业中、3-停止营业 ,
@property (nonatomic, assign) NSInteger count;
//@property(strong, nonatomic)DiscountModel *couponInfo;
@property(assign, nonatomic)float desStar,expressStar,serviceStar;
@property (copy, nonatomic) NSString *autoReceiveTimeLeft;

@end

NS_ASSUME_NONNULL_END
