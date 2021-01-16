//
//  TR_NormalModel.h
//  DaPeiShi
//
//  Created by apple on 2019/1/7.
//  Copyright © 2019年 candy.chen. All rights reserved.
//

#import "TR_Model.h"

@interface TR_NormalModel : TR_Model
@property(nonatomic,strong)NSString *normId;///<规格id
@property(nonatomic,strong)NSString *normDesc;
@property(nonatomic,strong)NSString * killPrice;///<秒杀价
@property(nonatomic,strong)NSString *normPic;
@property(nonatomic,strong)NSString *originalPrice;///<原价
@property(nonatomic,strong)NSString *produceFlag;///<0-普通商品、1-秒杀商品 ,
@property(nonatomic,strong)NSString * stock;///<库存
@property(nonatomic,strong)NSString * minKillPriceFlag;
@property(nonatomic,assign)int selectCount;///<选中的数量
@end
