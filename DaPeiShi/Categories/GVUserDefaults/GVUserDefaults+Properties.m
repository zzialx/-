//
//  GVUserDefaults+Properties.m
//  HouseProperty
//
//  Created by candy.chen on 2018/11/15.
//  Copyright © 2018年 candy.chen. All rights reserved.
//

#import "GVUserDefaults+Properties.h"

@implementation GVUserDefaults (Properties)
@dynamic token;
@dynamic loginState;
@dynamic userInfo;
@dynamic  isKillState;

- (NSDictionary *)setupDefaults {
    return @{
             @"token":@"",
             @"loginState": @NO,
             @"userInfo": [[NSData alloc]init],
             @"isKillState":@NO,
             };
}

- (NSString *)transformKey:(NSString *)key {
    key = [key stringByReplacingCharactersInRange:NSMakeRange(0,1) withString:[[key substringToIndex:1] uppercaseString]];
    return [NSString stringWithFormat:@"NSUserDefault%@", key];
}

@end
