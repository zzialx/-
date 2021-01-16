//
//  TR_SeconkillModel.h
//  DaPeiShi
//
//  Created by admin on 2019/3/14.
//  Copyright © 2019年 candy.chen. All rights reserved.
//

#import "TR_Model.h"

NS_ASSUME_NONNULL_BEGIN

@interface TR_SeconkillModel : TR_Model

@property(nonatomic,copy)NSString * goodsId;
@property(nonatomic,copy)NSString * goodsName;
@property(nonatomic,copy)NSString * goodsPic;
@property(nonatomic,copy)NSString * oldPrice;
@property(nonatomic,copy)NSString * price;
@property(nonatomic,copy)NSString * secKillId;
@property(nonatomic,assign)NSInteger  total;
@property(nonatomic,assign)NSInteger  stock;
@property (copy, nonatomic) NSString *goodsStatus;
@end

@interface TR_SeconTimeModel : TR_Model

@property(nonatomic,copy)NSString * time;
@property(nonatomic,copy)NSString * killState;

@end
NS_ASSUME_NONNULL_END
