//
//  TR_HomeShowModel.h
//  DaPeiShi
//
//  Created by admin on 2019/1/22.
//  Copyright © 2019年 candy.chen. All rights reserved.
//

#import "TR_Model.h"

NS_ASSUME_NONNULL_BEGIN

@interface TR_HomeShowModel : TR_Model

@end

@interface TR_BannerModel : TR_Model

@property (copy, nonatomic) NSString *goodsId;///<商品ID
@property (copy, nonatomic) NSString * pic;///<图片地址(全路径) ,
@property (strong, nonatomic) NSString *skipType;///<跳转类型 1：外跳 2：内跳
@property (copy, nonatomic) NSString *configPicUrl;
@property (copy, nonatomic) NSString *filePath;
@property (copy, nonatomic) NSString *sort;
@property (copy, nonatomic) NSString *url;
@property (copy, nonatomic) NSString *adDesc;

@end

@interface TR_CategoryModel : TR_Model
@property (copy, nonatomic) NSString *cateLogo;
@property (copy, nonatomic) NSString *cateName;
@property (copy, nonatomic) NSString *cateId;
@end

@interface TR_HotNewsModel : TR_Model

@end

@interface TR_BiddingModel : TR_Model

@end




NS_ASSUME_NONNULL_END
