//
//  TR_LoginCodeVC.m
//  DaPeiShi
//
//  Created by xq的电脑 on 2019/6/16.
//  Copyright © 2019 candy.chen. All rights reserved.
//

#import "TR_LoginCodeVC.h"
#import "HWTFCodeBView.h"
#import "TR_NoSafeLoginVC.h"

@interface TR_LoginCodeVC ()
@property (weak, nonatomic) IBOutlet UIView *codeView;

@end

@implementation TR_LoginCodeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor=UIColor.whiteColor;
    HWTFCodeBView *code2View = [[HWTFCodeBView alloc] initWithCount:6 margin:10];
    code2View.frame=CGRectMake(0, 0, KScreenWidth-38*2, 56);
    [self.codeView addSubview:code2View];
}
- (IBAction)loginAction:(UIButton *)sender {
    TR_NoSafeLoginVC * vc = [[TR_NoSafeLoginVC alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
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
