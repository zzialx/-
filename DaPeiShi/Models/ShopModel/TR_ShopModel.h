//
//  TR_ShopModel.h
//  DaPeiShi
//
//  Created by admin on 2019/1/22.
//  Copyright © 2019年 candy.chen. All rights reserved.
//

#import "TR_Model.h"

NS_ASSUME_NONNULL_BEGIN

@interface TR_ShopModel : TR_Model

@property(nonatomic,copy) NSString * shopId;
@property(nonatomic,copy) NSString * shopIcon;
@property(nonatomic,copy) NSString * shopName;
@property(nonatomic,copy) NSString * collectAmount;///<关注人数
@property(nonatomic,copy) NSString * collectSign;///<是否关注
@property(nonatomic,copy) NSString * addr;
@property(nonatomic,copy) NSString * area;
@property(nonatomic,copy) NSString * shopContent;///<店铺简介

@property(nonatomic,copy) NSString * shopScore;///<综合评分
@property(nonatomic,copy) NSString * goodsCount;///<商品总数
@property(nonatomic,copy) NSString * hotGoodsCount;///<热销单品数量
@property(nonatomic,copy) NSString * goodsAddShop;///<新品数量
@property(nonatomic,copy) NSString * recShop;///<店铺推荐
@property(nonatomic,copy) NSString * shopDescribeScore;///<描述相符
@property(nonatomic,copy) NSString * shopDescribeScoreLevel;///<描述相符

@property(nonatomic,copy) NSString * logisticServiceScore;///<物流服务
@property(nonatomic,copy) NSString * logisticServiceScoreLevel;///<描述相符

@property(nonatomic,copy) NSString * serviceAttitudeScore;///<服务态度
@property(nonatomic,copy) NSString * serviceAttitudeScoreLevel;///<描述相符

@end

@interface TR_ScoreModel : TR_Model

@end


NS_ASSUME_NONNULL_END
