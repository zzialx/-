//
//  TR_SortHeadView.m
//  DaPeiShi
//
//  Created by xq的电脑 on 2019/6/22.
//  Copyright © 2019 candy.chen. All rights reserved.
//

#import "TR_SortHeadView.h"

@interface TR_SortHeadView ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *dis;
@property (weak, nonatomic) IBOutlet UIButton *defaultBtn;
@property (weak, nonatomic) IBOutlet UIButton *fansBtn;
@property (weak, nonatomic) IBOutlet UIButton *styleBtn;
@property (weak, nonatomic) IBOutlet UIButton *leavlBtn;
@property (strong, nonatomic) IBOutletCollection(NSLayoutConstraint) NSArray *sortBtnLeftDisArray;

#define BTN_SELECT_COLOR  UICOLOR_RGBA(255, 46, 46)
#define BTN_COLOR         UICOLOR_RGBA(0, 0, 0)

@end

@implementation TR_SortHeadView

- (void)awakeFromNib{
    [super awakeFromNib];
    CGFloat averageDis = (KScreenWidth-30*2-30-67-110)/3;
    for (NSLayoutConstraint * leftDis in self.sortBtnLeftDisArray) {
        leftDis.constant = averageDis;
    }
}
- (IBAction)sortingAction:(UIButton *)sender {
    if (sender.tag==1001) {
        //默认
        [self.defaultBtn setTitleColor:BTN_SELECT_COLOR forState:UIControlStateNormal];
        [self.fansBtn setTitleColor:BTN_COLOR forState:UIControlStateNormal];
        [self.styleBtn setTitleColor:BTN_COLOR forState:UIControlStateNormal];
        [self.leavlBtn setTitleColor:BTN_COLOR forState:UIControlStateNormal];
        
        [self.fansBtn setImage:[UIImage imageNamed:@"select"] forState:UIControlStateNormal];
        [self.styleBtn setImage:[UIImage imageNamed:@"select"] forState:UIControlStateNormal];
        [self.leavlBtn setImage:[UIImage imageNamed:@"select"] forState:UIControlStateNormal];
        
    }
    if (sender.tag==1002) {
        //粉丝数
        [self.defaultBtn setTitleColor:BTN_COLOR forState:UIControlStateNormal];
        [self.fansBtn setTitleColor:BTN_SELECT_COLOR forState:UIControlStateNormal];
        [self.styleBtn setTitleColor:BTN_COLOR forState:UIControlStateNormal];
        [self.leavlBtn setTitleColor:BTN_COLOR forState:UIControlStateNormal];
        
        [self.fansBtn setImage:[UIImage imageNamed:@"unselect"] forState:UIControlStateNormal];
        [self.styleBtn setImage:[UIImage imageNamed:@"select"] forState:UIControlStateNormal];
        [self.leavlBtn setImage:[UIImage imageNamed:@"select"] forState:UIControlStateNormal];
    }
    if (sender.tag==1003) {
        //风格
        [self.defaultBtn setTitleColor:BTN_COLOR forState:UIControlStateNormal];
        [self.fansBtn setTitleColor:BTN_COLOR forState:UIControlStateNormal];
        [self.styleBtn setTitleColor:BTN_SELECT_COLOR forState:UIControlStateNormal];
        [self.leavlBtn setTitleColor:BTN_COLOR forState:UIControlStateNormal];
        
        [self.fansBtn setImage:[UIImage imageNamed:@"select"] forState:UIControlStateNormal];
        [self.styleBtn setImage:[UIImage imageNamed:@"unselect"] forState:UIControlStateNormal];
        [self.leavlBtn setImage:[UIImage imageNamed:@"select"] forState:UIControlStateNormal];
    }
    if (sender.tag==1004) {
        //等级
        [self.defaultBtn setTitleColor:BTN_COLOR forState:UIControlStateNormal];
        [self.fansBtn setTitleColor:BTN_COLOR forState:UIControlStateNormal];
        [self.styleBtn setTitleColor:BTN_COLOR forState:UIControlStateNormal];
        [self.leavlBtn setTitleColor:BTN_SELECT_COLOR forState:UIControlStateNormal];
        
        [self.fansBtn setImage:[UIImage imageNamed:@"select"] forState:UIControlStateNormal];
        [self.styleBtn setImage:[UIImage imageNamed:@"select"] forState:UIControlStateNormal];
        [self.leavlBtn setImage:[UIImage imageNamed:@"unselect"] forState:UIControlStateNormal];
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
