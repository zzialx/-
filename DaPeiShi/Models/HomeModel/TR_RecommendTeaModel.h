//
//  TR_RecommendTeaModel.h
//  DaPeiShi
//
//  Created by isaac on 2019/3/28.
//  Copyright © 2019年 candy.chen. All rights reserved.
//

#import "TR_Model.h"

NS_ASSUME_NONNULL_BEGIN

@interface TR_RecommendTeaModel : TR_Model
@property (copy, nonatomic) NSString *collectionNum;
@property (copy, nonatomic) NSString *configPicUrl;
@property (copy, nonatomic) NSString *filePath;
@property (copy, nonatomic) NSString *goodsId;
@property (copy, nonatomic) NSString *goodsTitle;
@property (copy, nonatomic) NSString *normOldPrice;
@property (copy, nonatomic) NSString *normPrice;
@property (copy, nonatomic) NSString *payNum;
@property (copy, nonatomic) NSString *scoreNum;
@property (copy, nonatomic) NSString *shopId;
@end

NS_ASSUME_NONNULL_END
