//
//  TR_LoginViewController.m
//  DaPeiShi
//
//  Created by xq的电脑 on 2019/6/16.
//  Copyright © 2019 candy.chen. All rights reserved.
//

#import "TR_LoginViewController.h"
#import "TR_LoginCodeVC.h"
@interface TR_LoginViewController ()

@end

@implementation TR_LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)getCodeAction:(UIButton *)sender {
    TR_LoginCodeVC * lvc = [[TR_LoginCodeVC alloc]init];
    [self.navigationController pushViewController:lvc animated:YES];
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
