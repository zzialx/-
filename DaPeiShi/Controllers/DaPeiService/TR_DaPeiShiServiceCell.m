//
//  TR_DaPeiShiServiceCell.m
//  DaPeiShi
//
//  Created by admin on 2019/8/20.
//  Copyright © 2019 candy.chen. All rights reserved.
//

#import "TR_DaPeiShiServiceCell.h"

@interface TR_DaPeiShiServiceCell ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bianjiBtn;
@property (weak, nonatomic) IBOutlet UIButton *deletBtn;

@end

@implementation TR_DaPeiShiServiceCell
- (IBAction)bianjiAction:(id)sender {
}
- (IBAction)deleateAction:(id)sender {
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.selectionStyle=UITableViewCellSelectionStyleNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
