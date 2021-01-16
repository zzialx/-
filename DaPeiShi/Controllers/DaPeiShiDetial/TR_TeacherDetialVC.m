//
//  TR_TeacherDetialVC.m
//  DaPeiShi
//
//  Created by admin on 2019/8/16.
//  Copyright © 2019 candy.chen. All rights reserved.
//

#import "TR_TeacherDetialVC.h"
#import "TR_CommentView.h"
#import "TR_LikeDressView.h"
#import "FloatHeader.h"
#import "GestureTableView.h"
#import "FDSlideBar.h"
#import "TR_DaPeiShiContainCell.h"
#import "FloatTableCell.h"
#import "FloatHeadView.h"
#import "TR_DressHeadView.h"
#import "TR_DaPeiShiHeadView.h"

#define sliderHeight 49

@interface TR_TeacherDetialVC ()<UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource,TR_DaPeiShiContainCellDelegate>
@property (nonatomic, strong) GestureTableView *tableView;
@property (nonatomic, strong) FDSlideBar *sliderView;
@property (nonatomic, strong) TR_DaPeiShiContainCell *containerCell;
@property (nonatomic, assign) BOOL canScroll;
@property (nonatomic, assign) NSInteger selectIndex;
@property(nonatomic,strong)UIView * headView;///<顶部白色导航条
@end

@implementation TR_TeacherDetialVC

- (void)viewDidLoad{
    [super viewDidLoad];
    [self.navView setLeftImg:@"back_gray" title:@"" bgColor:UIColor.whiteColor];
    [self headView];
    [self setTable];
    self.canScroll = YES;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeScrollStatus) name:@"leaveTop" object:nil];
}

- (void)setHeadBtnState:(CGFloat)offset{
   
}
- (void)changeScrollStatus{
    self.canScroll = YES;
    self.containerCell.objectCanScroll = NO;
}

#pragma mark clickEvent
- (void)setTable{
    [self.view addSubview:self.tableView];
    TR_DaPeiShiHeadView * headView = (TR_DaPeiShiHeadView*) [[[NSBundle mainBundle]loadNibNamed:@"TR_DaPeiShiHeadView" owner:self options:nil]lastObject];
    _tableView.tableHeaderView=headView;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        
    }
}

#pragma mark ——————————UIScrollViewDelegate——————————
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView == self.tableView) {
        CGFloat bottomCellOffset = [self.tableView rectForSection:0].origin.y;
        bottomCellOffset = floorf(bottomCellOffset);
        NSLog(@"滑动距离===%lf",bottomCellOffset);
        //设置头部透明度
        CGFloat progress = scrollView.contentOffset.y/KNAV_HEIGHT;
        self.headView.alpha = progress;
        if (scrollView.contentOffset.y >= bottomCellOffset) {
            scrollView.contentOffset = CGPointMake(0, bottomCellOffset);
            if (self.canScroll) {
                self.canScroll = NO;
                self.containerCell.objectCanScroll = YES;
            }
        }else{
            //子视图没到顶部
            if (!self.canScroll) {
                scrollView.contentOffset = CGPointMake(0, bottomCellOffset);
            }
        }
    }
}
#pragma mark ——————————UIScrollViewDelegate——————————


#pragma mark ——————————FloatContainerCellDelegate——————————
- (void)containerScrollViewDidScroll:(UIScrollView *)scrollView{
    self.tableView.scrollEnabled = NO;
}

- (void)containerScrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSUInteger page = scrollView.contentOffset.x/SCREEN_WIDTH;
    [UIView animateWithDuration:0.5 animations:^{
        [self.sliderView selectSlideBarItemAtIndex:page];
    }];
    
    self.tableView.scrollEnabled = YES;
}
#pragma mark ——————————FloatContainerCellDelegate——————————

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TR_DaPeiShiContainCell *containCell=[tableView dequeueReusableCellWithIdentifier:@"container"];
    containCell=[[TR_DaPeiShiContainCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"container"];
    containCell.VC=self;
    self.containerCell=containCell;
    containCell.delegate=self;
    return containCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return KScreenHeight-KNAV_HEIGHT-sliderHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return sliderHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return self.sliderView;
}

- (UIView*)headView{
    if (!_headView) {
        _headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, self.navView.height)];
        _headView.backgroundColor=UIColor.whiteColor;
        [self.view addSubview:self.headView];
        //加返回键和标题
#warning 自定义view
        
        _headView.alpha=0;
    }
    return _headView;
}
- (GestureTableView *)tableView{
    if (!_tableView) {
        _tableView=[[GestureTableView alloc]initWithFrame:CGRectMake(0, KNAV_HEIGHT, SCREEN_WIDTH, KScreenHeight-KNAV_HEIGHT) style:UITableViewStyleGrouped];
        _tableView.delegate=self;
        _tableView.dataSource=self;
        _tableView.sectionFooterHeight=0;
        _tableView.showsVerticalScrollIndicator=NO;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.estimatedSectionHeaderHeight = 0;
        _tableView.estimatedSectionFooterHeight = 0;
    }
    return _tableView;
}
- (FDSlideBar *)sliderView{//滑块部分可任意替换
    if (!_sliderView) {
        NSArray *itemArr=@[@"测试1",@"测试2",@"测试3"];
        _sliderView = [[FDSlideBar alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, sliderHeight)];
        _sliderView.backgroundColor = [UIColor whiteColor];
        _sliderView.itemsWidth=SCREEN_WIDTH/itemArr.count;
        _sliderView.itemsTitle = itemArr;
        _sliderView.itemColor = [UIColor colorWithHexString:@"272829"];
        _sliderView.itemSelectedColor = [UIColor colorWithHexString:@"f2441c"];
        //        _sliderView.sliderColor = [UIColor colorWithHexString:@"f2441c"];
        _sliderView.sliderColor = UIColor.orangeColor;
        [_sliderView slideBarItemSelectedCallback:^(NSUInteger idx) {
            [UIView animateWithDuration:0.5 animations:^{
                //刷新数据源
                self.containerCell.isSelectIndex = YES;
                [self.containerCell.scrollView setContentOffset:CGPointMake(idx*SCREEN_WIDTH, 0) animated:YES];
            }];
        }];
    }
    return _sliderView;
}


@end
