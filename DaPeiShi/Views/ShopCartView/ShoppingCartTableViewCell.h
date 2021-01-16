//
//  ShoppingCartTableViewCell.h
//  XBM
//
//  Created by isaac on 2018/6/7.
//  Copyright © 2018年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CartGoodsModel.h"

@protocol getTotalPriceDelegate<NSObject>
-(void)getTotalPrice:(CartGoodsModel *)model;

@end

@interface ShoppingCartTableViewCell : UITableViewCell
@property (nonatomic, retain) UIImageView *imageSelect;
@property (nonatomic, retain) UIImageView *imageTitle;
@property (nonatomic, retain) UILabel *lblTitle;
@property (nonatomic, retain) UILabel *lblKind;
@property (nonatomic, retain) UILabel *lblPrice;
@property (nonatomic, retain) UILabel *lblReduce;
@property (nonatomic, retain) UITextField *tfCount;
@property (nonatomic, retain) UILabel *lblAdd;
@property (nonatomic, assign) id delegate;
@property (nonatomic, retain) CartGoodsModel *model;
@end
