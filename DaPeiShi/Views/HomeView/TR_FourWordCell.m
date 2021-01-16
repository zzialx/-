//
//  TR_FourWordCell.m
//  DaPeiShi
//
//  Created by xq的电脑 on 2019/6/19.
//  Copyright © 2019 candy.chen. All rights reserved.
//

#import "TR_FourWordCell.h"

@interface TR_FourWordCell ()
@property (weak, nonatomic) IBOutlet UILabel *titleLab;
@property (weak, nonatomic) IBOutlet UILabel *contentLab;
@property (weak, nonatomic) IBOutlet UIImageView *clothesPic;

@end

@implementation TR_FourWordCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.contentView.layer.cornerRadius=10;
    self.contentView.layer.masksToBounds=YES;
}

@end
