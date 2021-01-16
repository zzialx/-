//
//  TR_MessageViewController.m
//  DaPeiShi
//
//  Created by xq的电脑 on 2019/6/16.
//  Copyright © 2019 candy.chen. All rights reserved.
//

#import "TR_MessageViewController.h"
#import "TR_SystemMesssageVC.h"
#import "TR_LikeNoticeVC.h"
#import "TR_CommentNoticeVC.h"
#import "TR_SystemMsgCell.h"
#import "TR_MemberMsgCell.h"

@interface TR_MessageViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView * msgTable;
@end

@implementation TR_MessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=UIColor.whiteColor;
    [self.navView setTitle:@"消息"];
    self.navView.titleLabel.textColor=UIColor.blackColor;
    [self msgTable];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat rowH = 62;
    if (indexPath.section==1) {
        rowH = 95;
    }
    return rowH;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell;
    if (indexPath.section==0) {
        TR_SystemMsgCell * systemCell = [tableView dequeueReusableCellWithIdentifier:@"cell1"];
        if (systemCell==nil) {
            systemCell = [[TR_SystemMsgCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell1"];
        }
        cell = systemCell;
    }
    if (indexPath.section==1) {
        TR_MemberMsgCell * memberCell = [tableView dequeueReusableCellWithIdentifier:@"cell2"];
        if (memberCell == nil) {
            memberCell = [[TR_MemberMsgCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell2"];
        }
        cell = memberCell;
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        if (indexPath.row==0) {
            TR_SystemMesssageVC * vc = [[TR_SystemMesssageVC alloc]init];
            [self.navigationController pushViewController:vc animated:YES hideBottomTabBar:YES];
        }if (indexPath.row==2) {
            TR_LikeNoticeVC * vc = [[TR_LikeNoticeVC alloc]init];
            [self.navigationController pushViewController:vc animated:YES hideBottomTabBar:YES];
        }if (indexPath.row==1) {
            TR_CommentNoticeVC * vc =[[TR_CommentNoticeVC alloc]init];
            [self.navigationController pushViewController:vc animated:YES hideBottomTabBar:YES];
        }
        
    }
}
- (UITableView*)msgTable{
    if (IsNilOrNull(_msgTable)) {
        _msgTable = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        [self.view addSubview:_msgTable];
        _msgTable.sd_layout.leftEqualToView(self.view).topSpaceToView(self.navView, 0).rightEqualToView(self.view).bottomSpaceToView(self.view, kSafeAreaBottomHeight);
        _msgTable.delegate=self;
        _msgTable.dataSource=self;
        [_msgTable registerNib:[UINib nibWithNibName:@"TR_SystemMsgCell" bundle:nil] forCellReuseIdentifier:@"cell1"];
        [_msgTable registerNib:[UINib nibWithNibName:@"TR_MemberMsgCell" bundle:nil] forCellReuseIdentifier:@"cell2"];

    }
    return _msgTable;
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
