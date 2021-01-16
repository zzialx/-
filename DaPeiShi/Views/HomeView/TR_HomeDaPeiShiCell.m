//
//  TR_HomeDaPeiShiCell.m
//  DaPeiShi
//
//  Created by xq的电脑 on 2019/6/19.
//  Copyright © 2019 candy.chen. All rights reserved.
//

#import "TR_HomeDaPeiShiCell.h"
#import "TR_DaPeiShiView.h"

@interface TR_HomeDaPeiShiCell ()
@property(nonatomic,strong)TR_DaPeiShiView * daPeiShiView;
@end

@implementation TR_HomeDaPeiShiCell

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setCellUI];
    }
    return self;
}
- (void)setCellUI{
    [self daPeiShiView];
}
- (TR_DaPeiShiView*)daPeiShiView{
    WS(weakSelf);
    if (IsNilOrNull(_daPeiShiView)) {
        _daPeiShiView = [[TR_DaPeiShiView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 110) withDaPeiShiList:nil];
        _daPeiShiView.clickTeacher = ^(NSString *actionId) {
            if (weakSelf.clickTeacher) {
                weakSelf.clickTeacher(actionId);
            }
        };
        [self.contentView addSubview:_daPeiShiView];
    }
    return _daPeiShiView;
}

@end
