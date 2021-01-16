//
//  TR_SimpleGoodsModel.m
//  DaPeiShi
//
//  Created by admin on 2019/1/22.
//  Copyright © 2019年 candy.chen. All rights reserved.
//

#import "TR_SimpleGoodsModel.h"

@implementation TR_SimpleGoodsModel
+(NSDictionary *)modelCustomPropertyMapper
{
    return @{@"configPicUrl":@[@"pic",@"picUrl",@"configPicUrl"]};
}
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{};
}
@end
