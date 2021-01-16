//
//  TR_BaseViewController.m
//  Traceability
//
//  Created by candy.chen on 2018/9/03.
//  Copyright © 2018年 candy.chen. All rights reserved.
//

#import "TR_BaseViewController.h"
#import "TR_LoginViewController.h"
#import "TR_PushMessageEngine.h"
#import "TR_ProtocolWebViewController.h"
#import "TR_SearchViewController.h"
#import "TR_TabBarViewController.h"

@interface TR_BaseViewController ()

@property(nonatomic,strong)UITableView *tableView;

@end

@implementation TR_BaseViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = KSYS_BGCOLOR;
    [self.navView.leftBtn addTarget:self action:@selector(leftBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark OPEN VC
- (void)openLoginVC:(BoolBlock)loginResulet
{
    TR_LoginViewController *loginVC = [[TR_LoginViewController alloc] init];
    loginVC.hidesBottomBarWhenPushed = YES;
//    loginVC.loginResult = ^(BOOL loginSuccess) {
//        if (loginResulet) {
//            LogInfo(@"登录状态 %d",loginSuccess);
//            loginResulet(loginSuccess,nil);
//        }
//    };
    [self.navigationController pushViewController:loginVC animated:YES];
    
}
- (void)openGoodsDetailVC:(NSString *)goodsId isFromKill:(BOOL)isFromKill
{
    NSLog(@"商品id====%@",goodsId);
}

#pragma mark -jump Type
- (void)jumpHome
{
//    BOOL animated = (self.tabBarController.selectedIndex == 0)?YES: NO;
//    self.tabBarController.selectedIndex = 0;
//    UINavigationController *nav = (UINavigationController *)self.tabBarController.selectedViewController;
//    [nav popToRootViewControllerAnimated:animated];
}

- (void)jumpSearch
{
    TR_SearchViewController *seaechVC = [[TR_SearchViewController alloc] init];
    [self.navigationController pushViewController:seaechVC animated:YES hideBottomTabBar:YES];
}

- (void)jumpNotice
{
//    TR_NoticeViewController *notice = [[TR_NoticeViewController alloc]init];
//    [self.navigationController pushViewController:notice animated:YES hideBottomTabBar:YES];
}

- (void)jumpWebView:(NSString *)url
{
    TR_ProtocolWebViewController *webVC = [[TR_ProtocolWebViewController alloc]initWithProtocolType:url];
    [self.navigationController pushViewController:webVC animated:YES hideBottomTabBar:YES];
}

- (void)jumpH5:(NSArray *)array
{
    TR_ProtocolWebViewController *webVC = [[TR_ProtocolWebViewController alloc]initWithProtocolType:MakeStringNotNil(array[0])];
    [self.navigationController pushViewController:webVC animated:YES hideBottomTabBar:YES];
}

- (void)jumpTeaMarket
{
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"TeaMarket"]]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"TeaMarket"]];
    } else {
        
    }
}

//茶城
- (void)jumpDaPeiShi
{
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"DaPeiShi"]]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"DaPeiShi"]];
    } else {
        
    }
}

- (void)jumpOrigins:(NSInteger)index
{
    if (index == 0) {
        if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"teaShop://"]]) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"teaShop://"]];
        } else {
            
        }
    } else if (index == 1) {
        if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"HouseMarket://"]]) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"HouseMarket://"]];
        } else {
             [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://itunes.apple.com/cn/app/湄潭产权/id1437610779?mt=8"]];
        }
    }else if (index == 2) {
        if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"HouseGZ://"]]) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"HouseGZ://"]];
        } else {
            
        }
    }else if (index == 3) {
        if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"TraceabilityMarket://"]]) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"TraceabilityMarket://"]];
        } else {
             [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://itunes.apple.com/cn/app/茶溯源/id1438819773?mt=8"]];
        }
    }else if (index == 4) {
        if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"HouseTD://"]]) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"HouseTD://"]];
        } else {
            
        }
    }
 
}

- (void)jumpLogin
{
    TR_LoginViewController *loginVC = [[TR_LoginViewController alloc] init];
    [self.navigationController pushViewController:loginVC animated:YES hideBottomTabBar:YES];
}

- (void)jumpMyInformation
{
   
}

- (void)jumpHome:(NSInteger)index
{
    [TR_TabBarViewController defaultTabBar].selectedIndex = index;
}

- (void)jumpProduceDetail:(NSArray *)array
{
   
}

- (void)pushClickNewVc:(NSString*)name isHideTabBar:(BOOL)isHideTabBar{
    
}






#pragma mark - getters

//- (TR_PushMessageEngine *)pushHandleObject
//{
//    if (nil == _pushHandleObject) {
//        _pushHandleObject = [[TR_PushMessageEngine alloc]init];
//        WS(weakSelf);
//        _pushHandleObject.engineblock = ^(TR_JumpType type, id data) {
//            switch (type) {
//                case TR_JumpTypeH5Local:
//                    [weakSelf jumpWebView:data];
//                    break;
//                case TR_JumpTypeH5:
//                     [weakSelf jumpWebView:data];
//                    break;
//                case TR_JumpTypeTeaMarket://茶市
//                    [weakSelf jumpOrigins:0];
//                    break;
//                case TR_JumpTypeHouseMarket:
//                    [weakSelf jumpOrigins:1];
//                    break;
//                case TR_JumpTypeHouseGZ:
//                    [weakSelf jumpOrigins:2];
//                    break;
//                case TR_JumpTypeHouseTD:
//                    [weakSelf jumpOrigins:4];
//                    break;
//                case TR_JumpTypeOrigins:
//                    [weakSelf jumpOrigins:3];
//                    break;//溯源
//                case TR_JumpTypeHome:
//                    [weakSelf jumpHome:0];
//                    break;//首页
//                case TR_JumpTypeSearch:
//                     [weakSelf jumpSearch];
//                    break;//搜索
//                case TR_JumpTypeNotice:
//                    [weakSelf jumpNotice];
//                    break;//公告公示
//                case TR_JumpTypeProduce:
//                     [weakSelf jumpProduce];
//                    break;//热销商品
//                case TR_JumpTypeShop:
//                    [weakSelf jumpShop];
//                    break;//热销店铺
//                case TR_JumpTypeCategary:
//                    [weakSelf jumpHome:1];
//                    break;//分类
//                case TR_JumpTypeShopping:
//                    [weakSelf jumpHome:2];
//                    break;//购物车
//                case TR_JumpTypeProduceDetail:
//                    [weakSelf jumpProduceDetail:data];
//                    break;//商品详情页
//                case  TR_JumpTypeShopDetail:
//                    [weakSelf jumpShopDetail:data];
//                    break;//店铺详情页
//                case  TR_JumpTypeMy:
//                   [weakSelf jumpHome:3];
//                    break;//我的
//                case TR_JumpTypeMyStore:
//                    [weakSelf jumpMyStore];
//                    break;//我的收藏夹
//                case TR_JumpTypeMyFollow:
//                     [weakSelf jumpMyFollow];
//                    break; //关注店铺
//                case TR_JumpTypeMyFooter:
//                     [weakSelf jumpMyFooter];
//                    break;//我的足迹
//                case TR_JumpTypeMyOrder:
//                    [weakSelf jumpMyOrder];
//                    break;//我的订单
//                case TR_JumpTypeMyKill:
//                    [weakSelf jumpMyKill];
//                    break;//我的秒杀
//                case TR_JumpTypeMyCoupon:
//                    [weakSelf jumpMyCoupon];
//                    break;//我的优惠券
//                case TR_JumpTypeMyShop:
//                    [weakSelf jumpMyShop];
//                    break;//积分商城
//                case TR_JumpTypeMyCouponCenter:
//                     [weakSelf jumpMyCouponCenter];
//                    break;// 领券中心
//                case TR_JumpTypeMyKillCenter:
//                     [weakSelf jumpMyKillCenter];
//                    break;//秒杀专区
//                case TR_JumpTypeLogin:
//                    [weakSelf jumpLogin];
//                    break;//登录
//                case TR_JumpTypeMyInformation:
//                    [weakSelf jumpMyInformation];
//                    break;//个人信息
//                default:
//                    break;
//            }
//        };
//    }
//    return _pushHandleObject;
//}

- (TR_NODateView *)noDataView
{
    if (_noDataView) {
        [_noDataView removeFromSuperview];
    }
    _noDataView = [[TR_NODateView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.navView.frame), KScreenWidth, (KScreenHeight - KNAV_HEIGHT)/2.0)];

    return _noDataView;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];

}

-(void)leftBtnClicked:(UIButton *)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)showLinkStateView
{
    [TRHUDUtil showMessageWithText:@"网络错误"];
}

-(TENaviView *)navView{
    if (!_navView) {
        _navView = [[TENaviView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, KNAV_HEIGHT)];
        [self.view addSubview:_navView];
    }
    return _navView;
}

@end
