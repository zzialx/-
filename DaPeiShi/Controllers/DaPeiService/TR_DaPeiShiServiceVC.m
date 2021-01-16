//
//  TR_DaPeiShiServiceVC.m
//  DaPeiShi
//
//  Created by admin on 2019/8/20.
//  Copyright © 2019 candy.chen. All rights reserved.
//

#import "TR_DaPeiShiServiceVC.h"
#import "TR_DaPeiShiServiceCell.h"
#import "TR_AddServiceVC.h"

@interface TR_DaPeiShiServiceVC ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView * table;
@end

@implementation TR_DaPeiShiServiceVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navView setLeftImg:@"back_gray" title:@"搭配服务管理" bgColor:UIColor.whiteColor];
    [self.navView.rightBtn setTitle:@"新增服务" forState:UIControlStateNormal];
    [self.navView.rightBtn setTitleColor:UICOLOR_RGBA(255, 46, 46) forState:UIControlStateNormal];
    self.navView.rightBtn.titleLabel.font=FONT_TEXT(14);
    [self.navView.rightBtn addClickEvent:self action:@selector(addDaPeiService)];
    [self table];
}
- (void)addDaPeiService{
    TR_AddServiceVC * vc = [[TR_AddServiceVC alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TR_DaPeiShiServiceCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell==nil) {
        cell = [[TR_DaPeiShiServiceCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
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
        [_table registerNib:[UINib nibWithNibName:@"TR_DaPeiShiServiceCell" bundle:nil] forCellReuseIdentifier:@"cell"];
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
