//
//  TR_OrderGoodsModel.h
//  DaPeiShi
//
//  Created by candy.chen on 2019/1/3.
//  Copyright © 2019年 candy.chen. All rights reserved.
//

#import "TR_Model.h"

NS_ASSUME_NONNULL_BEGIN

@interface TR_OrderGoodsModel : TR_Model

@property (copy, nonatomic) NSString *goodsIcon;//商品图标（全路径
@property (copy, nonatomic) NSString *goodsTitle;// 商品名称 ,
@property (copy, nonatomic) NSString *goodsPrice;// 商品价格 ,
@property (copy, nonatomic) NSString *normDesc;//商品规格
@property (copy, nonatomic) NSString *goodsNum;//商品数量 ,
@property (copy, nonatomic) NSString *handleRes;//售后处理结果：0-不同意 1-同意 ,
@property (copy, nonatomic) NSString *lwstFlag;//用户是否投诉 0-未投诉，1-投诉 ,
@property (copy, nonatomic) NSString *normId;//商品规格Id
@property (copy, nonatomic) NSString *isAdditionalReview;// 是否已追评 ,
@property (copy, nonatomic) NSString *isReview;// 是否已评价

@property (copy, nonatomic) NSString *afterStatus;// 售后单状态：0-未申请售后、1-待处理、2-拒绝、 3-用户退货退款 -待卖家确认收货（用户已发货）、4-用户换货 （换货卖家待发货）、5-用户换货 （换货待买家收货-卖家已发货）、6-已处理 ,
@property (copy, nonatomic) NSString *afterStatusDesc;// 售后单状态描述：0-未申请售后、1-待处理、2-拒绝、 3-用户退货退款 -待卖家确认收货（用户已发货）、4-用户换货 （换货卖家待发货）、5-用户换货 （换货待买家收货-卖家已发货）、6-已处理 ,

@property (copy, nonatomic) NSString *afterSaleNum;//售后单号
@property (copy, nonatomic) NSString *textString;
@property (copy, nonatomic) NSString *dictKey;
@property (copy, nonatomic) NSString *dictValue;
@property (copy, nonatomic) NSString *goods;
@property (copy, nonatomic) NSString *goodsId;
@property (copy, nonatomic) NSString *goodsOldPrice;
@property (copy, nonatomic) NSString *goodsSum;
@property (copy, nonatomic) NSString *orderId;
@property (copy, nonatomic) NSString *relaId;
@property(assign, nonatomic) NSInteger commentLevel;
@property (copy, nonatomic) NSString *filePath;
@property(strong, nonatomic) NSMutableArray *comImgs;
@property(strong, nonatomic) NSMutableArray *upImgs;
@property(strong, nonatomic) NSString *comText;

- (instancetype)init;
@end

NS_ASSUME_NONNULL_END
