//
//  TR_HomeViewModel.m
//  DaPeiShi
//
//  Created by candylee on 2019/1/1.
//  Copyright © 2019年 candy.chen. All rights reserved.
//

#import "TR_HomeViewModel.h"
#import "TR_HomeModel.h"

static TR_HomeViewModel *manager = nil;
@implementation TR_HomeViewModel

+ (TR_HomeViewModel *)shareHomeManager{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[self alloc]init];
    });
    return manager;
}


@end
