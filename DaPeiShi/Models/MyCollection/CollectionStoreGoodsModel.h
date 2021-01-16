//
//  CollectionStoreGoodsModel.h
//  XBM
//
//  Created by isaac on 2018/7/17.
//  Copyright © 2018年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CollectionStoreGoodsModel : NSObject
@property (nonatomic, strong) NSString *picUrl;
@property (nonatomic, strong) NSString *price;
@property (copy, nonatomic) NSString *goodsId;
@property (copy, nonatomic) NSString *maxPrice;
@property (copy, nonatomic) NSString *minPrice;
@property (copy, nonatomic) NSString *produceFlag;
@property (copy, nonatomic) NSString *originalPrice;
@property (copy, nonatomic) NSString *killPrice;
-(instancetype)initWithDictionary:(NSDictionary *)dic;
@end
