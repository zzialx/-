//
//  TR_LikeDressView.m
//  DaPeiShi
//
//  Created by admin on 2019/8/7.
//  Copyright © 2019 candy.chen. All rights reserved.
//

#import "TR_LikeDressView.h"
@interface TR_LikeDressView ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>
@property(strong, nonatomic)UITableView * tableView;
@property(strong, nonatomic)NSArray * commentList;
@end
@implementation TR_LikeDressView
- (void)updateTableHeight:(CGFloat)height{
    self.tableView.height = height;
}

- (instancetype)initWithFrame:(CGRect)frame data:(NSArray*)data{
    self = [super initWithFrame:frame];
    if (self) {
        self.commentList = data;
        [self setUI];
    }
    return self;
}
- (void)setUI{
    [self tableView];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell  * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.backgroundColor=UIColor.redColor;
    cell.textLabel.text=@"测试12";

    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}
- (UITableView*)tableView{
    if (IsNilOrNull(_tableView)) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.width, self.height) style:UITableViewStylePlain];
        [self addSubview:_tableView];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
        _tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
        _tableView.contentSize=CGSizeMake(self.width, 0);
        _tableView.alwaysBounceVertical = NO;

    }
    return _tableView;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
