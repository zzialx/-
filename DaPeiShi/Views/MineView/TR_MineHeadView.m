//
//  TR_MineHeadView.m
//  DaPeiShi
//
//  Created by xq的电脑 on 2019/6/23.
//  Copyright © 2019 candy.chen. All rights reserved.
//

#import "TR_MineHeadView.h"

@interface TR_MineHeadView ()
@property (weak, nonatomic) IBOutlet UIImageView *headImg;
@property (weak, nonatomic) IBOutlet UILabel *nameLab;
@property (weak, nonatomic) IBOutlet UILabel *signstateLab;
@property (weak, nonatomic) IBOutlet UILabel *chaundaxiuCount;
@property (weak, nonatomic) IBOutlet UILabel *fansCount;
@property (weak, nonatomic) IBOutlet UILabel *founceCount;
@property (weak, nonatomic) IBOutlet UILabel *money;

@end

@implementation TR_MineHeadView

- (void)awakeFromNib{
    [super awakeFromNib];
    self.headImg.layer.cornerRadius=30;
    self.headImg.layer.masksToBounds=YES;
    [self.headImg addClickEvent:self action:@selector(seePeopleInfo)];
}
- (void)seePeopleInfo{
    if (self.seeDetial) {
        self.seeDetial(MineHead_Type_Person);
    }
}
- (IBAction)chuanDaXiuAction:(UIButton *)sender {
    if (self.seeDetial) {
        self.seeDetial(MineHead_Type_Cdx);
    }
}
- (IBAction)showFansAction:(UIButton *)sender {
    if (self.seeDetial) {
        self.seeDetial(MineHead_Type_Fans);
    }
}
- (IBAction)showFouncePeopleAction:(UIButton *)sender {
    if (self.seeDetial) {
        self.seeDetial(MineHead_Type_FouceOn);
    }
}
- (IBAction)showMoneyDetial:(UIButton *)sender {
    if (self.seeDetial) {
        self.seeDetial(MineHead_Type_Money);
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
