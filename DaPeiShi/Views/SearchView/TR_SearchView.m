//
//  TR_SearchView.m
//  DaPeiShi
//
//  Created by xq的电脑 on 2019/6/18.
//  Copyright © 2019 candy.chen. All rights reserved.
//

#import "TR_SearchView.h"

@interface TR_SearchView ()
@property (weak, nonatomic) IBOutlet UIButton *seacrBtn;

@end

@implementation TR_SearchView
- (void)awakeFromNib{
    [super awakeFromNib];
    self.seacrBtn.layer.cornerRadius=15;
    self.seacrBtn.layer.masksToBounds=YES;
}
- (IBAction)goBackAction:(UIButton *)sender {
    if (self.clickAction) {
        self.clickAction(SEARCH_BTN_TYPE_BACK);
    }
}
- (IBAction)gotoSearchAction:(UIButton *)sender {
    if (self.clickAction) {
        self.clickAction(SEARCH_BTN_TYPE_SOUSUO);
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
