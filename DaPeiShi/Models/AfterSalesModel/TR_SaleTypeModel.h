//
//  TR_SaleTypeModel.h
//  DaPeiShi
//
//  Created by candy.chen on 2019/1/16.
//  Copyright © 2019年 candy.chen. All rights reserved.
//

#import "TR_Model.h"

NS_ASSUME_NONNULL_BEGIN

@interface TR_SaleTypeModel : TR_Model

@property(copy, nonatomic) NSString *dictKey;

@property(copy, nonatomic) NSString *dictValue;

@property(copy, nonatomic) NSString *isSelect;

@end

NS_ASSUME_NONNULL_END
