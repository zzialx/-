//
//  TR_SystemMesssageVC.m
//  DaPeiShi
//
//  Created by xq的电脑 on 2019/7/8.
//  Copyright © 2019 candy.chen. All rights reserved.
//

#import "TR_SystemMesssageVC.h"
#import "TR_SystemNoticeCell.h"

@interface TR_SystemMesssageVC ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView * msgTable;
@end

@implementation TR_SystemMesssageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navView setLeftImg:@"back_gray" title:@"官方通知" bgColor:UIColor.whiteColor];
    [self msgTable];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}
- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 10)];
    headView.backgroundColor=UIColor.whiteColor;
    return headView;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat rowH = 154;
    return rowH;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TR_SystemNoticeCell * systemNoticeCell = [tableView dequeueReusableCellWithIdentifier:@"cell1"];
    if (systemNoticeCell==nil) {
        systemNoticeCell = [[TR_SystemNoticeCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell1"];
    }   
    return systemNoticeCell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
- (UITableView*)msgTable{
    if (IsNilOrNull(_msgTable)) {
        _msgTable = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        [self.view addSubview:_msgTable];
        _msgTable.sd_layout.leftEqualToView(self.view).topSpaceToView(self.navView, 0).rightEqualToView(self.view).bottomSpaceToView(self.view, kSafeAreaBottomHeight);
        _msgTable.delegate=self;
        _msgTable.dataSource=self;
        [_msgTable registerNib:[UINib nibWithNibName:@"TR_SystemNoticeCell" bundle:nil] forCellReuseIdentifier:@"cell1"];

        
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
