//
//  FirstTableViewController.m
//  TableViewFloat
//
//  Created by 李雪阳 on 2018/8/28.
//  Copyright © 2018年 singularity. All rights reserved.
//

#import "FirstTableViewController.h"
#import "FloatRankCell.h"
#import "NewSkipViewController.h"
#import "TR_FloatCommentCell.h"


@interface FirstTableViewController ()
@property(nonatomic,strong)NSMutableDictionary * showOpenDic;
@end

@implementation FirstTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.showOpenDic = [NSMutableDictionary dictionaryWithCapacity:0];
    for (int i = 0 ; i < 10; i++) {
        [self.showOpenDic setValue:@"0" forKey:[NSString stringWithFormat:@"%d_key",i]];
    }
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    if (!self.vcCanScroll) {
        scrollView.contentOffset = CGPointZero;
    }
    if (scrollView.contentOffset.y <= 0) {
        self.vcCanScroll = NO;
        scrollView.contentOffset = CGPointZero;
        //到顶通知父视图改变状态
        [[NSNotificationCenter defaultCenter] postNotificationName:@"leaveTop" object:nil];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 10;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell;
    if (indexPath.row==0) {
        FloatRankCell *rankCell = [tableView dequeueReusableCellWithIdentifier:@"rank"];
        if (rankCell == nil) {
            rankCell=(FloatRankCell*)[[[NSBundle mainBundle]loadNibNamed:@"FloatRankCell" owner:self options:nil]lastObject];
        }
        cell = rankCell;
        return cell;
    }
     BOOL isOpen = [[self.showOpenDic objectForKey:[NSString stringWithFormat:@"%ld_key",(long)indexPath.section]]boolValue];
    TR_FloatCommentCell * commentCell = [tableView dequeueReusableCellWithIdentifier:@"comment"];
    if (commentCell == nil) {
        commentCell =(TR_FloatCommentCell*) [[[NSBundle mainBundle]loadNibNamed:@"TR_FloatCommentCell" owner:self options:nil]lastObject];
    }
    commentCell.selectIndex = indexPath.section;
    if (isOpen) {
        for (int i =0; i<4; i++) {
            [commentCell.dataList addObject:[NSString stringWithFormat:@"%d",i]];
        }
    }else{
        for (int i =0; i<2; i++) {
            [commentCell.dataList addObject:[NSString stringWithFormat:@"%d",i]];
        }
    }
    WS(weakSelf);
    commentCell.updateCuurentTable = ^(NSInteger selectIndx) {
        [weakSelf.showOpenDic setValue:@"1" forKey:[NSString stringWithFormat:@"%ld_key",selectIndx]];
        [self.tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:1 inSection:selectIndx]] withRowAnimation:UITableViewRowAnimationNone];
        [UIView performWithoutAnimation:^{
            [self.tableView beginUpdates];
            [self.tableView endUpdates];
        }];
    };
    cell = commentCell;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat cellH = 125;
    if (indexPath.row == 0) {
        cellH = 125;
    }if (indexPath.row==1) {
        BOOL isOpen = [[self.showOpenDic objectForKey:[NSString stringWithFormat:@"%ld_key",(long)indexPath.section]]boolValue];
        if (isOpen) {
              cellH = 60*4+16*2+50;
        }else{
              cellH = 60*2+16*2+50;
        }
      
    }
    return cellH;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [_VC.navigationController pushViewController:[NewSkipViewController new] animated:YES];
}

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
