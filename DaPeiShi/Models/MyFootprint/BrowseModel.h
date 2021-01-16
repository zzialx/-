//
//  BrowseModel.h
//  XBM
//
//  Created by isaac on 2018/6/26.
//  Copyright © 2018年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BrowseModel : NSObject
@property (nonatomic, assign) BOOL isSelect;
@property (nonatomic, strong) NSString *realId;
@property (nonatomic, strong) NSString *evaluateNum;
@property (nonatomic, strong) NSString *favoriteNum;
@property (nonatomic, strong) NSString *goodsId;
@property (nonatomic, strong) NSString *goodsStatus;
@property (nonatomic, strong) NSString *goodsTitle;
@property (nonatomic, strong) NSString *payNum;
@property (nonatomic, strong) NSString *pic;
@property (copy, nonatomic) NSString *minPrice;
@property (copy, nonatomic) NSString *collectionSign;
@property (copy, nonatomic) NSString *produceFlag;
@property (copy, nonatomic) NSString *maxPrice;
@property (copy, nonatomic) NSString *originalPrice;
@property (copy, nonatomic) NSString *killPrice;
-(instancetype)initWithDictionary:(NSDictionary *)dic;
@end
