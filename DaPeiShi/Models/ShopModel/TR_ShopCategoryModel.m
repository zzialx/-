//
//  TR_ShopCategoryModel.m
//  DaPeiShi
//
//  Created by admin on 2019/1/23.
//  Copyright © 2019年 candy.chen. All rights reserved.
//

#import "TR_ShopCategoryModel.h"

@implementation TR_ShopCategoryModel
+ (NSDictionary *)modelContainerPropertyGenericClass {
    
    return @{@"children" : [TR_ShopCategoryModel class]};
    
}
@end


