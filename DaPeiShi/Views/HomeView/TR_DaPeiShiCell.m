//
//  TR_DaPeiShiCell.m
//  DaPeiShi
//
//  Created by xq的电脑 on 2019/6/19.
//  Copyright © 2019 candy.chen. All rights reserved.
//

#import "TR_DaPeiShiCell.h"

@interface TR_DaPeiShiCell()

@property (weak, nonatomic) IBOutlet UIImageView *daPeiShiHeadImg;
@property (weak, nonatomic) IBOutlet UILabel *daPeiShiName;

@end

@implementation TR_DaPeiShiCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.daPeiShiHeadImg.layer.cornerRadius=27;
    self.daPeiShiHeadImg.layer.masksToBounds=YES;
    
}

@end
