//
//  TR_GoodsBaseInfoModel.m
//  DaPeiShi
//
//  Created by admin on 2019/4/11.
//  Copyright © 2019年 candy.chen. All rights reserved.
//

#import "TR_GoodsBaseInfoModel.h"

@implementation TR_GoodsBaseInfoModel
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"goodsFiles" : [TR_FileModel class],
                    @"b2cGattrsVals":[TR_GoodsAttrsModel class]
                    };
}
@end
