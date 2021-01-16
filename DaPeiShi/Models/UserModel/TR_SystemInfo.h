//
//  TR_SystemInfo.h
//  HouseProperty
//
//  Created by admin on 2018/9/18.
//  Copyright © 2018年 candy.chen. All rights reserved.
//

#import "TR_Model.h"
#import "TR_UserModel.h"
@interface TR_SystemInfo : TR_Model

@property(strong, nonatomic)TR_UserModel *userInfo;

@property(assign, nonatomic)BOOL login;

+ (instancetype)mainSystem;

- (void)removeUserInfo;

- (void)saveUserInfo:(TR_UserModel *)userInfo;

@end
