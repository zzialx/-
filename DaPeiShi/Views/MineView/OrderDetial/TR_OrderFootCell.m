//
//  TR_OrderFootCell.m
//  DaPeiShi
//
//  Created by xq的电脑 on 2019/6/24.
//  Copyright © 2019 candy.chen. All rights reserved.
//

#import "TR_OrderFootCell.h"

@interface TR_OrderFootCell ()
@property (weak, nonatomic) IBOutlet UIButton *footBtn;

@end

@implementation TR_OrderFootCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)setType:(Order_Foot_Type)type{
    _type = type;
    if (_type==Order_Foot_Type_Pay) {
        [self.footBtn setTitle:@"立即支付" forState:UIControlStateNormal];
    }
    if (_type==Order_Foot_Type_Confirm) {
        [self.footBtn setTitle:@"确认服务完成" forState:UIControlStateNormal];
    }
    if (_type==Order_Foot_Type_Evaluation) {
        [self.footBtn setTitle:@"立即评价" forState:UIControlStateNormal];
    }
}
- (IBAction)clickFootAction:(UIButton *)sender {
    if (self.footAction) {
        self.footAction(self.type);
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
