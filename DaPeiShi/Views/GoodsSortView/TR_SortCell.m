//
//  TR_SortCell.m
//  DaPeiShi
//
//  Created by xq的电脑 on 2019/6/17.
//  Copyright © 2019 candy.chen. All rights reserved.
//

#import "TR_SortCell.h"

@interface TR_SortCell()
@property (weak, nonatomic) IBOutlet UILabel *sortTitleLab;
@property (weak, nonatomic) IBOutlet UIImageView *sortImg;

@end

@implementation TR_SortCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)setIsSelect:(BOOL)isSelect{
    _isSelect = isSelect;
    if (_isSelect) {
        self.sortImg.hidden=NO;
        self.sortTitleLab.textColor=UICOLOR_RGBA(255, 46, 46);
    }else{
        self.sortImg.hidden=YES;
        self.sortTitleLab.textColor=UICOLOR_RGBA(0, 0, 0);
    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
