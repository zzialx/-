//
//  TR_GoodsModel.h
//  DaPeiShi
//
//  Created by apple on 2019/1/2.
//  Copyright © 2019年 candy.chen. All rights reserved.
//

#import "TR_Model.h"
#import "TR_FileModel.h"
#import "TR_GoodsAttrsModel.h"
#import "TR_NormalModel.h"
@interface TR_GoodsModel : TR_Model
@property(nonatomic,strong)NSString *goodsId;
@property(nonatomic,strong)NSString *goodName;
@property(nonatomic,strong)NSString *price;
@property(nonatomic,strong)NSString *url;
@property(nonatomic,strong)NSString *brandId;
@property(nonatomic,strong)NSString *goodsTitle;
@property(nonatomic,strong)NSString *typeId;
@property(nonatomic,strong)NSString *typeName;
@property(nonatomic,strong)NSString *brandName;
@property(nonatomic,strong)NSString *shopId;
@property(nonatomic,strong)NSString *shopName;
@property(nonatomic,strong)NSString *logisticsId;
@property(nonatomic,strong)NSString *nFlag;
@property(nonatomic,strong)NSString *holds;
@property(nonatomic,strong)NSString *hotFlag;
@property(nonatomic,strong)NSString *onsaleFlag;
@property(nonatomic,strong)NSString *status;
@property(nonatomic,strong)NSString *goodsDetail;
@property(nonatomic,strong)NSString *goodsScore;
@property(nonatomic,strong)NSString *minPrice;
@property(nonatomic,strong)NSString *maxPrice;
@property(nonatomic,strong)NSString *comments;
@property(nonatomic,strong)NSString *buyerScoreSum;
@property(nonatomic,strong)NSString *soldCounts;
@property(nonatomic,strong)NSString *salesVolume;
@property(nonatomic,strong)NSString *logisticsFee;
@property(nonatomic,strong)NSString *pic;
@property(nonatomic,strong)NSArray <TR_FileModel *>*fileList;
@property(nonatomic,strong)NSArray<TR_NormalModel *> *normList;
@property(nonatomic,strong)NSString *orderBy;
@property(nonatomic,strong)TR_NormalModel *selectModel;
@property(nonatomic,assign)BOOL isCollected;
@property(nonatomic,strong)NSString *filePath;
@property(nonatomic,strong)NSString *goodsPic;
@property(nonatomic,strong)NSString *goodsPrice;
@property(nonatomic,strong)NSArray<TR_GoodsAttrsModel *> *gattrsValList;
@property(nonatomic,copy)NSString* produceFlag;///<秒杀商品 ，0-普通 ,1-秒杀
@property(nonatomic,strong)NSString * killPrice;///<秒杀价
@property(nonatomic,strong)NSString *originalPrice;///<原价
@end
