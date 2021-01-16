//
//  TR_MineAuctionModel.h
//  DaPeiShi
//
//  Created by admin on 2019/3/25.
//  Copyright © 2019年 candy.chen. All rights reserved.
//

#import "TR_Model.h"

NS_ASSUME_NONNULL_BEGIN

@interface TR_MineAuctionModel : TR_Model

@property(nonatomic, assign)NSInteger  auctionId;///<竞拍id
@property(nonatomic, assign)NSInteger  goodsId;///<商品id
@property(nonatomic, copy)NSString * goodsTitle;///<商品名称
@property(nonatomic,strong)NSNumber *  guaranteeMoney;///<保证金金额
@property(nonatomic,strong)NSNumber *  maxPrice;///<最高价
@property(nonatomic, copy)NSString * normPic;///<商品图片
@property(nonatomic, assign)NSInteger  orderId;///<订单id
@property(nonatomic, assign)NSInteger  status;///<状态  0-竞拍中 1-竞拍失败 2-竞拍成功 3-违约 4-完成 5-删除
@property(nonatomic, assign)NSInteger  userAuctionId;///<用户竞拍id
@property(nonatomic,strong)NSNumber * startPrice;///<起拍价
@property(nonatomic,strong)NSNumber *price;///<成交价
@property(nonatomic, copy)NSString *orderStatus;///<订单状态 1-待付款、 2-订单关闭、3-待发货、4-待收货、5-待评价、6-订单删除、7-交易完成
@end

NS_ASSUME_NONNULL_END
