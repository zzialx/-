//
//  ScrollProgressManager.m
//  DaPeiShi
//
//  Created by admin on 2019/1/16.
//  Copyright © 2019年 candy.chen. All rights reserved.
//

#import "ScrollProgressManager.h"

static ScrollProgressManager *manager = nil;

@implementation ScrollProgressManager
+ (ScrollProgressManager *)sharedManager{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[self alloc]init];
    });
    return manager;
}
-(void)changeProgress:(CGFloat)progress{
    manager.progress = progress;
}

@end
