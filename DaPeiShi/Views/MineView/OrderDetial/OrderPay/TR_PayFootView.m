//
//  TR_PayFootView.m
//  DaPeiShi
//
//  Created by xq的电脑 on 2019/6/29.
//  Copyright © 2019 candy.chen. All rights reserved.
//

#import "TR_PayFootView.h"

@interface TR_PayFootView ()
@property (weak, nonatomic) IBOutlet UIButton *payBtn;

@end

@implementation TR_PayFootView

- (void)awakeFromNib{
    [super awakeFromNib];
    self.payBtn.layer.cornerRadius=5;
    self.payBtn.layer.masksToBounds=YES;
}

- (IBAction)payAction:(id)sender {
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
