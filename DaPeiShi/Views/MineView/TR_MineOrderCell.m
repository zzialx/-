//
//  TR_MineOrderCell.m
//  DaPeiShi
//
//  Created by xq的电脑 on 2019/6/23.
//  Copyright © 2019 candy.chen. All rights reserved.
//

#import "TR_MineOrderCell.h"

@interface TR_MineOrderCell ()
@property (strong, nonatomic) IBOutletCollection(NSLayoutConstraint) NSArray *leftDisArray;

@end


@implementation TR_MineOrderCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    CGFloat averageDis = (KScreenWidth-20*2-232)/3;
    for (NSLayoutConstraint * leftDis in self.leftDisArray) {
        leftDis.constant = averageDis;
    }
}
- (IBAction)seeOrderAction:(UIButton *)sender {
    switch (sender.tag) {
        case 1000:
            if (self.seeOrderDetail) {
                self.seeOrderDetail(MineOrder_Type_Pay);
            }
            break;
        case 1001:
            if (self.seeOrderDetail) {
                self.seeOrderDetail(MineOrder_Type_Send);
            }
            break;
        case 1002:
            if (self.seeOrderDetail) {
                self.seeOrderDetail(MineOrder_Type_Receive);
            }
            break;
        case 1003:
            if (self.seeOrderDetail) {
                self.seeOrderDetail(MineOrder_Type_all);
            }
            break;
        default:
            break;
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
