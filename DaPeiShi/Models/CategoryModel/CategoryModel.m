//
//  CategoryModel.m
//  DaPeiShi
//
//  Created by admin on 2019/1/3.
//  Copyright © 2019年 candy.chen. All rights reserved.
//

#import "CategoryModel.h"

@implementation CategoryModel
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"children" : [CategoryModel class]};
}
@end


