//
//  TR_SystemMsgCell.m
//  DaPeiShi
//
//  Created by xq的电脑 on 2019/6/30.
//  Copyright © 2019 candy.chen. All rights reserved.
//

#import "TR_SystemMsgCell.h"

@interface TR_SystemMsgCell ()
@property (weak, nonatomic) IBOutlet UILabel *mesCountLab;
@property (weak, nonatomic) IBOutlet UILabel *msgTitleLab;
@property (weak, nonatomic) IBOutlet UIImageView *msgImg;
@property (weak, nonatomic) IBOutlet UIView *msgBg;

@end


@implementation TR_SystemMsgCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.selectionStyle=UITableViewCellSelectionStyleNone;
    self.mesCountLab.layer.cornerRadius=10.5;
    self.mesCountLab.layer.masksToBounds=YES;
    self.msgBg.layer.cornerRadius=19;
    self.msgBg.layer.masksToBounds=YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
