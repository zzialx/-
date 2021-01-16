//
//  TENaviView.m
//  TeaExchange
//
//  Created by isaac on 2018/1/19.
//  Copyright © 2018年 isaac. All rights reserved.
//

#import "TENaviView.h"

@implementation TENaviView

-(id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
//        self.backgroundColor = REDCOLOR;
        CGFloat h = KNAV_STATUS_HEIGHT;
        _leftBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, h, 100, KNAV_HEIGHT - h)];
        [self addSubview:_leftBtn];
        
        _leftImg = [[UIImageView alloc] initWithFrame:CGRectMake(15, h+8, 24, 24)];
        //_leftImg.image = [UIImage imageNamed:BACK_WHITE];
        [self addSubview:_leftImg];
        
        _rightBtn = [[UIButton alloc] initWithFrame:CGRectMake(KScreenWidth - 80, h, 80, KNAV_HEIGHT - h)];
        [self addSubview:_rightBtn];
        
        _rightImg = [[UIImageView alloc] initWithFrame:CGRectMake(KScreenWidth - 35, h+10, 20, 20)];
        [self addSubview:_rightImg];
        
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, h, KScreenWidth - 200, KNAV_HEIGHT - h)];
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.textAlignment = 1;
        _titleLabel.font = [UIFont systemFontOfSize:18];
        [self addSubview:_titleLabel];
        
        _titleImg = [[UIImageView alloc] initWithFrame:CGRectMake((KScreenWidth - 120)/2, 20, 120, 33)];
        //        _titleImg.image = [UIImage imageNamed:@"main_icon"];
        [self addSubview:_titleImg];
    }
    return self;
}

-(void)setLeftImg:(NSString *)leftImg rightImg:(NSString *)rigthImg title:(NSString *)title{
    _leftImg.image = [UIImage imageNamed:leftImg];
    _rightImg.image = [UIImage imageNamed:rigthImg];
    _titleLabel.text = title;
}
-(void)setLeftImg:(NSString *)leftImg title:(NSString *)title{
    _leftImg.image = [UIImage imageNamed:leftImg.length>0?leftImg:BACK_GRAY];
    _titleLabel.text = title;
    
}
-(void)setLeftImg:(NSString *)leftImg title:(NSString *)title bgColor:(UIColor *)navColor{
    _leftImg.image = [UIImage imageNamed:leftImg.length>0?leftImg:BACK_GRAY];
    _titleLabel.text = title;
    self.backgroundColor = navColor;
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, KNAV_HEIGHT-1, KScreenWidth, 1)];
    line.backgroundColor = KSYS_BGCOLOR;
    [self addSubview:line];
    _titleLabel.textColor = [UIColor blackColor];
}

-(void)setTitle:(NSString *)title{
    _titleLabel.text = title;
}

@end
