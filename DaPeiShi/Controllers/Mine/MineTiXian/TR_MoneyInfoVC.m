//
//  TR_MoneyInfoVC.m
//  DaPeiShi
//
//  Created by admin on 2019/8/22.
//  Copyright © 2019 candy.chen. All rights reserved.
//

#import "TR_MoneyInfoVC.h"
#import "TR_MoneyInfoCell.h"
#import "TR_MoneyInfoFootView.h"

@interface TR_MoneyInfoVC ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView * table;

@end

@implementation TR_MoneyInfoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navView setLeftImg:@"back_gray" title:@"demo测试" bgColor:UIColor.whiteColor];
    [self.navView.rightBtn setTitle:@"查看协议" forState:UIControlStateNormal];
    [self.navView.rightBtn setTitleColor:UICOLOR_RGBA(255, 46, 46) forState:UIControlStateNormal];
    self.navView.rightBtn.titleLabel.font=FONT_TEXT(14);
    [self.navView.rightBtn addClickEvent:self action:@selector(setInfo)];
    [self table];
}
- (void)setInfo{
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 80;
}
- (UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    TR_MoneyInfoFootView * footView = (TR_MoneyInfoFootView*)[[[NSBundle mainBundle]loadNibNamed:@"TR_MoneyInfoFootView" owner:self options:nil]lastObject];
    footView.frame=CGRectMake(0, 0, KScreenWidth, 80);
    footView.backgroundColor=TABLECOLOR;
    return footView;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TR_MoneyInfoCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell==nil) {
        cell = [[TR_MoneyInfoCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    return cell;
}
- (UITableView*)table{
    if (IsNilOrNull(_table)) {
        _table = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        [self.view addSubview:_table];
        _table.sd_layout.leftSpaceToView(self.view, 0)
        .topSpaceToView(self.navView, 0)
        .rightSpaceToView(self.view, 0)
        .bottomSpaceToView(self.view, kSafeAreaBottomHeight);
        _table.delegate = self;
        _table.dataSource = self;
        [_table registerNib:[UINib nibWithNibName:@"TR_MoneyInfoCell" bundle:nil] forCellReuseIdentifier:@"cell"];
        _table.separatorStyle = UITableViewCellSeparatorStyleNone;
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
