//
//  TR_DataFootView.m
//  DaPeiShi
//
//  Created by xq的电脑 on 2019/8/18.
//  Copyright © 2019 candy.chen. All rights reserved.
//

#import "TR_DataFootView.h"

@interface TR_DataFootView()
@property (weak, nonatomic) IBOutlet UIButton *mineShareBtn;

@end

@implementation TR_DataFootView
- (void)awakeFromNib{
    [super awakeFromNib];
    self.mineShareBtn.layer.borderColor  = UICOLOR_RGBA(255, 46, 46).CGColor;
    self.mineShareBtn.layer.borderWidth=1;
}

- (IBAction)shareMineDataAction:(UIButton *)sender {
    if (self.shareData) {
        self.shareData(sender.tag);
    }
}
- (IBAction)creatShareDataAction:(UIButton *)sender {
    if (self.shareData) {
        self.shareData(sender.tag);
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
