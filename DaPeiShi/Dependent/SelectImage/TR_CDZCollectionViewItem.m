//
//  TR_CDZCollectionViewItem.m
//  TR_CDZCollectionInTableViewDemo
//
//  Created by NemoTR_CDZ on 2017/1/21.
//  Copyright © 2017年 NemoTR_CDZ. All rights reserved.
//

#import "TR_CDZCollectionViewItem.h"

@implementation TR_CDZCollectionViewItem

- (instancetype)init{
    if ((self = [super init])) {
        _delBtnHidden = NO;
        _image = [UIImage imageNamed:@"add_sign"];
    }
    return self;
}



@end
