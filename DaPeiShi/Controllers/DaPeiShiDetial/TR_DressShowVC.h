//
//  TR_DressShowVC.h
//  DaPeiShi
//
//  Created by xq的电脑 on 2019/8/18.
//  Copyright © 2019 candy.chen. All rights reserved.
//

#import "TR_BaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface TR_DressShowVC : TR_BaseViewController

@property (nonatomic,strong) UIViewController *VC;
@property (nonatomic, assign) BOOL vcCanScroll;
@property (nonatomic,strong)UICollectionView * collectionView;

@end

NS_ASSUME_NONNULL_END
