//
//  CartHeaderView.h
//  XBM
//
//  Created by isaac on 2018/6/7.
//  Copyright © 2018年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CartHeaderModel.h"
typedef void(^DiscountBtnClick)(CartHeaderModel *model);
@interface CartHeaderView : UIView
@property (nonatomic, retain) UIImageView *imageSelect;
@property (nonatomic, retain) UIImageView *imageMark;
@property (nonatomic, retain) UILabel *lblTitle;
@property (nonatomic, retain) UILabel *lblMark;
@property (nonatomic, retain) UILabel *lblDetail;
@property (nonatomic, retain) UILabel *lblCount;
@property(nonatomic,strong)DiscountBtnClick discountBtnClick;
@property (nonatomic, retain) CartHeaderModel *model;
@property (nonatomic, assign) id delegate;
@end
