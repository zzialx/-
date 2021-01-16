//
//  TR_SystemInfo.m
//  HouseProperty
//
//  Created by admin on 2018/9/18.
//  Copyright © 2018年 candy.chen. All rights reserved.
//

#import "TR_SystemInfo.h"

@implementation TR_SystemInfo


+(instancetype)mainSystem
{
    static TR_SystemInfo *manage = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manage = [[self alloc] init];
    });
    return manage;
}

- (TR_UserModel *)userInfo
{
    if (!_userInfo) {
        NSData *data = [GVUserDefaults standardUserDefaults].userInfo;
        _userInfo = (TR_UserModel*)[NSKeyedUnarchiver unarchiveObjectWithData:data];
    }
    return _userInfo;
}

- (void)setLogin:(BOOL)login
{
    [GVUserDefaults standardUserDefaults].loginState = login;
}

- (BOOL)login
{
    return [GVUserDefaults standardUserDefaults].loginState;
}

- (void)saveUserInfo:(TR_UserModel *)userInfo
{
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:userInfo];
    [GVUserDefaults standardUserDefaults].userInfo = data;
    self.userInfo = userInfo;
}

- (void)removeUserInfo
{
    [GVUserDefaults standardUserDefaults].userInfo = nil;
    self.userInfo = nil;
}

@end
