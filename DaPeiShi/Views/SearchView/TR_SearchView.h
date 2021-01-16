//
//  TR_SearchView.h
//  DaPeiShi
//
//  Created by xq的电脑 on 2019/6/18.
//  Copyright © 2019 candy.chen. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef enum : NSUInteger {
    SEARCH_BTN_TYPE_BACK,
    SEARCH_BTN_TYPE_SOUSUO,
} SEARCH_BTN_TYPE;
typedef void(^btnAction)(SEARCH_BTN_TYPE type);
@interface TR_SearchView : UIView
@property(nonatomic,copy)btnAction clickAction;
@end

NS_ASSUME_NONNULL_END
