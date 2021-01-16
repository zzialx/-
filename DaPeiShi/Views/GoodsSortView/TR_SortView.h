//
//  TR_SortView.h
//  DaPeiShi
//
//  Created by xq的电脑 on 2019/6/17.
//  Copyright © 2019 candy.chen. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSInteger, Sorting_Type) {
    Sorting_Type_Defalut = 1,
    Sorting_Type_FansCount = 2,
    Sorting_Type_Style = 3,
    Sorting_Type_Level = 4,
};
typedef void(^selectCondition)(NSArray * conditionList);
@interface TR_SortView : UIView

@end

NS_ASSUME_NONNULL_END
