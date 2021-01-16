//
//  TR_PushMessageEngine.h
//  HouseProperty
//
//  Created by candy.chen on 2018/9/27.
//  Copyright © 2018年 candy.chen. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^TR_PushMessageEngineBlock)(TR_JumpType type, id data);

@interface TR_PushMessageEngine : NSObject

@property (strong, nonatomic) TR_PushMessageEngineBlock engineblock;

- (void)parsePushUrl:(NSString *)url;

- (void)parsePushUrlLocal:(NSString *)url;

@end
