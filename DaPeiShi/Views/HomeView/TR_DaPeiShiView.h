//
//  TR_DaPeiShiView.h
//  DaPeiShi
//
//  Created by xq的电脑 on 2019/6/19.
//  Copyright © 2019 candy.chen. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@interface TR_DaPeiShiView : UIView

@property(nonatomic,copy)clickAction clickTeacher;


- (instancetype)initWithFrame:(CGRect)frame withDaPeiShiList:(NSArray*)daPeiShiList;

@end

NS_ASSUME_NONNULL_END
