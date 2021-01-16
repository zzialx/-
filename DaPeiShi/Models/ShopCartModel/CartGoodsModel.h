//
//  CartGoodsModel.h
//  XBM
//
//  Created by isaac on 2018/6/8.
//  Copyright © 2018年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CartGoodsModel : NSObject
@property (nonatomic, assign) BOOL isSelect;
@property (nonatomic, copy) NSString *productNum;
@property (nonatomic, copy) NSString *whetherOnShelf;
@property (nonatomic, copy) NSString *picUrl;
@property (nonatomic, copy) NSString *goodsId;
@property (nonatomic, copy) NSString *goodsTitle;
@property (nonatomic, copy) NSString *normDesc;
@property (copy, nonatomic) NSString *normId;
@property (nonatomic, copy) NSString *price;
@property (copy, nonatomic) NSString *priceSum;
@property (copy, nonatomic) NSString *status;
@property (copy, nonatomic) NSString *collectionStatus;
-(instancetype)initWithDictionary:(NSDictionary *)dic;
@end
