//
//  TR_AuctionModel.h
//  DaPeiShi
//
//  Created by admin on 2019/3/11.
//  Copyright © 2019年 candy.chen. All rights reserved.
//

#import "TR_Model.h"

NS_ASSUME_NONNULL_BEGIN

@interface TR_AuctionModel : TR_Model

@property(nonatomic,copy)NSString * auctionId;///<竞拍id
@property(nonatomic,copy)NSString * auctionPeriod;///<拍卖周期
@property(nonatomic,copy)NSString * bidCount;
@property(nonatomic,copy)NSString * currentHightPrice;
@property(nonatomic,copy)NSString * goodsName;
@property(nonatomic,copy)NSString * goodsPic;
@property(nonatomic,copy)NSString * startPrice;
@property(nonatomic,copy)NSString * status;///<状态：、1-待竞拍(审核通过) 、3-竞拍中、、6-竞拍中止、7-竞拍结束

@end


@interface TR_AuctionTypeModel : TR_Model

@property(nonatomic,copy)NSString * typeId;
@property(nonatomic,copy)NSString * typeName;

@end


NS_ASSUME_NONNULL_END
