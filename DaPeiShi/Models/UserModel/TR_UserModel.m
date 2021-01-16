//
//  TR_UserModel.m
//  HouseProperty
//
//  Created by admin on 2018/9/18.
//  Copyright © 2018年 candy.chen. All rights reserved.
//

#import "TR_UserModel.h"

@implementation TR_UserModel
-(void)encodeWithCoder:(NSCoder *)aCoder {
    //在编码方法中，需要对对象的每一个属性进行编码。
    [aCoder encodeObject:MakeStringNotNil(self.authenticateSign)  forKey:@"authenticateSign"];
    [aCoder encodeObject:MakeStringNotNil(self.goodsCollectionNum) forKey:@"goodsCollectionNum"];
    [aCoder encodeObject:MakeStringNotNil(self.nickName) forKey:@"nickName"];
    [aCoder encodeObject:MakeStringNotNil(self.point) forKey:@"point"];
    [aCoder encodeObject:MakeStringNotNil(self.pointSign) forKey:@"pointSign"];
    [aCoder encodeObject:MakeStringNotNil(self.portraitPath) forKey:@"portraitPath"];
    [aCoder encodeObject:MakeStringNotNil(self.printNum) forKey:@"printNum"];
    [aCoder encodeObject:MakeStringNotNil(self.sexSign) forKey:@"sexSign"];
    [aCoder encodeObject:MakeStringNotNil(self.shopConllectionNum) forKey:@"shopConllectionNum"];
    [aCoder encodeObject:MakeStringNotNil(self.telephone) forKey:@"telephone"];
    [aCoder encodeObject:MakeStringNotNil(self.waitDeliverNum) forKey:@"waitDeliverNum"];
    [aCoder encodeObject:MakeStringNotNil(self.waitEvaluateNum) forKey:@"waitEvaluateNum"];
    [aCoder encodeObject:MakeStringNotNil(self.waitPayNum) forKey:@"waitPayNum"];
    [aCoder encodeObject:MakeStringNotNil(self.waitReceiveNum) forKey:@"waitReceiveNum"];
    [aCoder encodeObject:MakeStringNotNil(self.relativePath) forKey:@"relativePath"];
    [aCoder encodeObject:MakeStringNotNil(self.afterSaleNum) forKey:@"afterSaleNum"];
    [aCoder encodeObject:MakeStringNotNil(self.signDay) forKey:@"signDay"];
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder {
    //如果父类也遵守NSCoding协议，那么需要写self = [super initWithCoder]
    self = [super init];
    if (self) {
        self.authenticateSign = [aDecoder decodeObjectForKey:@"authenticateSign"];
        self.goodsCollectionNum = [aDecoder decodeObjectForKey:@"goodsCollectionNum"];
        self.nickName = [aDecoder decodeObjectForKey:@"nickName"];
        self.point = [aDecoder decodeObjectForKey:@"point"];
        self.pointSign = [aDecoder decodeObjectForKey:@"pointSign"];
        self.portraitPath = [aDecoder decodeObjectForKey:@"portraitPath"];
        self.printNum = [aDecoder decodeObjectForKey:@"printNum"];
        self.sexSign = [aDecoder decodeObjectForKey:@"sexSign"];
        self.shopConllectionNum = [aDecoder decodeObjectForKey:@"shopConllectionNum"];
        self.telephone = [aDecoder decodeObjectForKey:@"telephone"];
        self.waitDeliverNum = [aDecoder decodeObjectForKey:@"waitDeliverNum"];
        self.waitEvaluateNum = [aDecoder decodeObjectForKey:@"waitEvaluateNum"];
        self.waitPayNum = [aDecoder decodeObjectForKey:@"waitPayNum"];
        self.waitReceiveNum = [aDecoder decodeObjectForKey:@"waitReceiveNum"];
        self.relativePath = [aDecoder decodeObjectForKey:@"relativePath"];
        self.afterSaleNum = [aDecoder decodeObjectForKey:@"afterSaleNum"];
        self.signDay = [aDecoder decodeObjectForKey:@"signDay"];
    }
    return self;
}

@end
