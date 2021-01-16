//
//  CartHeaderView.m
//  XBM
//
//  Created by isaac on 2018/6/7.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "CartHeaderView.h"

@implementation CartHeaderView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        _imageSelect = [[UIImageView alloc]init];
        [self addSubview:_imageSelect];
        
        _imageMark = [[UIImageView alloc]init];
        _imageMark.image = [UIImage imageNamed:@"default_logo"];
        [self addSubview:_imageMark];
        
        _lblTitle = [[UILabel alloc]init];
        _lblTitle.text = @"贵州遵义湄潭茶业";
        _lblTitle.font = [UIFont systemFontOfSize:15];
        [self addSubview:_lblTitle];
        
        _lblCount = [[UILabel alloc]init];
        _lblCount.text = @"优惠券";
        _lblCount.font = [UIFont systemFontOfSize:15];
        [self addSubview:_lblCount];
        [_lblCount addClickEvent:self action:@selector(getDiscount)];
        _lblMark = [UILabel new];
        _lblMark.textColor = [UIColor redColor];
        _lblMark.font = [UIFont systemFontOfSize:13];
        _lblMark.textAlignment = NSTextAlignmentCenter;
        _lblMark.text = @"满减";
        _lblMark.layer.cornerRadius = 3;
        _lblMark.layer.borderWidth = 1;
        _lblMark.layer.borderColor = UICOLOR_RGBA(0, 155, 73).CGColor;
        _lblMark.layer.masksToBounds = YES;
        //[self addSubview:_lblMark];
        
        _lblDetail = [[UILabel alloc]init];
        _lblDetail.text = @"已参与满500减50活动";
        _lblDetail.font = [UIFont systemFontOfSize:13];
        _lblDetail.textColor = UICOLOR_RGBA(0, 155, 73);
       // [self addSubview:_lblDetail];
        
        _imageSelect.sd_layout
        .leftSpaceToView(self, 10)
        .topSpaceToView(self, 15)
        .widthIs(25)
        .heightIs(25);
        
        _imageMark.sd_layout
        .leftSpaceToView(_imageSelect, 10)
        .topSpaceToView(self, 15)
        .widthIs(25)
        .heightIs(25);
        
        _lblTitle.sd_layout
        .leftSpaceToView(_imageMark, 10)
        .topSpaceToView(self, 15)
        .heightIs(25)
        .rightSpaceToView(self, 20);
        
        _lblCount.sd_layout
        .rightSpaceToView(self, 10)
        .topSpaceToView(self, 0)
        .bottomSpaceToView(self, 0)
        .widthIs(60);
        
        _lblMark.sd_layout
        .leftSpaceToView(_imageSelect, 10)
        .topSpaceToView(_imageSelect, 20)
        .heightIs(20)
        .widthIs(50);
        
        _lblDetail.sd_layout
        .leftSpaceToView(_lblMark, 10)
        .topEqualToView(_lblMark)
        .rightSpaceToView(self, 20)
        .heightIs(20);
    }
    return self;
}
- (void)getDiscount
{
    if (_discountBtnClick) {
        _discountBtnClick(_model);
    }
}
-(void)setModel:(CartHeaderModel *)model{
    _model = model;
    if ([model.coupon integerValue] == 0) {
        _lblCount.hidden = YES;
    }else{
        _lblCount.hidden = NO;
    }
    [_imageMark sd_setImageWithURL:[NSURL URLWithString:model.shopIcon] placeholderImage:[UIImage imageNamed:@"default_logo"]];
    _lblTitle.text = model.shopName;
    if (_model.isSelect) {
        _imageSelect.image = [UIImage imageNamed:@"select"];
    }else{
        _imageSelect.image = [UIImage imageNamed:@"unselect"];
    }
}
@end
