//
//  TR_CollectionView.m
//  TeaCity
//
//  Created by admin on 2019/1/11.
//  Copyright © 2019年 candy.chen. All rights reserved.
//

#import "TR_CollectionView.h"

@implementation TR_CollectionView
- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        [self configurationSameInfo];
    }
    return self;
}
- (void)configurationSameInfo{
    self.showsHorizontalScrollIndicator = NO;
    self.showsVerticalScrollIndicator = NO;
    self.scrollEnabled = YES;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
