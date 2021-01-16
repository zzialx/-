//
//  DataShareHeadView.h
//  DaPeiShi
//
//  Created by admin on 2019/8/16.
//  Copyright © 2019 candy.chen. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^selectDataType)(NSInteger index);
@interface DataShareHeadView : UIView<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong)UICollectionView *collectView;
@property(nonatomic,strong)UIView *bottomView;
@property(nonatomic,strong)NSMutableArray *dataList;
@property(nonatomic,strong)UIColor *textColor;
@property(nonatomic,strong) UIColor *selectTextColor;
@property(nonatomic,assign)NSInteger fontSize;
@property(nonatomic,assign)NSUInteger selectIndex;
@property(nonatomic,strong)selectDataType selectDataType;
@end

NS_ASSUME_NONNULL_END
