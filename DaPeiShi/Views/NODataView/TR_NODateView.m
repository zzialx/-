//
//  TR_NODateView.m
//  HouseProperty
//
//  Created by admin on 2018/9/13.
//  Copyright © 2018年 candy.chen. All rights reserved.
//

#import "TR_NODateView.h"
#import "TR_HomeViewController.h"
#import "TR_LoginViewController.h"
@implementation TR_NODateView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (UIImageView *)noDataImg
{
    if (!_noDataImg) {
        _noDataImg = [UIImageView new];
        [self addSubview:_noDataImg];
       
    }
    return _noDataImg;
}
-(UILabel *)lblMiddle{
    if (!_lblMiddle) {
        _lblMiddle = [[UILabel alloc]init];
        _lblMiddle.textAlignment = NSTextAlignmentCenter;
        _lblMiddle.textColor = UICOLOR_RGBA(251, 54, 63);
        _lblMiddle.layer.cornerRadius = 15;
        _lblMiddle.layer.borderColor = UICOLOR_RGBA(251, 54, 63).CGColor;
        _lblMiddle.layer.borderWidth = 1;
        _lblMiddle.layer.masksToBounds = YES;
        [self addSubview:_lblMiddle];
        
        _lblMiddle.sd_layout
        .topSpaceToView(self.noDataLab, 20)
        .centerXIs(KScreenWidth/2.0)
        .widthIs(100)
        .heightIs(30);
        
    }
    return _lblMiddle;
}
-(UILabel *)lblLeft{
    if (!_lblLeft) {
        _lblLeft = [[UILabel alloc]init];
        [self addSubview:_lblLeft];
        _lblLeft.textAlignment = NSTextAlignmentCenter;
        _lblLeft.textColor = UICOLOR_RGBA(102, 102, 102);
        _lblLeft.layer.cornerRadius = 15;
        _lblLeft.layer.borderColor = UICOLOR_RGBA(102, 102, 102).CGColor;
        _lblLeft.layer.borderWidth = 1;
        _lblLeft.layer.masksToBounds = YES;
        [_lblLeft addClickEvent:self action:@selector(lookKill)];
       _lblLeft.text = @"看看秒杀";
        _lblLeft.hidden = YES;
        _lblLeft.sd_layout
        .topSpaceToView(self.noDataImg, 20)
        .rightSpaceToView(self, KScreenWidth/2.0+10)
        .widthIs(100)
        .heightIs(30);
        
    }
    return _lblMiddle;
}
-(UILabel *)lblRight{
    if (!_lblRight) {
        _lblRight = [[UILabel alloc]init];
         [self addSubview:_lblRight];
        _lblRight.textAlignment = NSTextAlignmentCenter;
        _lblRight.textColor = UICOLOR_RGBA(251, 54, 63);
        _lblRight.layer.cornerRadius = 15;
        _lblRight.layer.borderColor = UICOLOR_RGBA(251, 54, 63).CGColor;
        _lblRight.layer.borderWidth = 1;
        _lblRight.layer.masksToBounds = YES;
        [_lblRight addClickEvent:self action:@selector(goHome)];
        _lblRight.text = @"逛逛首页";
        _lblRight.hidden = YES;
        _lblRight.sd_layout
        .leftSpaceToView(self, KScreenWidth/2.0+10)
        .widthIs(100)
        .heightIs(30)
        .topSpaceToView(self.noDataImg, 20);
        
    }
    return _lblMiddle;
}
- (UILabel *)noDataLab
{
    if (!_noDataLab) {
        _noDataLab = [UILabel new];
        [self addSubview:_noDataLab];

        _noDataLab.font = [UIFont systemFontOfSize:15];
        _noDataLab.textColor = UICOLOR_RGBA(160, 160, 160);
    }
    return _noDataLab;
}
- (instancetype)initWithFrame:(CGRect)frame type:(NO_DATATYPE)type
{
    if (self = [super initWithFrame:frame]) {
        [self setNoDataType:type];
    }
    return self;
}
- (instancetype)setNoDataType:(NO_DATATYPE)type
{
//    NO_DATATYPE_NOCOLLECTIONPRO, //无收藏商品
//    NO_DATATYPE_NOCOLLECTIONSHOP
//    NO_DATATYPE_NOCOUPON,  //无优惠券
//    NO_DATATYPE_CARTNOLOGIN,//购物车未登录
//    NO_DATATYPE_CARTNOPRO //购物车无商品
//    NO_DATATYPE_FOOTPRINT //无足迹
    if (type == NO_DATATYPE_NODATA) {
        [self.noDataImg setImage:[UIImage imageNamed:@"no_search"]];
        [self.noDataLab setText:@"暂无数据"];
        _noDataLab.textAlignment = 1;
         _noDataImg.sd_layout.centerXEqualToView(self).topSpaceToView(self, 50).widthIs(160).heightIs(160);
          _noDataLab.sd_layout.centerXEqualToView(self).topSpaceToView(self.noDataImg, 20).widthRatioToView(self, 1).heightIs(30);
    }else if (type == NO_DATATYPE_NOMESSAGE) {
        [self.noDataImg setImage:[UIImage imageNamed:@"no_data"]];
        [self.noDataLab setText:@"暂无消息"];
        _noDataLab.textAlignment = 1;
         _noDataImg.sd_layout.centerXEqualToView(self).topSpaceToView(self, 50).widthIs(160).heightIs(160);
          _noDataLab.sd_layout.centerXEqualToView(self).topSpaceToView(self.noDataImg, 20).widthRatioToView(self, 1).heightIs(30);
    }else if (type == NO_DATATYPE_NETERROR) {
        [self.noDataImg setImage:[UIImage imageNamed:@"no_network"]];
        [self.noDataLab setText:@"网络错误"];
        _noDataLab.textAlignment = 1;
         _noDataImg.sd_layout.centerXEqualToView(self).topSpaceToView(self, 50).widthIs(160).heightIs(160);
          _noDataLab.sd_layout.centerXEqualToView(self).topSpaceToView(self.noDataImg, 20).widthRatioToView(self, 1).heightIs(30);
    }else if (type == NO_DATATYPE_NOCOLLECTIONPRO){
        UIImage *image = [UIImage imageNamed:@"no_pro"];
        [self.noDataImg setImage:image];
        [self.noDataLab setText:@"没有任何商品"];
        _noDataImg.sd_layout
        .topSpaceToView(self, 30)
        .rightSpaceToView(self, KScreenWidth/2.0+20)
        .widthIs(image.size.width/1.5)
        .heightIs(image.size.height/1.5);
        
        _noDataLab.sd_layout
        .topSpaceToView(self, 30)
        .rightSpaceToView(self, 20)
        .leftSpaceToView(self, KScreenWidth/2.0)
        .heightIs(image.size.height/1.5);
        
        self.lblMiddle.text = @"逛逛首页";
    }else if (type == NO_DATATYPE_NOCOLLECTIONSHOP){
        UIImage *image = [UIImage imageNamed:@"no_pro"];
        [self.noDataImg setImage:image];
        [self.noDataLab setText:@"没有任何店铺"];
        _noDataImg.sd_layout
        .topSpaceToView(self, 30)
        .rightSpaceToView(self, KScreenWidth/2.0+20)
        .widthIs(image.size.width/1.5)
        .heightIs(image.size.height/1.5);
        
        self.noDataLab.sd_layout
        .topSpaceToView(self, 30)
        .rightSpaceToView(self, 20)
        .leftSpaceToView(self, KScreenWidth/2.0)
        .heightIs(image.size.height/1.5);
        
        self.lblMiddle.text = @"逛逛首页";
    }else if (type == NO_DATATYPE_NOCOUPON){
        UIImage *image = [UIImage imageNamed:@"no_coupon"];
        [self.noDataImg setImage:image];
        [self.noDataLab setText:@"暂无优惠券，去领券中心看看吧"];
        _noDataLab.textAlignment = NSTextAlignmentCenter;
        _noDataImg.sd_layout
        .centerXEqualToView(self)
        .topSpaceToView(self, 30)
        .widthIs(image.size.width/1.5)
        .heightIs(image.size.height/1.5);
        
        self.noDataLab.sd_layout
        .topSpaceToView(_noDataImg, 20)
        .rightSpaceToView(self, 20)
        .leftSpaceToView(self, 20)
        .heightIs(20);
        
    }else if (type == NO_DATATYPE_CARTNOLOGIN){
        UIImage *image = [UIImage imageNamed:@"no_cart"];
        [self.noDataImg setImage:image];
        [self.noDataLab setText:@"登录后可以看到购物车商品"];
       
        _noDataLab.textAlignment = NSTextAlignmentCenter;
        _noDataImg.sd_layout
        .topSpaceToView(self, 30)
        .centerXIs(KScreenWidth/2.0)
        .widthIs(image.size.width/1.5)
        .heightIs(image.size.height/1.5);
        
        self.noDataLab.sd_layout
        .topSpaceToView(self.noDataImg, 20)
        .rightSpaceToView(self, 20)
        .leftSpaceToView(self, 20)
        .heightIs(20);
        
        self.lblMiddle.text = @"去登录";
        _lblMiddle.hidden = NO;
        _lblLeft.hidden = YES;
        _lblRight.hidden = YES;
    }else if (type == NO_DATATYPE_CARTNOPRO){
        UIImage *image = [UIImage imageNamed:@"no_cart"];
        [self.noDataImg setImage:image];
        [self.noDataLab setText:@"购物车是空的"];
        _noDataLab.textAlignment = NSTextAlignmentLeft;
        _noDataImg.sd_layout
        .topSpaceToView(self, 30)
        .rightSpaceToView(self, KScreenWidth/2.0+20)
        .widthIs(image.size.width/1.5)
        .heightIs(image.size.height/1.5);
        
        self.noDataLab.sd_layout
        .topSpaceToView(self, 30)
        .rightSpaceToView(self, 20)
        .leftSpaceToView(self, KScreenWidth/2.0)
        .heightIs(image.size.height/1.5);
        
        self.lblLeft.text = @"看看秒杀";
        self.lblRight.text = @"逛逛首页";
        _lblMiddle.hidden = YES;
        _lblLeft.hidden = NO;
        _lblRight.hidden = NO;
    }else if (type == NO_DATATYPE_FOOTPRINT){
        UIImage *image = [UIImage imageNamed:@"no_pro"];
        [self.noDataImg setImage:image];
        [self.noDataLab setText:@"没有任何商品"];

        _noDataImg.sd_layout
        .topSpaceToView(self, 30)
        .rightSpaceToView(self, KScreenWidth/2.0+20)
        .widthIs(image.size.width/1.5)
        .heightIs(image.size.height/1.5);
        
        self.noDataLab.sd_layout
        .topSpaceToView(self, 30)
        .rightSpaceToView(self, 20)
        .leftSpaceToView(self, KScreenWidth/2.0)
        .heightIs(image.size.height/1.5);
        
        self.lblMiddle.text = @"逛逛首页";
    }
    if (type == NO_DATATYPE_CARTNOLOGIN) {
         [_lblMiddle addClickEvent:self action:@selector(goLogin)];
    }else{
         [_lblMiddle addClickEvent:self action:@selector(goHome)];
    }
    return self;
}
-(void)goLogin{
    [[self viewController] openLoginVC:^(BOOL flag, NSString *message) {
        
    }];
}
-(void)goHome{
   
         [self viewController].tabBarController.selectedIndex = 0;
   
}
@end
