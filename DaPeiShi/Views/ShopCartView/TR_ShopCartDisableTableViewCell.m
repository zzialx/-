//
//  TR_ShopCartDisableTableViewCell.m
//  DaPeiShi
//
//  Created by isaac on 2019/3/13.
//  Copyright © 2019年 candy.chen. All rights reserved.
//

#import "TR_ShopCartDisableTableViewCell.h"

@implementation TR_ShopCartDisableTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _imageSelect = [[UIImageView alloc]init];
        _imageSelect.image = [UIImage imageNamed:@"unselect"];
        _imageSelect.backgroundColor = [UIColor grayColor];
       // [self.contentView addSubview:_imageSelect];
        
        _lblUnuse = [[UILabel alloc]init];
        _lblUnuse.text = @"失效";
        _lblUnuse.textAlignment = NSTextAlignmentCenter;
        _lblUnuse.textColor = [UIColor whiteColor];
        _lblUnuse.font = [UIFont systemFontOfSize:13];
        _lblUnuse.backgroundColor = UICOLOR_RGBA(153, 153, 153);
        _lblUnuse.layer.cornerRadius = 10;
        _lblUnuse.layer.masksToBounds = YES;
        [self.contentView addSubview:_lblUnuse];
        
        _imageTitle = [[UIImageView alloc]init];
        _imageTitle.image = [UIImage imageNamed:@"tea"];
        [self.contentView addSubview:_imageTitle];
        
        _imageNoPro = [[UIImageView alloc]init];
        _imageNoPro.backgroundColor = [UIColor blackColor];
        _imageNoPro.alpha = 0.4;
        _imageNoPro.layer.cornerRadius = 50;
        _imageNoPro.layer.masksToBounds = YES;
       // [self.contentView addSubview:_imageNoPro];
        
        _lblNoPro = [[UILabel alloc]init];
        _lblNoPro.textColor = [UIColor whiteColor];
        _lblNoPro.textAlignment = NSTextAlignmentCenter;
        _lblNoPro.font = [UIFont systemFontOfSize:12];
      //  [self.contentView addSubview:_lblNoPro];
        
        _lblTitle = [[UILabel alloc]init];
        _lblTitle.text = @"碧螺春 云雾 绿茶 2018新茶 罐装明前新茶春茶茶叶礼盒装";
        _lblTitle.numberOfLines = 0;
        _lblTitle.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:_lblTitle];
        
        _imageSelect.sd_layout
        .leftSpaceToView(self.contentView, 10)
        .topSpaceToView(self.contentView, 50)
        .heightIs(25)
        .widthIs(25);
        
        _lblUnuse.sd_layout
        .leftSpaceToView(self.contentView, 10)
        .topSpaceToView(self.contentView, 50)
        .widthIs(30)
        .heightIs(20);
        
        _imageTitle.sd_layout
        .leftSpaceToView(_lblUnuse, 10)
        .topSpaceToView(self.contentView, 10)
        .widthIs(100)
        .heightIs(100);
        
        _imageNoPro.sd_layout
        .leftEqualToView(_imageTitle)
        .topEqualToView(_imageTitle)
        .bottomEqualToView(_imageTitle)
        .rightEqualToView(_imageTitle);
        
        _lblNoPro.sd_layout
        .leftEqualToView(_imageTitle)
        .topEqualToView(_imageTitle)
        .bottomEqualToView(_imageTitle)
        .rightEqualToView(_imageTitle);
        
        _lblTitle.sd_layout
        .leftSpaceToView(_imageTitle, 10)
        .topSpaceToView(self.contentView, 10)
        .rightSpaceToView(self.contentView, 20)
        .heightIs(40);
    }
    return self;
}

-(void)setModel:(CartGoodsModel *)model{
    _model = model;
    [_imageTitle sd_setImageWithURL:[NSURL URLWithString:model.picUrl] placeholderImage:[UIImage imageNamed:@""]];
    _lblTitle.text = model.goodsTitle;
}

@end
