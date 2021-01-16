//
//  TR_CDZTableViewCell.h
//  TR_CDZCollectionInTableViewDemo
//
//  Created by NemoTR_CDZ on 2017/1/21.
//  Copyright © 2017年 NemoTR_CDZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TR_CDZTableViewCellDelegate<NSObject>
- (void)didChangeCell:(UIView *)cell;
- (void)getSelectImageArray:(NSMutableArray*)imageArray;
@end

@interface TR_CDZTableViewCell : UIView

@property (nonatomic,assign) id<TR_CDZTableViewCellDelegate> delegate;
@property (copy, nonatomic) void(^finishBlock)(NSMutableArray *imageAssets);

@end
