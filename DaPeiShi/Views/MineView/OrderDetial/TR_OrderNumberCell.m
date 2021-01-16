//
//  TR_OrderNumberCell.m
//  DaPeiShi
//
//  Created by xq的电脑 on 2019/6/24.
//  Copyright © 2019 candy.chen. All rights reserved.
//

#import "TR_OrderNumberCell.h"

@interface TR_OrderNumberCell ()
@property (weak, nonatomic) IBOutlet UILabel *orderNumberLab;
@property (weak, nonatomic) IBOutlet UILabel *orderTimeLab;
@property (weak, nonatomic) IBOutlet UILabel *orderState;

@end

@implementation TR_OrderNumberCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (IBAction)copyOrderNumberAction:(UIButton *)sender {
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
