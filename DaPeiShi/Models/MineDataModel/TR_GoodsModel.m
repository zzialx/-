//
//  TR_GoodsModel.m
//  DaPeiShi
//
//  Created by apple on 2019/1/2.
//  Copyright © 2019年 candy.chen. All rights reserved.
//

#import "TR_GoodsModel.h"

@implementation TR_GoodsModel
+(NSDictionary  *)modelCustomPropertyMapper{
    return @{@"nFlag":@"newFlag",@"price":@[@"normPrice",@"price"],@"filePath":@[@"filePath",@"pic"]};
}

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"fileList" : [TR_FileModel class],
             @"normList" : [TR_NormalModel class],@"gattrsValList":[TR_GoodsAttrsModel class]};
}
@end
