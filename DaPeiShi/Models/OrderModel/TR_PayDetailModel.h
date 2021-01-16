//
//  TR_PayDetailModel.h
//  DaPeiShi
//
//  Created by candy.chen on 2019/1/4.
//  Copyright © 2019年 candy.chen. All rights reserved.
//

#import "TR_Model.h"

NS_ASSUME_NONNULL_BEGIN

@interface TR_PayDetailModel : TR_Model

@property (strong, nonatomic) NSString *createTime;
@property (strong, nonatomic) NSString *payFee;
@property (strong, nonatomic) NSString *payId;
@property (strong, nonatomic) NSString *payNum;
@property (strong, nonatomic) NSString *payTime;
@property (strong, nonatomic) NSString *payType;
@property (strong, nonatomic) NSString *payorId;
@property (strong, nonatomic) NSString *status;
@property (strong, nonatomic) NSString *thirdPayNum;

@end

NS_ASSUME_NONNULL_END
