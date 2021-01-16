//
//  TR_SearchCollectionViewCell.m
//  TeaCity
//
//  Created by admin on 2019/1/4.
//  Copyright © 2019年 candy.chen. All rights reserved.
//

#import "TR_SearchCollectionViewCell.h"

@interface TR_SearchCollectionViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *teaNameLab;
@property (weak, nonatomic) IBOutlet UIButton *closeBtn;
@property (weak, nonatomic) IBOutlet UIView *bgView;

@end

@implementation TR_SearchCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.bgView.backgroundColor = UICOLOR_RGBA(242, 242, 242);
    self.bgView.layer.cornerRadius = 15;
    self.bgView.clipsToBounds=YES;
    self.closeBtn.hidden = YES;
    
    //添加长按手势
    UILongPressGestureRecognizer * longPressGesture =[[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(cellLongPress:)];
    longPressGesture.minimumPressDuration=1.0f;//设置长按 时间
    [self addGestureRecognizer:longPressGesture];
}
- (void)showTeaName:(NSString*)name index:(NSInteger)index{
    self.closeBtn.tag = index * 1000;
    self.teaNameLab.text = name;
}
- (void)showCloseBtn:(BOOL)isShow{
    self.closeBtn.hidden = !isShow;
}
- (IBAction)delHistoryItem:(UIButton *)sender {
    if (self.delItem) {
        self.delItem(sender.tag/1000);
    }
}
-(void)cellLongPress:(UILongPressGestureRecognizer *)longRecognizer{
    if (longRecognizer.state==UIGestureRecognizerStateBegan) {
        //成为第一响应者，需重写该方法
        [self becomeFirstResponder];
        if (self.longPress) {
            self.longPress();
        }
    }
    
}
@end
