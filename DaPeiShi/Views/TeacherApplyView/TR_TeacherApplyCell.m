//
//  TR_TeacherApplyCell.m
//  DaPeiShi
//
//  Created by admin on 2019/8/20.
//  Copyright © 2019 candy.chen. All rights reserved.
//

#import "TR_TeacherApplyCell.h"

@interface TR_TeacherApplyCell ()
@property (weak, nonatomic) IBOutlet UILabel *nameLab;
@property (weak, nonatomic) IBOutlet UIView *bgView;

@end

@implementation TR_TeacherApplyCell
- (void)showName:(NSString*)name isSelect:(BOOL)isSelect{
    self.nameLab.text = name;
    if (isSelect) {
        self.nameLab.textColor = UICOLOR_RGBA(254, 47, 23);
    }else{
        self.nameLab.textColor = UICOLOR_RGBA(0, 0, 0);
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.bgView.backgroundColor = UICOLOR_RGBA(242, 242, 242);
    self.bgView.layer.cornerRadius = 15;
    self.bgView.clipsToBounds=YES;
}

@end
