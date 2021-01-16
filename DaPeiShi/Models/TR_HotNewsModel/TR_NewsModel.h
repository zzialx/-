//
//  TR_NewsModel.h
//  DaPeiShi
//
//  Created by admin on 2019/3/13.
//  Copyright © 2019年 candy.chen. All rights reserved.
//

#import "TR_Model.h"

NS_ASSUME_NONNULL_BEGIN

@interface TR_NewsModel : TR_Model

@property(nonatomic,copy)NSString * title;
@property(nonatomic,copy)NSString * titleUrl;
@property(nonatomic,copy)NSString * newsId;
@property(nonatomic,copy)NSString * updateTime;
@property(nonatomic,copy)NSString * curl;///<内容分超链接
@property (copy, nonatomic) NSString *clickNum;
@property (copy, nonatomic) NSString *content;
@property (copy, nonatomic) NSString *keyword;
@property (copy, nonatomic) NSString *lastNewId;
@property (copy, nonatomic) NSString *lastTitle;
@property (copy, nonatomic) NSString *nextNewId;
@property (copy, nonatomic) NSString *nextTitle;
@property (copy, nonatomic) NSString *pid;
@property (copy, nonatomic) NSString *summery;
@property (copy, nonatomic) NSString *colName;
@end

NS_ASSUME_NONNULL_END
