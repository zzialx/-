//
//  TR_SearchCollectionViewCell.h
//  TeaCity
//
//  Created by admin on 2019/1/4.
//  Copyright © 2019年 candy.chen. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^delItem)(NSInteger index);
typedef void(^longPress)(void);
@interface TR_SearchCollectionViewCell : UICollectionViewCell
@property(nonatomic,copy)delItem delItem;
@property(nonatomic,copy)longPress longPress;

- (void)showTeaName:(NSString*)name index:(NSInteger)index;
- (void)showCloseBtn:(BOOL)isShow;
@end

NS_ASSUME_NONNULL_END
