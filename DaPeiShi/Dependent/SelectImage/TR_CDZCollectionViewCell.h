//
//  TR_CDZCollectionViewCell.h
//  TR_CDZCollectionInTableViewDemo
//
//  Created by NemoTR_CDZ on 2017/1/21.
//  Copyright © 2017年 NemoTR_CDZ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TR_CDZCollectionViewItem.h"

@protocol TR_CDZCollectionCellDelegate<NSObject>

@required
- (void)didDelete:(UICollectionViewCell *)cell;
@end

@interface TR_CDZCollectionViewCell : UICollectionViewCell


@property (strong, nonatomic) TR_CDZCollectionViewItem *item;

@property (assign, nonatomic) id<TR_CDZCollectionCellDelegate> delegate;

@end
