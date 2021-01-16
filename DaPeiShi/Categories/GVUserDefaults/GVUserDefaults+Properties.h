//
//  GVUserDefaults+Properties.h
//  HouseProperty
//
//  Created by candy.chen on 2018/11/15.
//  Copyright © 2018年 candy.chen. All rights reserved.
//

#import "GVUserDefaults.h"
NS_ASSUME_NONNULL_BEGIN

//-------------------------------------------------------------------
//声明的 object 类型的 property，请使用 weak；非 object 类型，请使用 assign
//-------------------------------------------------------------------

@interface GVUserDefaults (Properties)

@property (assign, nonatomic) BOOL loginState;//登录状态

@property (weak, nonatomic) NSString * token;

@property (weak, nonatomic) NSData *userInfo;//我的信息

@property (assign, nonatomic) BOOL isKillState;//订单支付结果跳转页面

@end

NS_ASSUME_NONNULL_END
