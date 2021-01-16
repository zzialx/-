//
//  TR_CommentModel.m
//  DaPeiShi
//
//  Created by apple on 2019/1/4.
//  Copyright © 2019年 candy.chen. All rights reserved.
//

#import "TR_CommentModel.h"

@implementation TR_CommentModel


+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"againScoreVO" : [TR_CommentList class]};
}

- (instancetype)init
{
    if (self = [super init]) {
        self.imgPathLst = [[NSArray alloc]init];
    }
    return self;
}


@end

@implementation TR_CommentList

@end

@implementation TR_CommentInfoModel


@end
