//
//  TR_AfterSalesModel.h
//  DaPeiShi
//
//  Created by candy.chen on 2019/1/8.
//  Copyright © 2019年 candy.chen. All rights reserved.
//

#import "TR_Model.h"
#import "TR_OrderGoodsModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface TR_AfterSalesModel : TR_Model

@property (copy, nonatomic) NSString *afterSaleNum;  //售后单号 ,
@property (copy, nonatomic) NSString *afterSaleType;  //售后类型 0-仅退款，1-退货退款，2-换货 ,
@property (copy, nonatomic) NSString *completeTime;  //售后完成时间 ,
@property (copy, nonatomic) NSString *createTime;  //申请时间 ,
@property (copy, nonatomic) NSString *goodsIcons;  //商品图片(全路径) ,
@property (copy, nonatomic) NSString *goodsId;  // 商品Id ,
@property (copy, nonatomic) NSString *goodsName;//商品名称 ,
@property (copy, nonatomic) NSString *goodsNum;  //数量 ,
@property (copy, nonatomic) NSString *lwstFlag;  // 是否投诉 0-未投诉,1-已投诉 ,
@property (copy, nonatomic) NSString *lwstId;  //投诉Id ,
@property (copy, nonatomic) NSString *normDesc;  //规格 ,
@property (copy, nonatomic) NSString *normId;  // 规格Id ,
@property (copy, nonatomic) NSString *orderNum;  //订单号 ,
@property (copy, nonatomic) NSString *status;  // 1-待处理、2-卖家拒绝、 3-卖家审核通过 4-买家投诉订单, 5-已完成,6-卖家已发货,7-卖家已收货
@property (copy, nonatomic) NSString *goodsSum;//价格

//售后详情添加字段
@property (copy, nonatomic) NSString *handleRes; // 处理结果：0-不同意 1-同意 ,
@property (copy, nonatomic) NSString *handleTime; //  卖家审核时间 ,
@property (copy, nonatomic) NSString *imgPath ; //  图片地址(全路径逗号分隔) ,
@property (copy, nonatomic) NSString *lwstTime; // 投诉时间 ,
@property (copy, nonatomic) NSString *payType; // 退款方式 ,
@property (copy, nonatomic) NSString *problemDesc; // 问题描述 ,
@property (copy, nonatomic) NSString *reason; // 申请售后的原因 ,
@property (assign, nonatomic) double refundMoney; // 退款金额 ,
@property (copy, nonatomic) NSString *sellerDeliverTime; // 换货卖家确认发货时间 ,
@property (copy, nonatomic) NSString *sellerReceiveTime; // 退款卖家确认收货时间 ,
@end

NS_ASSUME_NONNULL_END
