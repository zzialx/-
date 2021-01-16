//
//  FootHeaderModel.h
//  XBM
//
//  Created by isaac on 2018/6/13.
//  Copyright © 2018年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FootHeaderModel : NSObject
@property (nonatomic, assign) BOOL isSelect;
@property (nonatomic, copy) NSString *time;
@property (nonatomic, retain) NSMutableArray *browseList;
-(instancetype)initWithDictionary:(NSDictionary *)dic;
@end
