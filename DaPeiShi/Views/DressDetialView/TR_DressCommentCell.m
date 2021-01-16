//
//  TR_DressCommentCell.m
//  DaPeiShi
//
//  Created by admin on 2019/8/9.
//  Copyright © 2019 candy.chen. All rights reserved.
//

#import "TR_DressCommentCell.h"
#import "TR_DressPlusCommentView.h"

@interface TR_DressCommentCell ()
@property(nonatomic,strong)UIImage * headImg;
@property(nonatomic,strong)UILabel * nameLab;
@property(nonatomic,strong)UILabel * timeLab;
@property(nonatomic,strong)UILabel * contentLab;
@property(nonatomic,strong)TR_DressPlusCommentView * plusCommentView;///<追加评论

@end
@implementation TR_DressCommentCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
