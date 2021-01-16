//
//  TR_SearchGoodsModel.h
//  DaPeiShi
//
//  Created by admin on 2019/4/9.
//  Copyright © 2019年 candy.chen. All rights reserved.
//

#import "TR_Model.h"

NS_ASSUME_NONNULL_BEGIN

@interface TR_SearchGoodsModel : TR_Model

@property(nonatomic,copy)NSString * configPicUrl;
@property(nonatomic,copy)NSString * filePath;
@property(nonatomic,copy)NSString * goodsTitle;
@property(nonatomic,copy)NSString * originalPrice;
@property(nonatomic,copy)NSString * goodsId;
@property(nonatomic,copy)NSString *normPrice;
@property(nonatomic,copy)NSString *killPrice;
@property(nonatomic,copy)NSString * maxPrice;///<最高价/原价 ,
@property(nonatomic,copy)NSString * minPrice;///< 最低价/秒杀价 ,
@property(nonatomic,copy)NSString * produceFlag;///<是否秒杀 0 普通商品 1 秒杀商品

@end

NS_ASSUME_NONNULL_END
