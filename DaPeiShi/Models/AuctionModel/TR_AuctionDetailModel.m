//
//  TR_AuctionDetailModel.m
//  DaPeiShi
//
//  Created by admin on 2019/3/15.
//  Copyright © 2019年 candy.chen. All rights reserved.
//

#import "TR_AuctionDetailModel.h"

@implementation TR_AuctionDetailModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    
    return @{@"b2cGattrsVals":[TR_GoodsAttrsModel class],@"goodsFiles":[TR_FileModel class]};
}

@end

@implementation TR_DetailParameterModel



@end


