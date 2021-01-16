//
//  TR_FillPhoneCodeVC.m
//  DaPeiShi
//
//  Created by xq的电脑 on 2019/6/16.
//  Copyright © 2019 candy.chen. All rights reserved.
//

#import "TR_FillPhoneCodeVC.h"
#import "HWTFCodeBView.h"
#import "TR_LoginViewController.h"
@interface TR_FillPhoneCodeVC ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIView *codeView;
@property (weak, nonatomic) IBOutlet UILabel *phoneLab;
@end

@implementation TR_FillPhoneCodeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=UIColor.whiteColor;
    // Do any additional setup after loading the view from its nib.
    HWTFCodeBView *code2View = [[HWTFCodeBView alloc] initWithCount:6 margin:10];
    code2View.frame=CGRectMake(0, 0, KScreenWidth-38*2, 56);
    [self.codeView addSubview:code2View];
}
- (IBAction)bindFhoneAction:(UIButton *)sender {
    NSLog(@"安全绑定");
    TR_LoginViewController * lgvc = [[TR_LoginViewController alloc]init];
    [self.navigationController pushViewController:lgvc animated:YES];
}
- (IBAction)againGetCode:(UIButton *)sender {
    NSLog(@"重新获取验证码");
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
