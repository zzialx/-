//
//  TR_FileModel.h
//  DaPeiShi
//
//  Created by apple on 2019/1/4.
//  Copyright © 2019年 candy.chen. All rights reserved.
//

#import "TR_Model.h"

@interface TR_FileModel : TR_Model
@property(nonatomic,strong)NSString *fileId;
@property(nonatomic,strong)NSString *goodsId;
@property(nonatomic,strong)NSString *fileType;
@property(nonatomic,strong)NSString *filePath;
@property(nonatomic,strong)NSString *fileDesc;
@property(nonatomic,strong)NSString *defaultFalg;
@property(nonatomic,strong)NSString *orderNum;
@property(nonatomic,strong)NSString *status;
@end
