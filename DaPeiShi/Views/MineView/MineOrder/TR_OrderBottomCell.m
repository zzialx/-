//
//  TR_OrderBottomCell.m
//  DaPeiShi
//
//  Created by xq的电脑 on 2019/6/23.
//  Copyright © 2019 candy.chen. All rights reserved.
//

#import "TR_OrderBottomCell.h"

@interface TR_OrderBottomCell ()
@property (weak, nonatomic) IBOutlet UIButton *payStateBtn;

@end

@implementation TR_OrderBottomCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.selectionStyle=UITableViewCellSelectionStyleNone;

    self.payStateBtn.layer.cornerRadius=12;
    self.payStateBtn.layer.masksToBounds=YES;
    self.payStateBtn.layer.borderWidth=1;
    self.payStateBtn.layer.borderColor=UICOLOR_RGBA(255, 46, 44).CGColor;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
