//
//  TR_Global.h
//  Traceability
//
//  Created by candy.chen on 2018/9/3.
//  Copyright © 2018年 candy.chen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TR_Global : NSObject

@property (readonly, copy, nonatomic) NSArray *loadingAnimationImages;

+ (instancetype)sharedInstance;

- (NSArray *)refreshAnimationImages;

- (NSArray *)pullingAnimationImages;

@end
