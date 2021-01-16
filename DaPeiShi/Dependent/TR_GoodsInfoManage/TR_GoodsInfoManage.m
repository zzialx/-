//
//  TR_GoodsInfoManage.m
//  DaPeiShi
//
//  Created by admin on 2019/3/21.
//  Copyright © 2019年 candy.chen. All rights reserved.
//

#import "TR_GoodsInfoManage.h"

static TR_GoodsInfoManage * manager = nil;

@implementation TR_GoodsInfoManage

+(TR_GoodsInfoManage*)shareGoodsInfoManage{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
       manager =  [[self alloc]init];
    });
    return manager;
}

@end
