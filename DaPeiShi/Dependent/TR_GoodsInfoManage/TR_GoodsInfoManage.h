//
//  TR_GoodsInfoManage.h
//  DaPeiShi
//
//  Created by admin on 2019/3/21.
//  Copyright © 2019年 candy.chen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TR_GoodsInfoModel.h"
NS_ASSUME_NONNULL_BEGIN


@interface TR_GoodsInfoManage : NSObject

@property(nonatomic,strong)TR_GoodsInfoModel * goodsInfo;

+(TR_GoodsInfoManage*)shareGoodsInfoManage;

@end

NS_ASSUME_NONNULL_END
