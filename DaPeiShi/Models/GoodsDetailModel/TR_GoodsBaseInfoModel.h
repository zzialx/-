//
//  TR_GoodsBaseInfoModel.h
//  DaPeiShi
//
//  Created by admin on 2019/4/11.
//  Copyright © 2019年 candy.chen. All rights reserved.
//

#import "TR_Model.h"
#import "TR_GoodsAttrsModel.h"
#import "TR_FileModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface TR_GoodsBaseInfoModel : TR_Model

@property(nonatomic,strong)NSArray <TR_GoodsAttrsModel*>* b2cGattrsVals;///<商品属性值
@property(nonatomic,copy)NSString * goodsDesc;///<商品描述
@property(nonatomic,copy)NSString * goodsDetail;///<商品详情
@property(nonatomic,strong)NSArray <TR_FileModel*>* goodsFiles;///<图片
@property(nonatomic,copy)NSString * goodsId;///<商品id
@property(nonatomic,copy)NSString * goodsTitle;///<商品名字
@property(nonatomic,copy)NSString * shopId;///<商铺id
@property(nonatomic,copy)NSString* status;///<店铺状态：0-出售中，1-已下架，2-店铺已下架，3-店铺已删除，4-未上架 ,


@end

NS_ASSUME_NONNULL_END
