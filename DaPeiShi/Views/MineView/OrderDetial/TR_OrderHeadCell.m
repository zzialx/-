//
//  TR_OrderHeadCell.m
//  DaPeiShi
//
//  Created by xq的电脑 on 2019/6/24.
//  Copyright © 2019 candy.chen. All rights reserved.
//

#import "TR_OrderHeadCell.h"

@interface TR_OrderHeadCell ()
@property (weak, nonatomic) IBOutlet UIImageView *headImg;
@property (weak, nonatomic) IBOutlet UILabel *teacherContentLab;

@end

@implementation TR_OrderHeadCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.headImg.layer.cornerRadius=19;
    self.headImg.layer.masksToBounds=YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
