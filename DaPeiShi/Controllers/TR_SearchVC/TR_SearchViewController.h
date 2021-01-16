//
//  TR_SearchViewController.h
//  DaPeiShi
//
//  Created by admin on 2019/1/4.
//  Copyright © 2019年 candy.chen. All rights reserved.
//

#import "TR_BaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface TR_SearchViewController : TR_BaseViewController
@property(nonatomic,assign)BOOL isShowHotGoods;
@property(nonatomic,assign)BOOL isShopSearch;
@property(nonatomic,copy)NSString * shopId;
@end

NS_ASSUME_NONNULL_END
