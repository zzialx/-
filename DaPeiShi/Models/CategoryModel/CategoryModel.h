//
//  CategoryModel.h
//  DaPeiShi
//
//  Created by admin on 2019/1/3.
//  Copyright © 2019年 candy.chen. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CategoryModel : NSObject

@property(nonatomic,copy)NSString*typeName;
@property(nonatomic,copy)NSString*typeId ;
@property(nonatomic,copy)NSString*supId ;
@property(nonatomic,copy)NSString * typeIcon;
@property(nonatomic,strong)NSArray<CategoryModel*>* children;

@end




NS_ASSUME_NONNULL_END
