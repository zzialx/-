//
//  TR_SystemNoticeCell.m
//  DaPeiShi
//
//  Created by xq的电脑 on 2019/7/8.
//  Copyright © 2019 candy.chen. All rights reserved.
//

#import "TR_SystemNoticeCell.h"

@interface TR_SystemNoticeCell ()
@property (weak, nonatomic) IBOutlet UIView *cellBgview;
@property (weak, nonatomic) IBOutlet UILabel *noticeTitle;
@property (weak, nonatomic) IBOutlet UILabel *timelab;
@property (weak, nonatomic) IBOutlet UILabel *contentLab;

@end

@implementation TR_SystemNoticeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.selectionStyle=UITableViewCellSelectionStyleNone;
    self.cellBgview.layer.cornerRadius=8;
    self.cellBgview.layer.masksToBounds=YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
