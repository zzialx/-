//
//  SecondSegmentCell.m
//  TeaCity
//
//  Created by admin on 2019/1/15.
//  Copyright © 2019年 candy.chen. All rights reserved.
//

#import "TR_SecondSegmentCell.h"

@interface TR_SecondSegmentCell()
@property (weak, nonatomic) IBOutlet UILabel *timeKill;
@property (weak, nonatomic) IBOutlet UILabel *stateKill;

@end

@implementation TR_SecondSegmentCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.stateKill.layer.cornerRadius=2;
    self.stateKill.layer.masksToBounds=YES;
    self.stateKill.hidden=YES;
}
- (void)showCellStateIsKillIng:(BOOL)isKilling title:(NSString*)title{
    if (isKilling) {
        self.timeKill.textColor=self.stateKill.textColor=UICOLOR_RGBA(251, 54, 63);
        self.stateKill.hidden=NO;
    }else{
        self.timeKill.textColor = UICOLOR_RGBA(51, 51, 51);
     self.stateKill.hidden=YES;
    }
    self.timeKill.text=title;

}

@end
