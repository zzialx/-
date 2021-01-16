//
//  TR_LikeNoticeVC.m
//  DaPeiShi
//
//  Created by xq的电脑 on 2019/7/8.
//  Copyright © 2019 candy.chen. All rights reserved.
//

#import "TR_LikeNoticeVC.h"
#import "TR_LikeClothingCell.h"

@interface TR_LikeNoticeVC ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView * msgTable;
@end

@implementation TR_LikeNoticeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navView setLeftImg:@"back_gray" title:@"喜欢详情" bgColor:UIColor.whiteColor];
    [self msgTable];

}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 6;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat rowH = 62;
    return rowH;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TR_LikeClothingCell * systemNoticeCell = [tableView dequeueReusableCellWithIdentifier:@"cell1"];
    if (systemNoticeCell==nil) {
        systemNoticeCell = [[TR_LikeClothingCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell1"];
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
        [_msgTable registerNib:[UINib nibWithNibName:@"TR_LikeClothingCell" bundle:nil] forCellReuseIdentifier:@"cell1"];
        _msgTable.separatorStyle=UITableViewCellSeparatorStyleNone;
        
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
