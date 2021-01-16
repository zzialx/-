//
//  TR_GoodsInfoModel.h
//  DaPeiShi
//
//  Created by admin on 2019/3/18.
//  Copyright © 2019年 candy.chen. All rights reserved.
//

#import "TR_Model.h"
#import "TR_FileModel.h"
#import "TR_NormalModel.h"
#import "TR_GoodsAttrsModel.h"
#import "TR_DiscountModel.h"
#import "TR_SaleInfoModel.h"
#import "TR_SecondKillModel.h"
#import "TR_GoodsBaseInfoModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface TR_GoodsInfoModel : TR_Model

//@property(nonatomic,strong)NSNumber * fee;///<物流费用
//@property(nonatomic,strong)NSNumber * expressFee;///<物流费用
//@property(nonatomic,copy)NSString * goodsName;///<商品名字
//@property(nonatomic,copy)NSString * goodsPic;///<商品主图
//@property(nonatomic,copy)NSString * maxSecPrice;///<最大秒杀价
//@property(nonatomic,copy)NSString * maxprice;///<秒杀商品：现价    普通商品：最高价
//@property(nonatomic,copy)NSString * minPrice;///<秒杀商品：原价   普通商品：最低价
//@property(nonatomic,copy)NSString * price;
//@property(nonatomic,copy)NSString * minSecPrice;///<秒杀价
//@property(nonatomic,assign)NSInteger  monthSales;///<月销量
//@property(nonatomic,copy)NSString * onTime;///<上线时间
//@property(nonatomic,assign)NSInteger  secKillId;///<秒杀活动id
//@property(nonatomic,copy)NSString * shopId;///<商品id
//@property(nonatomic,copy)NSString * systemTime;///<系统时间
//@property(nonatomic,assign)NSInteger  stock;///<商品库存
//@property(nonatomic,assign)NSInteger  total;///<商品总量
//@property(nonatomic,copy)NSString * service;///<服务
//@property(nonatomic,copy)NSString * pointRule;///<积分规则
//@property(nonatomic,copy)NSString* status;///<店铺状态：0-出售中，1-已下架，2-店铺已下架，3-店铺已删除，4-未上架 ,
//@property(nonatomic,assign)NSInteger secKillPeriod;///<周期（小时）
//@property(nonatomic,strong)NSArray<TR_DiscountModel*> * shopCouponLst;///<优惠券列表

//新接口
@property(nonatomic,copy)NSString*  collectionSign;///<Y代表未收藏 N代表已收藏
@property(nonatomic,strong)NSArray <TR_NormalModel*>* goodsNormInfoLst;///<详情规格
@property(nonatomic,strong)TR_SecondKillModel * secKillActInfo;///<秒杀信息
@property(nonatomic,strong)TR_SaleInfoModel * saleInfo;///<出售信息
@property(nonatomic,strong)TR_GoodsBaseInfoModel * goodsInfo;///<商品信息
@property(nonatomic,strong)TR_NormalModel *selectModel;///<选中的规格
@property(nonatomic,assign)BOOL isSecondKill;///<是否秒杀

@end

NS_ASSUME_NONNULL_END
