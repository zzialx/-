//
//  TR_MineOrderVC.m
//  DaPeiShi
//
//  Created by xq的电脑 on 2019/6/23.
//  Copyright © 2019 candy.chen. All rights reserved.
//

#import "TR_MineOrderVC.h"
#import "TR_OrderCell.h"
#import "TR_OrderBottomCell.h"
#import "TR_OrderDetialVC.h"

@interface TR_MineOrderVC ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView * table;
@end

@implementation TR_MineOrderVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navView setLeftImg:@"back_gray" title:@"我的订单" bgColor:UIColor.whiteColor];

    [self table];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 10;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger count = 2;
    if (section>5) {
        count = 1;
    }
    return count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}
- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 10)];
    headView.backgroundColor=UICOLOR_RGBA(242, 242, 242);
    return headView;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat rowHeight = 141;
    if (indexPath.section>5) {
        rowHeight = 141;
    }else{
        if (indexPath.row==0) {
            rowHeight = 141;
        }if (indexPath.row==1) {
            rowHeight = 41;
        }
    }
    return rowHeight;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell;
    if (indexPath.row==0) {
        TR_OrderCell * orderTopCell = [tableView dequeueReusableCellWithIdentifier:@"cell1"];
        if (orderTopCell == nil) {
            orderTopCell = [[TR_OrderCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell1"];
        }
        cell = orderTopCell;
    }
    if (indexPath.row==1) {
        TR_OrderBottomCell * orderBottomCell = [tableView dequeueReusableCellWithIdentifier:@"cell2"];
        if (orderBottomCell == nil) {
            orderBottomCell = [[TR_OrderBottomCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell2"];
        }
        cell = orderBottomCell;

    }
    return cell;
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
        [_table registerNib:[UINib nibWithNibName:@"TR_OrderCell" bundle:nil] forCellReuseIdentifier:@"cell1"];
        [_table registerNib:[UINib nibWithNibName:@"TR_OrderBottomCell" bundle:nil] forCellReuseIdentifier:@"cell2"];

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
