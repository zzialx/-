//
//  TR_MineOrderCell.h
//  DaPeiShi
//
//  Created by xq的电脑 on 2019/6/23.
//  Copyright © 2019 candy.chen. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, MineOrder_Type) {
    MineOrder_Type_Pay = 1,
    MineOrder_Type_Send = 2,
    MineOrder_Type_Receive = 3,
    MineOrder_Type_all = 4,
};
typedef void(^seeOrderDetial)(MineOrder_Type detialType);

@interface TR_MineOrderCell : UITableViewCell
@property(nonatomic,copy)seeOrderDetial seeOrderDetail;

@end

NS_ASSUME_NONNULL_END
