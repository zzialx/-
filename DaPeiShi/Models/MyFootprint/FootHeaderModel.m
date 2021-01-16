//
//  FootHeaderModel.m
//  XBM
//
//  Created by isaac on 2018/6/13.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "FootHeaderModel.h"
#import "BrowseModel.h"
@implementation FootHeaderModel
-(instancetype)initWithDictionary:(NSDictionary *)dic{
    self = [super init];
    if (self) {
        _isSelect = NO;
        _browseList = [[NSMutableArray alloc]init];
        _time = MakeStringNotNil(dic[@"time"]);
        if ([dic[@"list"] isKindOfClass:[NSArray class]]) {
            for (NSDictionary *dicModel in dic[@"list"]) {
                BrowseModel *model =[[BrowseModel alloc] initWithDictionary:dicModel];
                [_browseList addObject:model];
            }
        }
    }
    return self;
}
@end
