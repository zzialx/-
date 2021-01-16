//
//  TR_BaseViewController.h
//  Traceability
//
//  Created by candy.chen on 2018/9/03.
//  Copyright © 2018年 candy.chen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TR_LoadingHUD.h"
#import "TENaviView.h"
#import "TR_NODateView.h"
#import "TR_PushMessageEngine.h"

NS_ASSUME_NONNULL_BEGIN
typedef void(^collectHandle)(NSString *isCollect);

@interface TR_BaseViewController : UIViewController

@property(strong, nonatomic) TENaviView *navView;

@property(strong, nonatomic) TR_NODateView *noDataView;

@property(strong, nonatomic) TR_PushMessageEngine *pushHandleObject;

-(TENaviView *)navView;

-(void)leftBtnClicked:(UIButton *)sender;

- (void)showLinkStateView;

- (void)openGoodsDetailVC:(NSString *)goodsId isFromKill:(BOOL)isFromKill;

- (void)openLoginVC:(BoolBlock)loginResulet;

- (void)pushClickNewVc:(NSString*)name isHideTabBar:(BOOL)isHideTabBar;
@end

NS_ASSUME_NONNULL_END
