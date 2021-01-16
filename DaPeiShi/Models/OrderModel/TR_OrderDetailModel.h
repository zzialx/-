//
//  TR_OrderDetailModel.h
//  DaPeiShi
//
//  Created by candy.chen on 2019/1/4.
//  Copyright © 2019年 candy.chen. All rights reserved.
//

#import "TR_Model.h"
#import "TR_PayDetailModel.h"
#import "TR_DiscountModel.h"
#import "TR_OrderAddressModel.h"
#import "TR_OrderShipModel.h"
#import "TR_OrderGoodsModel.h"
#import "TR_OrderListModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface TR_OrderDetailModel : TR_Model

@property (strong, nonatomic) NSArray <
TR_OrderGoodsModel *> *goodsModel;

@property (copy, nonatomic) NSString * addr; //地址
@property (copy, nonatomic) NSString * configPicUrl; // 图片服务器地址 ,
@property (copy, nonatomic) NSString * createDate; // 生成订单时间 ,
@property (copy, nonatomic) NSString * dealDate; // 完成时间 ,
@property (copy, nonatomic) NSString * expressFee; // 物流费 ,
@property (copy, nonatomic) NSString * expressName; // 发货方式、配送方式 ,
@property (copy, nonatomic) NSString * expressNum; // 物流单号 ,
@property (copy, nonatomic) NSString * freeFee; // 优惠金额 ,
@property (copy, nonatomic) NSString * getGoodsTime; // 收货时间 ,
@property (copy, nonatomic) NSString * goodsSum; // 商品总额 ,
@property (copy, nonatomic) NSString * name; // 收货人 ,
@property (copy, nonatomic) NSString * orderNum; // 订单号 ,
@property (copy, nonatomic) NSString * afterSaleNum;//售后号
@property (copy, nonatomic) NSString * orderRemark; // 备注 ,
@property (copy, nonatomic) NSString * payFee; //实付金额 ,
@property (copy, nonatomic) NSString * payTime; // 付款时间 ,
@property (copy, nonatomic) NSString * payType; // 支付方式 ,
@property (copy, nonatomic) NSString * putGoodsTime; // 发货时间 ,
@property (copy, nonatomic) NSString * shopIcon; // 店标ICON ,
@property (copy, nonatomic) NSString * shopId; // 店铺Id 
@property (copy, nonatomic) NSString * shopName; // 店铺名称 ,
@property (copy, nonatomic) NSString * showNum; //显示状态个数 ,
@property (copy, nonatomic) NSString * status; //订单状态:1.待付款 2.订单关闭 3.待发货 4.待收货 5.待评价 6.订单删除 7.交易完成 ,
@property (copy, nonatomic) NSString * statusDesc; // 订单状态描述 ,
@property (copy, nonatomic) NSString * telephone; // 手机号
@property (copy, nonatomic) NSString * shopStatus; // 店铺状态：0-未营业、1-营业中、2-歇业中、3-停止营业 ,
@property(assign, nonatomic)float desStar,expressStar,serviceStar;
@property (copy, nonatomic) NSString *autoConfirmTake;

@end

NS_ASSUME_NONNULL_END
