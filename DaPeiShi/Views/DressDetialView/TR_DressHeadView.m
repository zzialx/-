//
//  TR_DressHeadView.m
//  DaPeiShi
//
//  Created by admin on 2019/8/8.
//  Copyright © 2019 candy.chen. All rights reserved.
//

#import "TR_DressHeadView.h"

@interface TR_DressHeadView ()
@property (weak, nonatomic) IBOutlet UIImageView *headImg;
@property (weak, nonatomic) IBOutlet UILabel *nameLab;
@property (weak, nonatomic) IBOutlet UIButton *fouceOnBtn;
@property (weak, nonatomic) IBOutlet UILabel *contentLab;
@property (weak, nonatomic) IBOutlet UILabel *dressTeacherLab;
@property (weak, nonatomic) IBOutlet UILabel *likeCount;
@property (weak, nonatomic) IBOutlet UILabel *msgConutLab;
@property (weak, nonatomic) IBOutlet UIButton *likeBtn;
@property (weak, nonatomic) IBOutlet UIButton *commentBtn;

@end


@implementation TR_DressHeadView

- (void)awakeFromNib{
    [super awakeFromNib];
    self.headImg.layer.cornerRadius=19;
    self.headImg.layer.masksToBounds=YES;
    self.fouceOnBtn.layer.cornerRadius=15;
    self.fouceOnBtn.layer.masksToBounds=YES;
    self.fouceOnBtn.layer.borderWidth=1;
    self.fouceOnBtn.layer.borderColor=UICOLOR_RGBA(255, 46, 46).CGColor;
    self.dressTeacherLab.layer.cornerRadius=8;
    self.dressTeacherLab.layer.masksToBounds=YES;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
