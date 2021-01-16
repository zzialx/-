//
//  TR_DressPicCell.m
//  DaPeiShi
//
//  Created by xq的电脑 on 2019/6/22.
//  Copyright © 2019 candy.chen. All rights reserved.
//

#import "TR_DressPicCell.h"

@interface TR_DressPicCell ()
@property (weak, nonatomic) IBOutlet UIImageView *dressPic;

@end

@implementation TR_DressPicCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.dressPic.layer.cornerRadius=8;
    self.dressPic.layer.masksToBounds=YES;
}

@end
