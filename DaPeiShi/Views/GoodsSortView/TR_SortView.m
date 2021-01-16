//
//  TR_SortView.m
//  DaPeiShi
//
//  Created by xq的电脑 on 2019/6/17.
//  Copyright © 2019 candy.chen. All rights reserved.
//

#import "TR_SortView.h"
#import "TR_SortCell.h"

@interface TR_SortView ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIButton *resetBtn;
@property (weak, nonatomic) IBOutlet UIButton *confirmBtn;
@property (weak, nonatomic) IBOutlet UITableView *selectConditionTable;




@end

@implementation TR_SortView

- (void)awakeFromNib{
    [super awakeFromNib];
    
    self.selectConditionTable.delegate=self;
    self.selectConditionTable.dataSource=self;
    [self.selectConditionTable registerNib:[UINib nibWithNibName:@"TR_SortCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    self.selectConditionTable.separatorStyle=UITableViewCellSeparatorStyleNone;
}

- (IBAction)resetBtnAction:(UIButton *)sender {
    //重置
    [self.selectConditionTable reloadData];
}
- (IBAction)confirmAction:(UIButton *)sender {
    //确认
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TR_SortCell * cell =[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    cell.isSelect=NO;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    TR_SortCell * cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.isSelect = !cell.isSelect;
}
@end
