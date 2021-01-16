//
//  CartHeaderModel.h
//  XBM
//
//  Created by isaac on 2018/6/8.
//  Copyright © 2018年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CartHeaderModel : NSObject
@property (nonatomic, assign) BOOL isSelect;
@property (copy, nonatomic) NSString *coupon;
@property (copy, nonatomic) NSString *priceShopSum;
@property (nonatomic, copy) NSString *shopIcon;
@property (nonatomic, copy) NSString *shopId;
@property (nonatomic, copy) NSString *shopName;
@property (nonatomic, retain) NSMutableArray *cartInfo;
@property(nonatomic,strong)NSMutableArray *selectList;
-(instancetype)initWithDictionary:(NSDictionary *)dic;
@end
