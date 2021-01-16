//
//  TR_DataFootView.h
//  DaPeiShi
//
//  Created by xq的电脑 on 2019/8/18.
//  Copyright © 2019 candy.chen. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^shareData)(NSInteger index);

@interface TR_DataFootView : UIView

@property(nonatomic,copy)shareData shareData;

@end

NS_ASSUME_NONNULL_END
