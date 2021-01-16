//
//  TR_ShopDetailModel.h
//  DaPeiShi
//
//  Created by admin on 2019/1/22.
//  Copyright © 2019年 candy.chen. All rights reserved.
//

#import "TR_Model.h"
#import "TR_ShopGoodsModel.h"
#import "TR_HomeShowModel.h"
#import "TR_DiscountModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface TR_ShopDetailModel : TR_Model

@property(nonatomic,assign) NSInteger  shopId;
@property(nonatomic,copy) NSString * shopIcon;
@property(nonatomic,copy) NSString * shopName;
@property(nonatomic,assign) NSInteger collectAmount;///<关注人数
@property(nonatomic,copy) NSString * collectSign;
@property(nonatomic,strong)NSArray <TR_DiscountModel*>* shopCouponLst;///<优惠券列表
@property(nonatomic,strong)NSArray <TR_BannerModel*>  *  bannerLst;///<banner条列表
@property(nonatomic,strong)NSArray <TR_ShopGoodsModel*> * newestLst;///<新品上架
@property(nonatomic,strong)NSArray <TR_ShopGoodsModel*> * hotLst;///<新品上架
@property(nonatomic,strong)NSArray <TR_ShopGoodsModel*> * recommendLst;///<新品上架

@end

NS_ASSUME_NONNULL_END
