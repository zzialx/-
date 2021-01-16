//
//  TR_OrderGoodsModel.m
//  DaPeiShi
//
//  Created by candy.chen on 2019/1/3.
//  Copyright © 2019年 candy.chen. All rights reserved.
//

#import "TR_OrderGoodsModel.h"

@implementation TR_OrderGoodsModel

- (instancetype)init
{
    if (self = [super init]) {
        self.comImgs = [[NSMutableArray alloc]init];
        self.upImgs = [[NSMutableArray alloc]init];
    }
    return self;
}

@end
