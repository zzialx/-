//
//  TR_PersonImgCell.m
//  DaPeiShi
//
//  Created by xq的电脑 on 2019/6/23.
//  Copyright © 2019 candy.chen. All rights reserved.
//

#import "TR_PersonImgCell.h"

@interface TR_PersonImgCell ()
@property (weak, nonatomic) IBOutlet UIImageView *headImg;

@end

@implementation TR_PersonImgCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.headImg.layer.cornerRadius=20;
    self.headImg.layer.masksToBounds=YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
