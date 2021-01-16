//
//  ScrollProgressManager.h
//  DaPeiShi
//
//  Created by admin on 2019/1/16.
//  Copyright © 2019年 candy.chen. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ScrollProgressManager : NSObject
+ (ScrollProgressManager *)sharedManager;
@property(nonatomic,assign)CGFloat progress;
-(void)changeProgress:(CGFloat)progress;

@end

NS_ASSUME_NONNULL_END
