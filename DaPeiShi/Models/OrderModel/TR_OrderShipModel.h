//
//  TR_OrderShipModel.h
//  DaPeiShi
//
//  Created by candy.chen on 2019/1/4.
//  Copyright © 2019年 candy.chen. All rights reserved.
//

#import "TR_Model.h"

NS_ASSUME_NONNULL_BEGIN

@interface TR_OrderShipModel : TR_Model

@property (copy, nonatomic) NSString *createTime;
@property (copy, nonatomic) NSString *creator;
@property (copy, nonatomic) NSString *expressId;
@property (copy, nonatomic) NSString *expressName;
@property (copy, nonatomic) NSString *expressNum;
@property (copy, nonatomic) NSString *orderId;
@property (copy, nonatomic) NSString *senderAddrDesc;
@property (copy, nonatomic) NSString *senderAddId;
@property (copy, nonatomic) NSString *shipId;
@property (copy, nonatomic) NSString *status;

@end

NS_ASSUME_NONNULL_END
