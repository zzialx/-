//
//  TR_ShopCartDisableTableViewCell.h
//  DaPeiShi
//
//  Created by isaac on 2019/3/13.
//  Copyright © 2019年 candy.chen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CartGoodsModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface TR_ShopCartDisableTableViewCell : UITableViewCell
@property (nonatomic, retain) UIImageView *imageSelect;
@property (nonatomic, retain) UIImageView *imageTitle;
@property (nonatomic, retain) UILabel *lblTitle;
@property (strong,nonatomic) UIImageView *imageNoPro;
@property (strong,nonatomic) UILabel *lblNoPro;
@property (strong,nonatomic) UILabel *lblUnuse;
@property (nonatomic, retain) CartGoodsModel *model;
@end

NS_ASSUME_NONNULL_END
