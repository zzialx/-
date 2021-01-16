//
//  TR_CommentView.m
//  DaPeiShi
//
//  Created by admin on 2019/8/7.
//  Copyright © 2019 candy.chen. All rights reserved.
//

#import "TR_CommentView.h"

@interface TR_CommentView ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>
@property(strong, nonatomic)UITableView * tableView;
@property(strong, nonatomic)NSArray * commentList;
@end

@implementation TR_CommentView

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
    return 5;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell  * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text=@"测试1";
    cell.backgroundColor=UIColor.blueColor;
    return cell;
}
- (UITableView*)tableView{
    if (IsNilOrNull(_tableView)) {
        _tableView = [[UITableView alloc]initWithFrame:self.bounds style:UITableViewStylePlain];
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
