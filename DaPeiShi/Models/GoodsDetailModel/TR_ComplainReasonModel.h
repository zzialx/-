//
//  TR_ComplainReasonModel.h
//  DaPeiShi
//
//  Created by apple on 2019/1/7.
//  Copyright © 2019年 candy.chen. All rights reserved.
//

#import "TR_Model.h"

@interface TR_ComplainReasonModel : TR_Model
@property(copy, nonatomic) NSString *dictId;
@property(copy, nonatomic) NSString *dictKey;
@property(copy, nonatomic) NSString *dictValue;
@property(copy, nonatomic) NSString *isSelect;
@end
