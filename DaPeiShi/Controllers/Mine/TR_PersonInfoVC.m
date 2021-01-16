//
//  TR_PersonInfoVC.m
//  DaPeiShi
//
//  Created by xq的电脑 on 2019/6/23.
//  Copyright © 2019 candy.chen. All rights reserved.
//

#import "TR_PersonInfoVC.h"
#import "TR_PersonCell.h"
#import "TR_PersonImgCell.h"

@interface TR_PersonInfoVC ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView * table;

@end

@implementation TR_PersonInfoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navView setLeftImg:@"back_gray" title:@"个人资料" bgColor:UIColor.whiteColor];
    [self table];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat rowHeight = 55;
    if (indexPath.row==0) {
        rowHeight=84;
    }
    return rowHeight;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    WS(weakSelf);
    if (indexPath.row==0) {
        TR_PersonImgCell * img_cell =[tableView dequeueReusableCellWithIdentifier:@"cell1" forIndexPath:indexPath];
        return img_cell;
    }else{
        TR_PersonCell * data_cell = [tableView dequeueReusableCellWithIdentifier:@"cell2" forIndexPath:indexPath];
        return data_cell;
    }
}
- (UITableView*)table{
    if (IsNilOrNull(_table)) {
        _table=[[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        [self.view addSubview:_table];
        _table.sd_layout.leftEqualToView(self.view).topSpaceToView(self.navView, 0).rightEqualToView(self.view).bottomSpaceToView(self.view, 0);
        _table.delegate=self;
        _table.dataSource=self;
        [_table registerNib:[UINib nibWithNibName:@"TR_PersonImgCell" bundle:nil] forCellReuseIdentifier:@"cell1"];
        [_table registerNib:[UINib nibWithNibName:@"TR_PersonCell" bundle:nil] forCellReuseIdentifier:@"cell2"];
        _table.separatorStyle=UITableViewCellSeparatorStyleNone;
      
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
