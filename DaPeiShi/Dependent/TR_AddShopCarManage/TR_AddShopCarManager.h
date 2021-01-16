//
//  TR_AddShopCarManager.h
//  DaPeiShi
//
//  Created by admin on 2019/3/20.
//  Copyright © 2019年 candy.chen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TR_GoodsInfoModel.h"


NS_ASSUME_NONNULL_BEGIN

@interface TR_AddShopCarManager : NSObject

+ (TR_AddShopCarManager *)sharedManager;

- (void)addShopCarWithGoodsModel:(TR_GoodsInfoModel*)model completionBlock:(BoolBlock)block;
@end

NS_ASSUME_NONNULL_END
