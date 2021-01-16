//
//  TR_HomeShowModel.m
//  DaPeiShi
//
//  Created by admin on 2019/1/22.
//  Copyright © 2019年 candy.chen. All rights reserved.
//

#import "TR_HomeShowModel.h"

@implementation TR_HomeShowModel

@end

@implementation TR_BannerModel
+(NSDictionary *)modelCustomPropertyMapper
{
    return @{@"filePath":@[@"pic",@"filePath"]};
}
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{};
}
@end

@implementation TR_CategoryModel
+(NSDictionary *)modelCustomPropertyMapper
{
    return @{};
}
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{};
}
@end

@implementation TR_HotNewsModel
+(NSDictionary *)modelCustomPropertyMapper
{
    return @{};
}
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{};
}
@end


@implementation TR_BiddingModel

+(NSDictionary *)modelCustomPropertyMapper
{
    return @{};
}
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{};
}

@end






