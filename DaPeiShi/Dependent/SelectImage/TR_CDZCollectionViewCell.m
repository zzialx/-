//
//  TR_CDZCollectionViewCell.m
//  TR_CDZCollectionInTableViewDemo
//
//  Created by NemoTR_CDZ on 2017/1/21.
//  Copyright © 2017年 NemoTR_CDZ. All rights reserved.
//

#import "TR_CDZCollectionViewCell.h"
@interface TR_CDZCollectionViewCell()
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UIButton *delButton;

- (IBAction)delCell:(UIButton *)sender;

@end
@implementation TR_CDZCollectionViewCell



- (IBAction)delCell:(UIButton *)sender{
    if ([self.delegate respondsToSelector:@selector(didDelete:)]){
        [self.delegate didDelete:self];
    }
}

- (void)setItem:(TR_CDZCollectionViewItem *)item{
    //  解析需要的数据
    
    self.imageView.image = item.image;
    self.delButton.hidden = item.delBtnHidden;
}

@end
