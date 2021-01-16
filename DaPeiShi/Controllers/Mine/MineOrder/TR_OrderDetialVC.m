//
//  TR_OrderDetialVC.m
//  DaPeiShi
//
//  Created by xq的电脑 on 2019/6/24.
//  Copyright © 2019 candy.chen. All rights reserved.
//

#import "TR_OrderDetialVC.h"
#import "TR_OrderHeadCell.h"
#import "TR_OrderTeacherCell.h"
#import "TR_OrderServiceCell.h"
#import "TR_OrderFootCell.h"
#import "TR_OrderNumberCell.h"
#import "TR_OrderPayVC.h"

@interface TR_OrderDetialVC ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView * table;
@end

@implementation TR_OrderDetialVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.whiteColor;
//    [self.navView setLeftImg:@"back_gray" title:@"服务详情"];
    [self.navView setLeftImg:@"back_gray" title:@"服务详情" bgColor:UIColor.whiteColor];
    [self.navView.rightBtn setTitle:@"申请退款" forState:UIControlStateNormal];
    [self.navView.rightBtn setTitleColor:UICOLOR_RGBA(255, 46, 46) forState:UIControlStateNormal];
    self.navView.rightBtn.titleLabel.font=FONT_TEXT(14);
    [self.navView.rightBtn addClickEvent:self action:@selector(gotoTuiKuan)];
    [self table];
}
#pragma mark------退款
- (void)gotoTuiKuan{
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 5;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger count = 1;
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
    CGFloat rowHeight = 0;
    if (indexPath.section==0) {
        rowHeight=132;
    }
    if (indexPath.section==1) {
        rowHeight=175;
    }
    if (indexPath.section==2) {
        rowHeight=144;
    }
    if (indexPath.section==3) {
        rowHeight=101;
    }
    if (indexPath.section==4) {
        rowHeight=65;
    }

    return rowHeight;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell;
    WS(weakSelf);
    if (indexPath.section==0) {
        TR_OrderHeadCell * orderTopCell = [tableView dequeueReusableCellWithIdentifier:@"cell1"];
        cell = orderTopCell;
    }
    if (indexPath.section==1) {
        TR_OrderTeacherCell * orderTeaCell = [tableView dequeueReusableCellWithIdentifier:@"cell2"];
        cell = orderTeaCell;
        
    }
    if (indexPath.section==2) {
        TR_OrderServiceCell * serviceCell = [tableView dequeueReusableCellWithIdentifier:@"cell3"];
        cell = serviceCell;
    }
    if (indexPath.section==3) {
        TR_OrderNumberCell * orderNumberCell = [tableView dequeueReusableCellWithIdentifier:@"cell4"];
        cell = orderNumberCell;
    }
    if (indexPath.section==4) {
        TR_OrderFootCell * orderFootCell = [tableView dequeueReusableCellWithIdentifier:@"cell5"];
        orderFootCell.type = Order_Foot_Type_Pay;
        orderFootCell.footAction = ^(Order_Foot_Type type) {
          //底部按钮
            [weakSelf footClickAction:type];
        };
        cell = orderFootCell;
    }
    return cell;
}
#pragma mark------订单详情底部按钮事件
- (void)footClickAction:(Order_Foot_Type)type{
    if (type == Order_Foot_Type_Pay) {
        TR_OrderPayVC * vc = [[TR_OrderPayVC alloc]init];
        [self.navigationController pushViewController:vc
                                             animated:YES];
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    TR_OrderDetialVC * vc = [[TR_OrderDetialVC alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
- (UITableView*)table{
    if (IsNilOrNull(_table)) {
        _table =[[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        [self.view addSubview:_table];
        _table.sd_layout.leftSpaceToView(self.view, 0).topSpaceToView(self.navView, 0).rightSpaceToView(self.view, 0).bottomSpaceToView(self.view, kSafeAreaBottomHeight);
        _table.delegate=self;
        _table.dataSource=self;
        _table.separatorStyle=UITableViewScrollPositionNone;
        [_table registerNib:[UINib nibWithNibName:@"TR_OrderHeadCell" bundle:nil] forCellReuseIdentifier:@"cell1"];
        [_table registerNib:[UINib nibWithNibName:@"TR_OrderTeacherCell" bundle:nil] forCellReuseIdentifier:@"cell2"];
        [_table registerNib:[UINib nibWithNibName:@"TR_OrderServiceCell" bundle:nil] forCellReuseIdentifier:@"cell3"];
        [_table registerNib:[UINib nibWithNibName:@"TR_OrderNumberCell" bundle:nil] forCellReuseIdentifier:@"cell4"];
        [_table registerNib:[UINib nibWithNibName:@"TR_OrderFootCell" bundle:nil] forCellReuseIdentifier:@"cell5"];
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
