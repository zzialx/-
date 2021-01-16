//
//  TR_PayResultModel.h
//  DaPeiShi
//
//  Created by candy.chen on 2019/3/27.
//  Copyright © 2019年 candy.chen. All rights reserved.
//

#import "TR_Model.h"

NS_ASSUME_NONNULL_BEGIN

@interface TR_PayResultModel : TR_Model

@property (copy, nonatomic) NSString *payNum;

@property (copy, nonatomic) NSString *payFee;

@end

NS_ASSUME_NONNULL_END
