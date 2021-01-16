//
//  CommentTableVC.m
//  DaPeiShi
//
//  Created by admin on 2019/8/12.
//  Copyright © 2019 candy.chen. All rights reserved.
//

#import "CommentTableVC.h"
#import "CommentCell.h"

@interface CommentTableVC ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)NSMutableDictionary * openDic;

@end

@implementation CommentTableVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.openDic =[NSMutableDictionary dictionaryWithCapacity:0];
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    [self.tableView registerNib:[UINib nibWithNibName:@"CommentCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    self.tableView.backgroundColor=UICOLOR_RGBA(244, 244, 244);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CommentCell * tableCell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    if (tableCell==nil) {
        tableCell = [[CommentCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    tableCell.backgroundColor=UICOLOR_RGBA(244, 244, 244);
    return tableCell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 50;
}
- (UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView * footView = [UIView new];
    UIButton * seeAllCommentBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    seeAllCommentBtn.frame=CGRectMake(0, 10, 140, 30);
    [seeAllCommentBtn setImage:[UIImage imageNamed:@"raw"] forState:UIControlStateNormal];
    seeAllCommentBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;//设置按钮的位置居左
    [seeAllCommentBtn setTitle:@"共20条回复" forState:UIControlStateNormal];
    [seeAllCommentBtn setTitleColor:UICOLOR_RGBA(58, 124, 210) forState:UIControlStateNormal];
    seeAllCommentBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;// 水平左对齐
    seeAllCommentBtn.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;// 垂直居中对齐
    seeAllCommentBtn.titleLabel.font=FONT_TEXT(12);
    //获取文本的宽度
    CGRect rect = [seeAllCommentBtn.titleLabel.text boundingRectWithSize:CGSizeMake(MAXFLOAT, seeAllCommentBtn.titleLabel.height) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName : seeAllCommentBtn.titleLabel.font} context:nil];
    seeAllCommentBtn.imageEdgeInsets = UIEdgeInsetsMake(0, rect.size.width+12, 0, -rect.size.width);
    seeAllCommentBtn.titleEdgeInsets = UIEdgeInsetsMake(0, -seeAllCommentBtn.imageView.frame.size.width+10, 0, seeAllCommentBtn.imageView.frame.size.width);
    [seeAllCommentBtn addTarget:self action:@selector(seeAllComment:) forControlEvents:UIControlEventTouchUpInside];
    seeAllCommentBtn.tag = self.selectIndex;
    [footView addSubview:seeAllCommentBtn];
    return footView;
}
- (void)seeAllComment:(UIButton*)sender{
    NSLog(@"查看所有回复");
    [self.dataArray addObject:[NSString stringWithFormat:@"2"]];
    [self.dataArray addObject:[NSString stringWithFormat:@"3"]];
    if (self.updateCurrentCell) {
        self.updateCurrentCell(self.selectIndex);
    }
}
- (void)setSelectIndex:(NSInteger)selectIndex{
    _selectIndex = selectIndex;
    
}
/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
