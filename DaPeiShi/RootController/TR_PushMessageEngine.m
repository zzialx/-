//
//  TR_PushMessageEngine.m
//  HouseProperty
//
//  Created by candy.chen on 2018/9/27.
//  Copyright © 2018年 candy.chen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TR_PushMessageEngine.h"

@implementation TR_PushMessageEngine

- (void)parsePushUrlLocal:(NSString *)url
{
    if (url.length<=0) {
        return;
    }
    if (url.length>0) {
        url = [url stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    }
    BLOCK_EXEC(self.engineblock,TR_JumpTypeH5Local,url);
    return;
}

- (void)parsePushUrl:(NSString *)url
{
    if (url.length<=0) {
        return;
    }
    if (url.length>0) {
        url = [url stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    }
    NSURL * messageUrl = [NSURL URLWithString:url];
    NSString *path = messageUrl.path;
//   NSArray *pathComponents = messageUrl.pathComponents;
//   NSString *pathExtension = messageUrl.pathExtension;
//   NSString *parameterString = messageUrl.parameterString;
   NSString *query = messageUrl.query;
   NSArray *queryComponents = [query componentsSeparatedByString:@"&"];
    NSMutableArray *keyArray = [NSMutableArray array];
    for (NSString *param in queryComponents) {
        NSArray *array = [param componentsSeparatedByString:@"="];
        [keyArray addObject:MakeStringNotNil(array[1])];
    }
    NSLog(@"keyArray:%@",keyArray);
    if ([path isEqualToString:@"/main/producedetail"]) {
        BLOCK_EXEC(self.engineblock,TR_JumpTypeProduceDetail,keyArray);
        return;
    } else if ([path isEqualToString:@"/main/detail"]) {
        BLOCK_EXEC(self.engineblock,TR_JumpTypeShopDetail,keyArray);
        return;
    } else if ([path isEqualToString:@"/web/aty"]) {
        BLOCK_EXEC(self.engineblock,TR_JumpTypeH5,keyArray);
        return;
    } else if ([url isEqualToString:@"/main/type=home"]) {
        BLOCK_EXEC(self.engineblock,TR_JumpTypeHome,url);
        return;
    } else if ([url isEqualToString:@"/main/seacrh"]) {
        BLOCK_EXEC(self.engineblock,TR_JumpTypeSearch,url);
        return;
    } else if ([url isEqualToString:@"/main/news"]) {
        BLOCK_EXEC(self.engineblock,TR_JumpTypeNotice,url);
        return;
    } else if ([url isEqualToString:@"/main/produce"]) {
        BLOCK_EXEC(self.engineblock,TR_JumpTypeProduce,url);
        return;
    } else if ([url isEqualToString:@"/main/shop"]) {
        BLOCK_EXEC(self.engineblock,TR_JumpTypeShop,url);
        return;
    } else if ([url isEqualToString:@"/main/type=categary"]) {
        BLOCK_EXEC(self.engineblock,TR_JumpTypeCategary,url);
        return;
    } else if ([url isEqualToString:@"/main/type=shopping"]) {
        BLOCK_EXEC(self.engineblock,TR_JumpTypeShopping,url);
        return;
    } else if ([url isEqualToString:@"/personal/type=me"]) {
        BLOCK_EXEC(self.engineblock,TR_JumpTypeMy,url);
        return;
    } else if ([url isEqualToString:@"/personal/store"]) {
        BLOCK_EXEC(self.engineblock,TR_JumpTypeMyStore,url);
        return;
    } else if ([url isEqualToString:@"/personal/follow"]) {
        BLOCK_EXEC(self.engineblock,TR_JumpTypeMyFollow,url);
        return;
    } else if ([url isEqualToString:@"/personal/footer"]) {
        BLOCK_EXEC(self.engineblock,TR_JumpTypeMyFooter,url);
        return;
    } else if ([url isEqualToString:@"/personal/order"]) {
        BLOCK_EXEC(self.engineblock,TR_JumpTypeMyOrder,url);
        return;
    } else if ([url isEqualToString:@"/personal/kill"]) {
        BLOCK_EXEC(self.engineblock,TR_JumpTypeMyKill,url);
        return;
    } else if ([url isEqualToString:@"/personal/coupon"]) {
        BLOCK_EXEC(self.engineblock,TR_JumpTypeMyCoupon,url);
        return;
    } else if ([url isEqualToString:@"/personal/shop"]) {
        BLOCK_EXEC(self.engineblock,TR_JumpTypeMyShop,url);
        return;
    } else if ([url isEqualToString:@"/personal/couponcenter"]) {
        BLOCK_EXEC(self.engineblock,TR_JumpTypeMyCouponCenter,url);
        return;
    } else if ([url isEqualToString:@"/personal/killcenter"]) {
        BLOCK_EXEC(self.engineblock,TR_JumpTypeMyKillCenter,url);
        return;
    } else if ([url isEqualToString:@"/personal/login"]) {
        BLOCK_EXEC(self.engineblock,TR_JumpTypeLogin,url);
        return;
    } else if ([url isEqualToString:@"/personal/userinfo"]) {
        BLOCK_EXEC(self.engineblock,TR_JumpTypeMyInformation,url);
        return;
    } else if ([url isEqualToString:@"teaShop://"]) {
        BLOCK_EXEC(self.engineblock,TR_JumpTypeTeaMarket,url);
        return;
    } else if ([url isEqualToString:@"HouseMarket://"]) {
        BLOCK_EXEC(self.engineblock,TR_JumpTypeHouseMarket,url);
          return;
    }else if ([url isEqualToString:@"TraceabilityMarket://"]) {
        BLOCK_EXEC(self.engineblock,TR_JumpTypeHouseGZ,url);
        return;
    }else if ([url isEqualToString:@"HouseTD://"]) {
        BLOCK_EXEC(self.engineblock,TR_JumpTypeHouseTD,url);
        return;
    }else {
        BLOCK_EXEC(self.engineblock,TR_JumpTypeOrigins,url);
    }
}
@end
