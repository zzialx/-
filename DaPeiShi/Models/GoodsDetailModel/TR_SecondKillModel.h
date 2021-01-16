//
//  TR_SecondKillModel.h
//  DaPeiShi
//
//  Created by admin on 2019/4/11.
//  Copyright © 2019年 candy.chen. All rights reserved.
//

#import "TR_Model.h"

NS_ASSUME_NONNULL_BEGIN

@interface TR_SecondKillModel : TR_Model
@property(nonatomic,copy)NSString* currentTime ;///<系统时间 ,
@property(nonatomic,copy)NSString* onTime ;///<上线时间 ,
@property(nonatomic,assign)NSInteger secKillId ;///< 秒杀活动id ,
@property(nonatomic,assign)NSInteger secKillPeriod ;///< 秒杀周期(小时)
@property(nonatomic,copy)NSString* saleRate ;///<出售率 ,

@end

NS_ASSUME_NONNULL_END
