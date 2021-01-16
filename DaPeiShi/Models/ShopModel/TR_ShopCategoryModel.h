//
//  TR_ShopCategoryModel.h
//  DaPeiShi
//
//  Created by admin on 2019/1/23.
//  Copyright © 2019年 candy.chen. All rights reserved.
//

#import "TR_Model.h"

NS_ASSUME_NONNULL_BEGIN


@interface TR_ShopCategoryModel : TR_Model
@property(nonatomic,copy)NSString * typeName;
@property(nonatomic,assign)NSInteger  typeId;
@property(nonatomic,assign)NSInteger  supId;
@property(nonatomic,copy)NSString * typeLevel;
@property(nonatomic,copy)NSString * createTime;
@property(nonatomic,copy)NSString * typeIcon;
@property(nonatomic,copy)NSString * status;
@property(nonatomic,strong)NSArray <TR_ShopCategoryModel*>*children;

@end




NS_ASSUME_NONNULL_END
