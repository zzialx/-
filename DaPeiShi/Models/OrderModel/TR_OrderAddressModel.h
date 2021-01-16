//
//  TR_OrderAddressModel.h
//  DaPeiShi
//
//  Created by candy.chen on 2019/1/4.
//  Copyright © 2019年 candy.chen. All rights reserved.
//

#import "TR_Model.h"

NS_ASSUME_NONNULL_BEGIN

@interface TR_OrderAddressModel : TR_Model

@property (copy, nonatomic) NSString *addr;
@property (copy, nonatomic) NSString *addressId;
@property (copy, nonatomic) NSString *area;
@property (copy, nonatomic) NSString *areaId;
@property (copy, nonatomic) NSString *cityId;
@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *provinceId;
@property (copy, nonatomic) NSString *telephone;
@property (copy, nonatomic) NSString *userId;
@property (copy, nonatomic) NSString *zip;
@property (copy, nonatomic) NSString *nowAddress; //状态值 1为默认  0为不是默认
@end

NS_ASSUME_NONNULL_END
