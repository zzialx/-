//
//  TENaviView.h
//  TeaExchange
//
//  Created by isaac on 2018/1/19.
//  Copyright © 2018年 isaac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TENaviView : UIView
@property(nonatomic,strong)UIButton *leftBtn;
@property(nonatomic,strong)UIButton *rightBtn;
@property(nonatomic,strong)UIImageView *leftImg,*rightImg;
@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)UIImageView *titleImg;
-(void)setLeftImg:(NSString *)leftImg rightImg:(NSString *)rigthImg title:(NSString *)title;
-(void)setLeftImg:(NSString *)leftImg title:(NSString *)title bgColor:(UIColor *)navColor;
-(void)setLeftImg:(NSString *)leftImg title:(NSString *)title;
-(void)setTitle:(NSString *)title;
@end
