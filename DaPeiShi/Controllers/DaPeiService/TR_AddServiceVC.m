//
//  TR_AddServiceVC.m
//  DaPeiShi
//
//  Created by admin on 2019/8/20.
//  Copyright © 2019 candy.chen. All rights reserved.
//

#import "TR_AddServiceVC.h"
#import "TR_AddServiceHeadView.h"

@interface TR_AddServiceVC ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView * table;
@property(nonatomic,strong)TR_AddServiceHeadView * headView;
@end

@implementation TR_AddServiceVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navView setLeftImg:@"back_gray" title:@"新增搭配服务" bgColor:UIColor.whiteColor];
    [self.navView.rightBtn setTitle:@"保存" forState:UIControlStateNormal];
    [self.navView.rightBtn setTitleColor:UICOLOR_RGBA(255, 46, 46) forState:UIControlStateNormal];
    self.navView.rightBtn.titleLabel.font=FONT_TEXT(14);
    [self.navView.rightBtn addClickEvent:self action:@selector(saveService)];
    [self table];
}
- (void)saveService{
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat row_h = 120;
    if (indexPath.row==0) {
        row_h = 277;
    }
    return row_h;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    if (cell==nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    if (indexPath.row==0) {
        [cell.contentView addSubview:self.headView];
    }
    return cell;
}
- (UITableView*)table{
    if (IsNilOrNull(_table)) {
        _table = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        [self.view addSubview:_table];
        _table.sd_layout.leftSpaceToView(self.view, 0)
        .rightSpaceToView(self.view, 0)
        .topSpaceToView(self.navView, 0)
        .bottomSpaceToView(self.view, kSafeAreaBottomHeight);
        _table.delegate = self;
        _table.dataSource = self;
        [_table registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
        _table.separatorStyle=UITableViewCellSeparatorStyleNone;
    }
    return _table;
}
- (TR_AddServiceHeadView*)headView{
    if (IsNilOrNull(_headView)) {
        _headView = (TR_AddServiceHeadView*)[[[NSBundle mainBundle]loadNibNamed:@"TR_AddServiceHeadView" owner:self options:nil]lastObject];
    }
    return _headView;
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
