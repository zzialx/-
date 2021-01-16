//
//  ShoppingCartTableViewCell.m
//  XBM
//
//  Created by isaac on 2018/6/7.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "ShoppingCartTableViewCell.h"

@interface ShoppingCartTableViewCell ()<UITextFieldDelegate>

@end

@implementation ShoppingCartTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _imageSelect = [[UIImageView alloc]init];
        [self.contentView addSubview:_imageSelect];
        
        _imageTitle = [[UIImageView alloc]init];
        _imageTitle.image = [UIImage imageNamed:@"default_logo"];
        [self.contentView addSubview:_imageTitle];
        
        _lblTitle = [[UILabel alloc]init];
        _lblTitle.text = @"碧螺春 云雾 绿茶 2018新茶 罐装明前新茶春茶茶叶礼盒装";
        _lblTitle.numberOfLines = 0;
        _lblTitle.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:_lblTitle];
        
        _lblKind = [[UILabel alloc]init];
        _lblKind.font = [UIFont systemFontOfSize:12];
        _lblKind.textColor = UICOLOR_RGBA(155, 155, 155);
        _lblKind.text = @"礼盒装 500g";
        [self.contentView addSubview:_lblKind];
        
        _lblPrice = [[UILabel alloc]init];
        _lblPrice.text = @"400.00";
        _lblPrice.font = [UIFont systemFontOfSize:15];
        _lblPrice.textColor = [UIColor redColor];
        [self.contentView addSubview:_lblPrice];
        
        _lblAdd = [[UILabel alloc]init];
        _lblAdd.textAlignment = NSTextAlignmentCenter;
        _lblAdd.text = @"+";
        _lblAdd.layer.borderWidth = 0.5;
        _lblAdd.layer.borderColor = [UIColor grayColor].CGColor;
        [_lblAdd addClickEvent:self action:@selector(addCount)];
        [self.contentView addSubview:_lblAdd];
        
        _tfCount = [[UITextField alloc]init];
        _tfCount.textAlignment = NSTextAlignmentCenter;
        _tfCount.text = @"1";
        _tfCount.delegate = self;
        _tfCount.layer.borderWidth = 0.5;
        _tfCount.keyboardType = UIKeyboardTypeNumberPad;
        _tfCount.layer.borderColor = [UIColor grayColor].CGColor;
        _tfCount.font = [UIFont systemFontOfSize:13];
        [self.contentView addSubview:_tfCount];
        
        _lblReduce = [[UILabel alloc]init];
        _lblReduce.textAlignment = NSTextAlignmentCenter;
        _lblReduce.text = @"-";
        _lblReduce.layer.borderWidth = 0.5;
        _lblReduce.layer.borderColor = [UIColor grayColor].CGColor;
        [_lblReduce addClickEvent:self action:@selector(reduceCount)];
        [self.contentView addSubview:_lblReduce];
        
        _imageSelect.sd_layout
        .leftSpaceToView(self.contentView, 10)
        .topSpaceToView(self.contentView, 50)
        .heightIs(25)
        .widthIs(25);
        
        _imageTitle.sd_layout
        .leftSpaceToView(_imageSelect, 10)
        .topSpaceToView(self.contentView, 10)
        .widthIs(100)
        .heightIs(100);
        
        _lblTitle.sd_layout
        .leftSpaceToView(_imageTitle, 10)
        .topSpaceToView(self.contentView, 10)
        .rightSpaceToView(self.contentView, 20)
        .heightIs(40);
        
        _lblKind.sd_layout
        .leftSpaceToView(_imageTitle, 10)
        .topSpaceToView(_lblTitle, 5)
        .rightSpaceToView(self.contentView, 20)
        .heightIs(20);
        
        _lblPrice.sd_layout
        .leftSpaceToView(_imageTitle, 10)
        .topSpaceToView(_lblKind, 10)
        .heightIs(30)
        .widthIs(120);
        
        _lblAdd.sd_layout
        .rightSpaceToView(self.contentView, 10)
        .bottomSpaceToView(self.contentView, 15)
        .widthIs(25)
        .heightIs(25);
        
        _tfCount.sd_layout
        .rightSpaceToView(_lblAdd, -0.5)
        .bottomSpaceToView(self.contentView,15)
        .heightIs(25)
        .widthIs(35);
        
        _lblReduce.sd_layout
        .rightSpaceToView(_tfCount, -0.5)
        .bottomSpaceToView(self.contentView, 15)
        .widthIs(25)
        .heightIs(25);
    }
    return self;
}
- (void)textFieldDidEndEditing:(UITextField *)textField{
    if ([textField.text isEqualToString:@""]) {
        _tfCount.text = _model.productNum;
    }else if ([textField.text integerValue] == 0){
         _tfCount.text = _model.productNum;
    }
    else{
        [self updateGoodsNum:[textField.text integerValue]];
    }
   
}
-(void)setModel:(CartGoodsModel *)model{
    _model = model;
    _tfCount.text = model.productNum;
    [_imageTitle sd_setImageWithURL:[NSURL URLWithString:model.picUrl] placeholderImage:[UIImage imageNamed:@"default_logo"]];
    _lblTitle.text = model.goodsTitle;
    _lblKind.text = model.normDesc;
    _lblPrice.text = [NSString stringWithFormat:@"¥%.2f",[model.price doubleValue]];
    if (_model.isSelect) {
        _imageSelect.image = [UIImage imageNamed:@"select"];
    }else{
        _imageSelect.image = [UIImage imageNamed:@"unselect"];
    }
}

-(void)addCount{
    NSInteger count = [_tfCount.text integerValue];
    count = count + 1;
    [self updateGoodsNum:count];
}
-(void)reduceCount{
    NSInteger count = [_tfCount.text integerValue];
    if (count > 1) {
          count = count - 1;
    }else{
       // [TRHUDUtil showMessageWithText:@"不能再减少了"];
        
    }
    [self updateGoodsNum:count];
}
-(void)updateGoodsNum:(NSInteger)count{
    if ([_model.price isEqualToString:@""]) {
        _model.price = @"0";
    }
    NSDictionary *dic = @{
                          @"normId":_model.normId,
                          @"price":_model.price,
                          @"num":[NSString stringWithFormat:@"%ld",count]
                          };
    WS(weakSelf);
//    [self.viewModel modifyGoodsNumWithParameters:dic completionBlock:^(BOOL flag, NSString *message) {
//        SS(strongSelf);
//        if (flag) {
//            strongSelf.tfCount.text = [NSString stringWithFormat:@"%ld",count];
//            strongSelf.model.productNum = strongSelf.tfCount.text;
//            strongSelf.model.priceSum = self.viewModel.priceSum;
//            if ([strongSelf.delegate respondsToSelector:@selector(getTotalPrice:)]) {
//                [strongSelf.delegate getTotalPrice:strongSelf.model];
//            }
//        }else{
//            [TRHUDUtil showMessageWithText:message];
//        }
//    }];
}
@end
