//
//  TR_OrderFootCell.h
//  DaPeiShi
//
//  Created by xq的电脑 on 2019/6/24.
//  Copyright © 2019 candy.chen. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, Order_Foot_Type) {
    Order_Foot_Type_Pay = 1,//立即支付
    Order_Foot_Type_Confirm ,//确认服务完成
    Order_Foot_Type_Evaluation,//立即评价
};
typedef void(^footAction)(Order_Foot_Type type);
@interface TR_OrderFootCell : UITableViewCell
@property(nonatomic,assign)Order_Foot_Type type;
@property(nonatomic,copy)footAction footAction;

@end

NS_ASSUME_NONNULL_END
