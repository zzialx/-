//
//  TR_BindPhoneVC.m
//  DaPeiShi
//
//  Created by xq的电脑 on 2019/6/16.
//  Copyright © 2019 candy.chen. All rights reserved.
//

#import "TR_BindPhoneVC.h"
#import "TR_FillPhoneCodeVC.h"
@interface TR_BindPhoneVC ()
@property (weak, nonatomic) IBOutlet UITextField *phoneTF;
@property (weak, nonatomic) IBOutlet UITextField *invitationCodeTF;

@end

@implementation TR_BindPhoneVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)getPhoneCode:(UIButton *)sender {
//    if (self.phoneTF.text.length==0) {
//        return;
//    }
    TR_FillPhoneCodeVC * codeVC = [[TR_FillPhoneCodeVC alloc]init];
    [self.navigationController pushViewController:codeVC animated:YES hideBottomTabBar:YES];
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
