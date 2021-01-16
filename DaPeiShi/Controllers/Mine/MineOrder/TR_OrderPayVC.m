//
//  TR_OrderPayVC.m
//  DaPeiShi
//
//  Created by xq的电脑 on 2019/6/29.
//  Copyright © 2019 candy.chen. All rights reserved.
//

#import "TR_OrderPayVC.h"
#import "TR_PayMoneyView.h"
#import "TR_PayFootView.h"
#import "TR_PayStyleView.h"
@interface TR_OrderPayVC ()
@property(nonatomic,strong)TR_PayMoneyView * moneyView;
@property(nonatomic,strong)TR_PayStyleView * styleView;
@property(nonatomic,strong)TR_PayFootView * footView;

@end

@implementation TR_OrderPayVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=UICOLOR_RGBA(242, 242, 242);
    [self.navView setLeftImg:@"back_gray" title:@"选择支付方式" bgColor:UICOLOR_RGBA(242, 242, 242)];

    self.navView.backgroundColor=UIColor.whiteColor;
    [self moneyView];
    [self styleView];
    [self footView];
}
- (TR_PayMoneyView*)moneyView{
    if (IsNilOrNull(_moneyView)) {
        _moneyView =(TR_PayMoneyView*) [[[NSBundle mainBundle]loadNibNamed:@"TR_PayMoneyView" owner:nil
                                                 options:nil]lastObject];
        [self.view addSubview:_moneyView];
        _moneyView.sd_layout.leftEqualToView(self.view).rightEqualToView(self.view).topSpaceToView(self.navView, 0).heightIs(102);
    }
    return _moneyView;
}
- (TR_PayStyleView*)styleView{
    if (IsNilOrNull(_styleView)) {
        _styleView =(TR_PayStyleView*) [[[NSBundle mainBundle]loadNibNamed:@"TR_PayStyleView" owner:nil
                                                                   options:nil]lastObject];
        [self.view addSubview:_styleView];
        _styleView.sd_layout.leftEqualToView(self.view).rightEqualToView(self.view).topSpaceToView(self.moneyView, 10).heightIs(121);
    }
    return _styleView;
}
- (TR_PayFootView*)footView{
    if (IsNilOrNull(_footView)) {
        _footView =(TR_PayFootView*) [[[NSBundle mainBundle]loadNibNamed:@"TR_PayFootView" owner:nil
                                                                   options:nil]lastObject];
        [self.view addSubview:_footView];
        _footView.sd_layout.leftEqualToView(self.view).rightEqualToView(self.view).bottomSpaceToView(self.view, kSafeAreaBottomHeight).heightIs(65);
    }
    return _footView;
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
