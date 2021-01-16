//
//  TR_MemberMsgCell.m
//  DaPeiShi
//
//  Created by xq的电脑 on 2019/6/30.
//  Copyright © 2019 candy.chen. All rights reserved.
//

#import "TR_MemberMsgCell.h"

@interface TR_MemberMsgCell ()
@property (weak, nonatomic) IBOutlet UIImageView *headImg;
@property (weak, nonatomic) IBOutlet UILabel *mesCountLab;
@property (weak, nonatomic) IBOutlet UILabel *contentLab;
@property (weak, nonatomic) IBOutlet UILabel *timeLab;
@property (weak, nonatomic) IBOutlet UILabel *titleLab;

@end

@implementation TR_MemberMsgCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.selectionStyle=UITableViewCellSelectionStyleNone;
    self.headImg.layer.cornerRadius=19;
    self.headImg.layer.masksToBounds=YES;
    self.mesCountLab.layer.cornerRadius=10.5;
    self.mesCountLab.layer.masksToBounds=YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
