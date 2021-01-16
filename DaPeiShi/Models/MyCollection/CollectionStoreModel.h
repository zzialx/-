//
//  CollectionStoreModel.h
//  XBM
//
//  Created by isaac on 2018/6/12.
//  Copyright © 2018年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CollectionStoreModel : NSObject
@property (nonatomic, assign) BOOL isSelect;
@property (nonatomic, retain) NSString *collectionId;
@property (nonatomic, retain) NSString *collectionNum;
@property (nonatomic, retain) NSString *multiScore;
@property (nonatomic, retain) NSString *saleNum;
@property (nonatomic, retain) NSString *shopIcon;
@property (nonatomic, retain) NSString *shopName;
@property (nonatomic, retain) NSString *shopId;
@property (nonatomic, retain) NSMutableArray *pic;
-(instancetype)initWithDictionary:(NSDictionary *)dic;
@end
