//
//  TR_CommentNoticeCell.m
//  DaPeiShi
//
//  Created by xq的电脑 on 2019/7/8.
//  Copyright © 2019 candy.chen. All rights reserved.
//

#import "TR_CommentNoticeCell.h"

@interface TR_CommentNoticeCell ()
@property (weak, nonatomic) IBOutlet UILabel *contentLab;

@end

@implementation TR_CommentNoticeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.selectionStyle=UITableViewCellSelectionStyleNone;

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
