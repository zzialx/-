//
//  IMJIETextView.m
//  TDS
//
//  Created by admin on 16/6/16.
//  Copyright © 2016年 sixgui. All rights reserved.
//

#import "IMJIETextView.h"

@implementation IMJIETextView

- (instancetype)initWithFrame:(CGRect)frame
{
    
    self = [super initWithFrame:frame];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChanged:)
                                                     name:UITextViewTextDidChangeNotification
                                                   object:self];
        self.autoresizesSubviews = NO;
        //默认字和颜色
        self.placeholder = @"";
        self.placeholderColor = [UIColor lightGrayColor];
        self.delegate = self;
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    //内容为空时才绘制placeholder
    if ([self.text isEqualToString:@""]) {
        CGRect placeholderRect;
        placeholderRect.origin.y = 15;
        placeholderRect.size.height = 20;
//        self.placeholderColor.
        placeholderRect.origin.x = 5;
        placeholderRect.size.width = CGRectGetWidth(self.frame);
        
        [self.placeholderColor set];
        [self.placeholder drawInRect:placeholderRect
                            withFont:self.font
                       lineBreakMode:NSLineBreakByWordWrapping
                           alignment:NSTextAlignmentLeft];
    }
}
- (void)textChanged:(NSNotification *)not
{
    if (self.text.length == 200) {
        self.text = [self.text substringToIndex:200];
         
        [self resignFirstResponder];
    }
    [self setNeedsDisplay];
}
-(void)textViewDidChange:(UITextView *)textView{
    if (textView.text.length > 200) {
        textView.text = [textView.text substringToIndex:200];
    }
}
- (void)setText:(NSString *)text
{
    [super setText:text];
    [self setNeedsDisplay];
}

@end
