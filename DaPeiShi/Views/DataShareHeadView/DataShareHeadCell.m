//
//  DataShareHeadCell.m
//  DaPeiShi
//
//  Created by admin on 2019/8/16.
//  Copyright © 2019 candy.chen. All rights reserved.
//

#import "DataShareHeadCell.h"

@interface DataShareHeadCell ()

@end

@implementation DataShareHeadCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.dataLine.hidden=YES;
}
- (void)showCellStateIsKillIng:(BOOL)isKilling title:(NSString*)title{
    if (isKilling) {
        self.dataNameType.textColor=UICOLOR_RGBA(251, 54, 63);
        self.dataLine.hidden=NO;
    }else{
        self.dataNameType.textColor = UICOLOR_RGBA(51, 51, 51);
        self.dataLine.hidden=YES;
    }
    self.dataNameType.text=title;
    
}

@end
