//
//  TR_VersionModel.h
//  OASystem
//
//  Created by candy.chen on 2019/2/19.
//  Copyright © 2019年 candy.chen. All rights reserved.
//

#import "TR_Model.h"

NS_ASSUME_NONNULL_BEGIN

@interface TR_VersionModel : TR_Model

@property (copy, nonatomic) NSString *versionCode;//版本号

@property (strong, nonatomic) NSURL *versionUrl;//升级链接

@property (copy, nonatomic) NSString *updateType;

@end

NS_ASSUME_NONNULL_END
