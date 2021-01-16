//
//  TR_NODateView.h
//  HouseProperty
//
//  Created by admin on 2018/9/13.
//  Copyright © 2018年 candy.chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TR_NODateView : UIView
@property(nonatomic,strong)UIImageView *noDataImg;
@property(nonatomic,strong)UILabel *noDataLab;
@property (strong,nonatomic) UILabel *lblLeft;
@property (strong,nonatomic) UILabel *lblRight;
@property (strong,nonatomic) UILabel *lblMiddle;
- (instancetype)initWithFrame:(CGRect)frame type:(NO_DATATYPE)type;
- (instancetype)setNoDataType:(NO_DATATYPE)type;
@end
