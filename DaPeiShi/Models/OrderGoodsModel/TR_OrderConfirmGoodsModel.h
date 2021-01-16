//
//  TR_OrderGoodsModel.h
//  DaPeiShi
//
//  Created by isaac on 2019/3/19.
//  Copyright © 2019年 candy.chen. All rights reserved.
//

#import "TR_Model.h"

NS_ASSUME_NONNULL_BEGIN

@interface TR_OrderConfirmGoodsModel : TR_Model
@property (copy, nonatomic) NSString *expressFee;
@property (copy, nonatomic) NSString *filePath;
@property (copy, nonatomic) NSString *goodsNum;
@property (copy, nonatomic) NSString *goodsPrice;
@property (copy, nonatomic) NSString *goodsPriceSum;
@property (copy, nonatomic) NSString *goodsTitle;
@property (copy, nonatomic) NSString *normDesc;
@property (copy, nonatomic) NSString *normId;
@property (copy, nonatomic) NSString *secKillId;
@end

NS_ASSUME_NONNULL_END
