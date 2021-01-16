//
//  SecondKillSegmentView.h
//  TeaCity
//
//  Created by admin on 2019/1/15.
//  Copyright © 2019年 candy.chen. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^selectTimeKill)(NSInteger index);

@interface TR_SecondKillSegmentView : UIView<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong)UICollectionView *collectView;
@property(nonatomic,strong)UIView *bottomView;
@property(nonatomic,strong)NSMutableArray *dataList;
@property(nonatomic,strong)UIColor *textColor;
@property(nonatomic,strong) UIColor *selectTextColor;
@property(nonatomic,assign)NSInteger fontSize;
@property(nonatomic,assign)NSUInteger selectIndex;
@property(nonatomic,strong)selectTimeKill selectTime;
@end

NS_ASSUME_NONNULL_END
