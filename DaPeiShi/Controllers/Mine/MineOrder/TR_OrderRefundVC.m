//
//  TR_OrderRefundVC.m
//  DaPeiShi
//
//  Created by xq的电脑 on 2019/6/29.
//  Copyright © 2019 candy.chen. All rights reserved.
//

#import "TR_OrderRefundVC.h"
#import "TR_OrderHeadCell.h"
#import "TR_OrderTeacherCell.h"
#import "TR_OrderServiceCell.h"
#import "TR_OrderFootCell.h"
#import "TR_OrderNumberCell.h"
#import "TR_OrderPayVC.h"
#import "TR_RefundReasonCell.h"
#import "TR_RefundNoteCell.h"
#import "TR_RefundContentCell.h"


@interface TR_OrderRefundVC ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView * table;

@end

@implementation TR_OrderRefundVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navView setTitle:@"申请退款"];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger count = 1;
    if (section==0) {
        count=3;
    }
    return count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section==0) {
        return 0;
    }
    return 10;
}
- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 10)];
    headView.backgroundColor=UICOLOR_RGBA(242, 242, 242);
    return headView;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat rowHeight = 166;
    if (indexPath.section==0) {
        rowHeight=60;
    }
    
    return rowHeight;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell;
    WS(weakSelf);
    if (indexPath.section==0) {
        if (indexPath.row==0) {
            TR_RefundReasonCell * resonCell = [tableView dequeueReusableCellWithIdentifier:@"cell1"];
            cell = resonCell;
        }
        if (indexPath.row==1) {
            TR_RefundContentCell * moneyCell = [tableView dequeueReusableCellWithIdentifier:@"cell2"];
            cell = moneyCell;
        }
        if (indexPath.row==2) {
            TR_RefundNoteCell * noteCell = [tableView dequeueReusableCellWithIdentifier:@"cell3"];
            cell = noteCell;
        }
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
- (UITableView*)table{
    if (IsNilOrNull(_table)) {
        _table =[[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        [self.view addSubview:_table];
        _table.sd_layout.leftSpaceToView(self.view, 0).topSpaceToView(self.navView, 0).rightSpaceToView(self.view, 0).bottomSpaceToView(self.view, kSafeAreaBottomHeight);
        [_table registerNib:[UINib nibWithNibName:@"TR_RefundReasonCell" bundle:nil] forCellReuseIdentifier:@"cell1"];
        [_table registerNib:[UINib nibWithNibName:@"TR_RefundNoteCell" bundle:nil] forCellReuseIdentifier:@"cell2"];
        [_table registerNib:[UINib nibWithNibName:@"TR_RefundContentCell" bundle:nil] forCellReuseIdentifier:@"cell3"];
        
        _table.delegate=self;
        _table.dataSource=self;
        _table.separatorStyle=UITableViewScrollPositionNone;
        
        _table.backgroundColor=UICOLOR_RGBA(242, 242, 242);
    }
    return _table;
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
