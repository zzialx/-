//
//  TR_HotShopModel.h
//  DaPeiShi
//
//  Created by admin on 2019/3/11.
//  Copyright © 2019年 candy.chen. All rights reserved.
//

#import "TR_Model.h"

NS_ASSUME_NONNULL_BEGIN

@interface TR_HotShopModel : TR_Model
@property(nonatomic,copy) NSString * shopId;
@property(nonatomic,copy) NSString * configPicUrl;
@property(nonatomic,copy) NSString * filePath;
@property(nonatomic,copy) NSString * shopName;
@property(nonatomic,copy) NSString * multScore;///<评分
@property(nonatomic,copy) NSString * collectionNUm;///<收藏数


@end

NS_ASSUME_NONNULL_END
