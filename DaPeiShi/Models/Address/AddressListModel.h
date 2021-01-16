//
//  AddressListModel.h
//  TeaExchange
//
//  Created by isaac on 2018/3/27.
//  Copyright © 2018年 isaac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AddressListModel : NSObject
@property (nonatomic, copy) NSString *addr;
@property (nonatomic, copy) NSString *addressId;
@property (nonatomic, copy) NSString *area;
@property (nonatomic, copy) NSString *areaId;
@property (nonatomic, copy) NSString *cityId;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *provinceId;
@property (nonatomic, copy) NSString *telephone;
@property (nonatomic, copy) NSString *userId;
@property (nonatomic, copy) NSString *zip;
@property (nonatomic, copy) NSString *nowAddress; //状态值 1为默认  0为不是默认
@property (copy, nonatomic) NSString *areaName;
@property (copy, nonatomic) NSString *cityName;
@property (copy, nonatomic) NSString *provinceName;
@property (copy, nonatomic) NSString *status;
-(instancetype)initWithDictionary:(NSDictionary *)dic;
@end
