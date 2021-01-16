//
//  TR_AuctionDetailModel.h
//  DaPeiShi
//
//  Created by admin on 2019/3/15.
//  Copyright © 2019年 candy.chen. All rights reserved.
//

#import "TR_Model.h"
#import "TR_FileModel.h"
#import "TR_GoodsAttrsModel.h"
NS_ASSUME_NONNULL_BEGIN


@interface TR_AuctionDetailModel : TR_Model
@property(nonatomic,copy)NSString * auctionId;
@property(nonatomic,copy)NSString * auctionName;///<竞拍名称
@property(nonatomic,assign)NSInteger  auctionPeriod;///<竞拍周期
@property(nonatomic,strong)NSNumber * baseRadices;///<加价基数
@property(nonatomic,copy)NSString * canAuction;///<判断是否能竞拍
@property(nonatomic,assign)NSInteger  countAuction;///<出价次数
@property(nonatomic,strong)NSNumber * currentHightPrice;///<当前最高价
@property(nonatomic,copy)NSString * goodsDetail;///<商品详情
@property(nonatomic,copy)NSString * goodsId;///<商品id
@property(nonatomic,copy)NSString * goodsName;///<商品名字
@property(nonatomic,copy)NSString * normDesc;///<规格描述
@property(nonatomic,assign)NSInteger  normId;///<规格id
@property(nonatomic,assign)NSInteger  numberMan;///<报名人数
@property(nonatomic,copy)NSString * onTime;///<上线日期
@property(nonatomic,copy)NSString * shopId;///<商家id
@property(nonatomic,copy)NSString * shopName;///<商家名字
@property(nonatomic,strong)NSNumber*  startPrice;///<起拍价
@property(nonatomic,assign)NSInteger  status;///<竞拍状态
@property(nonatomic,copy)NSString * systemTime;///<当前时间
@property(nonatomic,strong)NSNumber*  userGuaranteeMoney;///<用户保证金
@property(nonatomic,strong)NSNumber*  userHightPrice;///<用户最高报价
@property(nonatomic,strong)NSArray * auctionRecords;///<竞拍记录
@property(nonatomic,strong)NSArray <TR_GoodsAttrsModel*>*b2cGattrsVals;///<规格参数
@property(nonatomic,strong)NSArray <TR_FileModel*>* goodsFiles;///<图片集

@end

@interface TR_DetailParameterModel : TR_Model

@end



NS_ASSUME_NONNULL_END
