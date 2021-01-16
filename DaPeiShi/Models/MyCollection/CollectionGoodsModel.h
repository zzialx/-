//
//  CollectionGoodsModel.h
//  XBM
//
//  Created by isaac on 2018/6/12.
//  Copyright © 2018年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CollectionGoodsModel : NSObject
@property (nonatomic, assign) BOOL isSelect;
@property (nonatomic, copy) NSString *realId;
@property (nonatomic, copy) NSString *evaluateNum;
@property (nonatomic, copy) NSString *favoriteNum;
@property (nonatomic, copy) NSString *goodsId;
@property (nonatomic, copy) NSString *goodsTitle;
@property (nonatomic, copy) NSString *goodsStatus;
@property (nonatomic, copy) NSString *maxPrice;
@property (nonatomic, copy) NSString *payNum;
@property (nonatomic, copy) NSString *pic;
@property (nonatomic, copy) NSString *minPrice;
@property (nonatomic, copy) NSString *sign;
@property (copy, nonatomic) NSString *produceFlag;
@property (copy, nonatomic) NSString *killPrice;
@property (copy, nonatomic) NSString *originalPrice;
-(instancetype)initWithDictionary:(NSDictionary *)dic;
@end
