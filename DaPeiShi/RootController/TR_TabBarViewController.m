//
//  TR_TabBarViewController.m
//  Traceability
//
//  Created by candy.chen on 2018/9/03.
//  Copyright © 2018年 candy.chen. All rights reserved.
//

#import "TR_TabBarViewController.h"
#import "TR_HomeViewController.h"
#import "TR_FindViewController.h"
#import "TR_MessageViewController.h"
#import "TR_MineViewController.h"
#import "DBHTabBar.h"
#import "LEEAlert.h"

@interface TR_TabBarViewController ()<UITabBarControllerDelegate,UITabBarControllerDelegate,UINavigationControllerDelegate,DBHTabBarDelegate,UIActionSheetDelegate>

@end

@implementation TR_TabBarViewController

+ (instancetype)defaultTabBar
{
    static TR_TabBarViewController * _defaultTabBar = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _defaultTabBar = [[self alloc]init];
    });
    return _defaultTabBar;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    [self getTabbarStyle];
    // 1.初始化子控制器
    
    TR_HomeViewController *homeVC = [[TR_HomeViewController alloc] init];
    self.homeNavi = [self addChildVc:homeVC title:@"首页" image:@"home_tab_n" selectedImage:@"home_tab_p"];
    
    TR_FindViewController *marketVC = [[TR_FindViewController alloc] init];
    self.categoryNav = [self addChildVc:marketVC title:@"发现" image:@"category_tab_n" selectedImage:@"category_tab_p"];
    
    TR_MessageViewController *auctionVC = [[TR_MessageViewController alloc] init];
    self.shopCartNav = [self addChildVc:auctionVC title:@"消息" image:@"cart_tab_n" selectedImage:@"cart_tab_p"];
    
    TR_MineViewController *myVC = [[TR_MineViewController alloc] init];
    self.myNav = [self addChildVc:myVC title:@"我的" image:@"my_tab_n" selectedImage:@"my_tab_p"];
    self.selectedIndex = 0;
    self.viewControllers = @[self.homeNavi, self.categoryNav, self.shopCartNav, self.myNav];
    
    DBHTabBar *tabBar = [[DBHTabBar alloc] init];
    //取消tabBar的透明效果
    tabBar.translucent = NO;
    // 设置tabBar的代理
    tabBar.myDelegate = self;
    // KVC：如果要修系统的某些属性，但被设为readOnly，就是用KVC，即setValue：forKey：。
    [self setValue:tabBar forKey:@"tabBar"];
}
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    if ([viewController isKindOfClass:[TR_NavigationViewController class]]) {
        [(TR_NavigationViewController *)viewController popToRootViewControllerAnimated:NO];
    }
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma DBHTabBarDelegate
/**
 *  点击了加号按钮
 */
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 0) {
       
    }else if (buttonIndex == 1){
       
    }
}
- (void)tabBarDidClickPlusButton:(DBHTabBar *)tabBar{
   
        UIActionSheet *sheet = [[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照",@"拍摄视频", nil];
    
        [sheet showInView:self.view];
  
    
//    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"" message:@"" preferredStyle:UIAlertControllerStyleActionSheet];
//
//    UIAlertAction *action = [UIAlertAction actionWithTitle:@"act1" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//
//    }];
//    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"act2" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//
//    }];
//    UIAlertAction *cancle = [UIAlertAction actionWithTitle:@"cancle" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
//
//    }];
//    [alert addAction:action];
//    [alert addAction:action2];
//    [alert addAction:cancle];
//    [self presentViewController:alert animated:YES completion:nil];
    
}
- (void)getTabbarStyle
{
    [[UITabBar appearance] setBarTintColor:[UIColor whiteColor]];
    [self.tabBar setTintColor:REDCOLOR];
    self.tabBar.translucent = NO;
    self.tabBar.alpha = 0.95f;
    //改变tabbar 线条颜色
    CGRect rect = CGRectMake(0, 0, KScreenWidth, 0.5);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context,
                                   [UIColor tr_colorwithHexString:@"#E5E5E5"].CGColor);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [self.tabBar setBackgroundImage:[[UIImage alloc]init]];
    [self.tabBar setShadowImage:img];
}

- (TR_NavigationViewController *)selectedNavi
{
    TR_NavigationViewController *nav;
    switch (self.selectedIndex) {
        case 0:
            nav = self.homeNavi;
            break;
        case 1:
            nav = self.categoryNav;
            break;
        case 2:
            nav = self.shopCartNav;
            break;
        case 3:
            nav = self.myNav;
            break;
        default:
            break;
    }

    return nav;
}

- (TR_NavigationViewController *)addChildVc:(UIViewController *)childVC title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    childVC.title = title;
    
    TR_NavigationViewController *navVC = [[TR_NavigationViewController alloc] initWithRootViewController:childVC];
    navVC.tabBarItem.image = [UIImage imageNamed:image];
    navVC.tabBarItem.image = [navVC.tabBarItem.image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    navVC.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    navVC.tabBarItem.imageInsets = UIEdgeInsetsMake(-1, 0, 1, 0);
    navVC.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -2);
    navVC.delegate = self;
    navVC.navigationBarHidden = YES;
    return navVC;
}


#pragma mark - Configuring the view’s layout behavior

- (BOOL)prefersStatusBarHidden
{
    return NO;
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if ([self.navigationSubDelegate respondsToSelector:@selector(navigationController:willShowViewController:animated:)]) {
        [self.navigationSubDelegate navigationController:navigationController willShowViewController:viewController animated:YES];
    }
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
