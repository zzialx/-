//
//  TR_MineHeadView.h
//  DaPeiShi
//
//  Created by xq的电脑 on 2019/6/23.
//  Copyright © 2019 candy.chen. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, MineHead_Type) {
    MineHead_Type_Cdx = 1,
    MineHead_Type_Fans = 2,
    MineHead_Type_FouceOn = 3,
    MineHead_Type_Money = 4,
    MineHead_Type_Person = 5,
};
typedef void(^mineDetial)(MineHead_Type type);
@interface TR_MineHeadView : UIView
@property(nonatomic,copy)mineDetial seeDetial;
@end

NS_ASSUME_NONNULL_END
