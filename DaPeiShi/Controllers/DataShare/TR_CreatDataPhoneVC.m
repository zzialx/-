//
//  TR_CreatDataPhoneVC.m
//  DaPeiShi
//
//  Created by xq的电脑 on 2019/8/18.
//  Copyright © 2019 candy.chen. All rights reserved.
//

#import "TR_CreatDataPhoneVC.h"
#import "TR_SexAndHeightVC.h"

@interface TR_CreatDataPhoneVC ()
@property (weak, nonatomic) IBOutlet UITextField *phoneTF;

@end

@implementation TR_CreatDataPhoneVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.navView setLeftImg:@"back_gray" title:@"共享我的身材数据" bgColor:UIColor.whiteColor];
    self.view.backgroundColor=UIColor.whiteColor;
}
- (IBAction)confirmShareAction:(id)sender {
    TR_SexAndHeightVC * vc  = [[TR_SexAndHeightVC alloc]init];
    [self.navigationController pushViewController:vc animated:NO hideBottomTabBar:YES];
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
