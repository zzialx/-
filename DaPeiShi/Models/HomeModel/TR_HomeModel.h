//
//  TR_HomeModel.h
//  DaPeiShi
//
//  Created by candylee on 2019/1/1.
//  Copyright © 2019年 candy.chen. All rights reserved.
//

#import "TR_Model.h"
#import "TR_HomeShowModel.h"
#import "TR_SimpleGoodsModel.h"
@interface TR_HomeModel : TR_Model
@property (strong,nonatomic) NSMutableArray *arrayList;
@property (copy, nonatomic) NSString *floor;
@property (copy, nonatomic) NSString *secKillEndTime;
@property (copy, nonatomic) NSString *secKillNowTime;
-(instancetype)initWithDictionary:(NSDictionary *)dic;
@end
