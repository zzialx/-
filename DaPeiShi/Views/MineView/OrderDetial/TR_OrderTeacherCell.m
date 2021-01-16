//
//  TR_OrderTeacherCell.m
//  DaPeiShi
//
//  Created by xq的电脑 on 2019/6/24.
//  Copyright © 2019 candy.chen. All rights reserved.
//

#import "TR_OrderTeacherCell.h"

@interface TR_OrderTeacherCell ()
@property (weak, nonatomic) IBOutlet UIImageView *headImg;
@property (weak, nonatomic) IBOutlet UIButton *chatBtn;

@end

@implementation TR_OrderTeacherCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.headImg.layer.cornerRadius=19;
    self.headImg.layer.masksToBounds=YES;
    self.chatBtn.layer.cornerRadius=13.5;
    self.chatBtn.layer.masksToBounds=YES;
    self.chatBtn.layer.borderWidth=1;
    self.chatBtn.layer.borderColor=UICOLOR_RGBA(255, 46, 46).CGColor;
}
- (IBAction)chatTeacherAction:(UIButton *)sender {
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
