//
//  TR_MineKillModel.h
//  DaPeiShi
//
//  Created by admin on 2019/3/14.
//  Copyright © 2019年 candy.chen. All rights reserved.
//

#import "TR_Model.h"

NS_ASSUME_NONNULL_BEGIN

@interface TR_MineKillModel : TR_Model

@property(copy, nonatomic) NSString * afterSaleNum;///<售后单号
@property(copy, nonatomic) NSString * afterSaleStatus; //售后状态：1-待处理、2-拒绝、 3-待卖家确认收货、4-用户换货 （换货待发货）、5-用户换货 （换货待收货）、6-已处理
@property(copy, nonatomic) NSString *expressFee; ///<快递费用
@property(copy, nonatomic) NSString *orderId;//订单编号 ,
@property(copy, nonatomic) NSString *orderNum;//订单编号 ,
@property(copy, nonatomic) NSString *orderSum;//订单总价
@property(copy, nonatomic) NSString *orderTime;
@property(copy, nonatomic) NSString *shopIcon;///<商铺标识 ,
@property(copy, nonatomic) NSString *shopName;///<商铺图标
@property(copy, nonatomic) NSString *orderStatus;///<1-待付款 、3-待发货 、4-待收货 、5-待评价
@property(copy, nonatomic) NSString *secKillId;///<秒杀活动id
@property (copy, nonatomic) NSString *textString;
@property(copy, nonatomic) NSString *goodsIcon;///< 商品图片 ,
@property(copy, nonatomic) NSString *goodsNum;///<购买数量 ,
@property(copy, nonatomic) NSString *goodsOldPrice;///<购买原价 ,
@property(copy, nonatomic) NSString *goodsPrice;///< 购买价格 ,
@property(copy, nonatomic) NSString *goodsTitle ;///< 商品标题 ,
@property(copy, nonatomic) NSString *normDesc;///< 规格名称 ,
@property(copy, nonatomic) NSString *normId;///< 规格标识 ,
@property(copy, nonatomic) NSString *relaId;///< 订单商品标识 ,
@property(copy, nonatomic) NSString *isAdditionalReview;//追评
@property(assign, nonatomic) NSInteger commentLevel;
@property(strong, nonatomic) NSMutableArray *comImgs;
@property(strong, nonatomic) NSMutableArray *upImgs;
@property(assign, nonatomic)float desStar,expressStar,serviceStar;
@property(copy, nonatomic) NSString *seckillPrice; //  秒杀价格
@end


NS_ASSUME_NONNULL_END
