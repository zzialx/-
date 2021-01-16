//
//  TR_HomeModel.m
//  DaPeiShi
//
//  Created by candylee on 2019/1/1.
//  Copyright © 2019年 candy.chen. All rights reserved.
//

#import "TR_HomeModel.h"
#import "TR_NewsModel.h"
#import "TR_SeconkillModel.h"
#import "TR_AuctionModel.h"
#import "TR_RecommendTeaModel.h"
#import "TR_HomeShowModel.h"
@implementation TR_HomeModel

-(instancetype)initWithDictionary:(NSDictionary *)dic{
    self = [super init];
    if (self) {
        _floor = MakeStringNotNil(dic[@"floor"]);
        _arrayList = [[NSMutableArray alloc]init];
        if ([_floor isEqualToString:@"firstlunbo"]) {
            if (IsArrayClass(dic[@"bannerVOList"])) {
                NSArray *array = [NSArray yy_modelArrayWithClass:[TR_BannerModel class] json:dic[@"bannerVOList"]];
                [_arrayList addObjectsFromArray:array];
            }
        }else if ([_floor isEqualToString:@"gongge"]){
            if (IsArrayClass(dic[@"banner4VOList"])) {
                NSArray *array = [NSArray yy_modelArrayWithClass:[TR_BannerModel class] json:dic[@"banner4VOList"]];
                [_arrayList addObjectsFromArray:array];
            }
        }else if ([_floor isEqualToString:@"hotnews"]){
            if (IsArrayClass(dic[@"newsDetailVOList"])) {
            NSArray *array = [NSArray yy_modelArrayWithClass:[TR_NewsModel class] json:dic[@"newsDetailVOList"]];
            [_arrayList addObjectsFromArray:array];
            }
        }else if ([_floor isEqualToString:@"secKill"]){
            if (IsArrayClass(dic[@"appVOList"])) {
                NSArray *array = [NSArray yy_modelArrayWithClass:[TR_SeconkillModel class] json:dic[@"appVOList"]];
                [_arrayList addObjectsFromArray:array];
            }
            _secKillNowTime = MakeStringNotNil(dic[@"secKillNowTime"]);
            _secKillEndTime = MakeStringNotNil(dic[@"secKillEndTime"]);
        }else if ([_floor isEqualToString:@"auction"]){
            if (IsArrayClass(dic[@"appVOList"])) {
                NSArray *array = [NSArray yy_modelArrayWithClass:[TR_AuctionModel class] json:dic[@"appVOList"]];
                [_arrayList addObjectsFromArray:array];
            }
        }else if ([_floor isEqualToString:@"secondlunbo"]){
            if (IsArrayClass(dic[@"bannerVOList"])) {
                NSArray *array = [NSArray yy_modelArrayWithClass:[TR_BannerModel class] json:dic[@"bannerVOList"]];
                [_arrayList addObjectsFromArray:array];
            }
        }else if ([_floor isEqualToString:@"recommendTea"]){
            if (IsArrayClass(dic[@"appVOList"])) {
                NSArray *array = [NSArray yy_modelArrayWithClass:[TR_RecommendTeaModel class] json:dic[@"appVOList"]];
                [_arrayList addObjectsFromArray:array];
            }
        }else if ([_floor isEqualToString:@"bottomlunbo"]){
            if (IsArrayClass(dic[@"bannerVOList"])) {
                NSArray *array = [NSArray yy_modelArrayWithClass:[TR_BannerModel class] json:dic[@"bannerVOList"]];
                [_arrayList addObjectsFromArray:array];
            }
        }
    }
    
    return self;
}
@end
