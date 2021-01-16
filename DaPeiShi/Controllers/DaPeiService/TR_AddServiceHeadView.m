//
//  TR_AddServiceHeadView.m
//  DaPeiShi
//
//  Created by admin on 2019/8/20.
//  Copyright © 2019 candy.chen. All rights reserved.
//

#import "TR_AddServiceHeadView.h"
#import "SelwynExpandableTextView.h"

@interface TR_AddServiceHeadView ()<UITextViewDelegate>
@property (nonatomic,strong)SelwynExpandableTextView *expandableTextView;///<输入框

@end

@implementation TR_AddServiceHeadView

- (SelwynExpandableTextView *)expandableTextView {
    if (!_expandableTextView) {
        _expandableTextView = [[SelwynExpandableTextView alloc]init];
        _expandableTextView.delegate = self;
        _expandableTextView.textContainerInset = UIEdgeInsetsMake(8,16, 2, 16);
        _expandableTextView.textContainer.lineFragmentPadding = 0;
        _expandableTextView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        _expandableTextView.textAlignment = NSTextAlignmentLeft;
        _expandableTextView.backgroundColor = [UIColor whiteColor];
        _expandableTextView.font =FONT_TEXT(14)
        _expandableTextView.scrollEnabled = YES;
        _expandableTextView.autocorrectionType = UITextAutocorrectionTypeNo;
        _expandableTextView.layoutManager.allowsNonContiguousLayout = NO;
        _expandableTextView.showsVerticalScrollIndicator = YES;
        _expandableTextView.showsHorizontalScrollIndicator = NO;
        _expandableTextView.textAlignment = NSTextAlignmentLeft;
        NSAttributedString *attributedPlaceholder = [[NSAttributedString alloc]initWithString:@"快来秀出你的穿搭吧" attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14],NSForegroundColorAttributeName:[UIColor tr_colorwithHexString:@"#999999"]}];
        _expandableTextView.attributedPlaceholder = attributedPlaceholder;
        _expandableTextView.editable = YES;
        _expandableTextView.keyboardType = UIKeyboardTypeDefault;
        _expandableTextView.maxLength = 60;
        _expandableTextView.frame=CGRectMake(0, KNAV_HEIGHT, KScreenWidth, 60);
    }
    return _expandableTextView;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
