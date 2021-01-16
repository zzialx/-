//
//  TR_CommentNoticeVC.m
//  DaPeiShi
//
//  Created by xq的电脑 on 2019/7/8.
//  Copyright © 2019 candy.chen. All rights reserved.
//

#import "TR_CommentNoticeVC.h"
#import "TR_CommentNoticeCell.h"
#import "TR_LikeClothingCell.h"


@interface TR_CommentNoticeVC ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView * msgTable;
@end

@implementation TR_CommentNoticeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navView setLeftImg:@"back_gray" title:@"评论通知" bgColor:UIColor.whiteColor];
    [self msgTable];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat rowH = 62;
    if (indexPath.row==1) {
        rowH = 41;
    }
    return rowH;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell;
    if (indexPath.row==0) {
        TR_LikeClothingCell * systemNoticeCell = [tableView dequeueReusableCellWithIdentifier:@"cell1"];
        if (systemNoticeCell==nil) {
            systemNoticeCell = [[TR_LikeClothingCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell1"];
        }
        cell = systemNoticeCell;
    }
    if (indexPath.row==1) {
        TR_CommentNoticeCell * commentNoticeCell = [tableView dequeueReusableCellWithIdentifier:@"cell2"];
        if (commentNoticeCell == nil) {
            commentNoticeCell = [[TR_CommentNoticeCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell2"];
        }
        cell=commentNoticeCell;
    }
    return cell;
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
        [_msgTable registerNib:[UINib nibWithNibName:@"TR_CommentNoticeCell" bundle:nil] forCellReuseIdentifier:@"cell2"];

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
