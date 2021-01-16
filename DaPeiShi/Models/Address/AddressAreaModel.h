//
//  AddressAreaModel.h
//  TeaExchange
//
//  Created by isaac on 2018/3/28.
//  Copyright © 2018年 isaac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AddressAreaModel : NSObject

@property (nonatomic, copy) NSString *pid;
@property (nonatomic, copy) NSString *addressId;
@property (nonatomic, copy) NSString *areaId;
@property (nonatomic, copy) NSString *name;
@property (copy, nonatomic) NSString *pinyin;
@property (nonatomic, assign) BOOL isSelect;
-(instancetype)initWithDictionary:(NSDictionary *)dic;
@end
