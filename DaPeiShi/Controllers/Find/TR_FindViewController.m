//
//  TR_FindViewController.m
//  DaPeiShi
//
//  Created by xq的电脑 on 2019/6/16.
//  Copyright © 2019 candy.chen. All rights reserved.
//

#import "TR_FindViewController.h"
#import "TR_PublichDressPicVC.h"
#import "TR_PublishDressVideoVC.h"
#import "TR_SecondKillSegmentView.h"
#import "TR_FindNewDressVC.h"
#import "TR_FindFouceDressVC.h"

#define HAED_SCROLLVIEW 50
#define SCROLLVIEW_H   KScreenHeight - HAED_SCROLLVIEW-STATUS_BAR_HEIGHT - STATUS_TABBAT_HEIGHT
@interface TR_FindViewController ()<UIScrollViewDelegate>
@property(nonatomic,strong)TR_SecondKillSegmentView *header;
@property(nonatomic,strong)NSMutableArray *headMenus;
@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,strong)NSMutableArray *contentVCList;
@property(nonatomic,strong)UIButton * searchBtn;
@end

@implementation TR_FindViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if (@available(iOS 11.0, *)) {
        self.scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    self.view.backgroundColor=UIColor.whiteColor;
    self.navView.hidden=YES;
    self.headMenus = [NSMutableArray arrayWithArray:@[@"全部",@"关注"]];
    self.contentVCList = [NSMutableArray new];
    [self.header setDataList:self.headMenus];
    [self searchBtn];
    [self scrollView];
    [self initScrollViewSubView];
    [self.scrollView setContentOffset:CGPointMake(0*KScreenWidth, 0) animated:YES];
    self.header.selectIndex=0;
}
- (UIScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, STATUS_BAR_HEIGHT+HAED_SCROLLVIEW, KScreenWidth, SCROLLVIEW_H)];
        _scrollView.backgroundColor=UIColor.orangeColor;
        _scrollView.delegate=self;
        [self.view addSubview:_scrollView];
        _scrollView.pagingEnabled = YES;
    }
    return _scrollView;
}

- (void)initScrollViewSubView{
    for (int i = 0; i<self.headMenus.count; i++) {
        if (i==0) {
            TR_FindNewDressVC *vc = [[TR_FindNewDressVC alloc] init];
            [self addChildViewController:vc];
            vc.view.frame = CGRectMake(i*KScreenWidth, 0, KScreenWidth, SCROLLVIEW_H);
            [self.scrollView addSubview:vc.view];
        }else{
            TR_FindFouceDressVC *vc = [[TR_FindFouceDressVC alloc] init];
            [self addChildViewController:vc];
            vc.view.frame = CGRectMake(i*KScreenWidth, 0, KScreenWidth, SCROLLVIEW_H);
            [self.scrollView addSubview:vc.view];
        }
    }
    self.scrollView.contentSize = CGSizeMake(KScreenWidth * self.headMenus.count, SCROLLVIEW_H);
}

- (TR_SecondKillSegmentView *)header{
    if (!_header) {
        _header = [[TR_SecondKillSegmentView alloc]initWithFrame:CGRectZero];
        [self.view addSubview:_header];
        _header.sd_layout.leftSpaceToView(self.view, 0)
        .rightEqualToView(self.view)
        .topSpaceToView(self.view, KNAV_STATUS_HEIGHT)
        .heightIs(HAED_SCROLLVIEW);
        _header.backgroundColor = [UIColor whiteColor];
        WS(weakSelf);
        _header.selectTime  = ^(NSInteger index) {
            [weakSelf.scrollView setContentOffset:CGPointMake(index*KScreenWidth, 0) animated:YES];
            weakSelf.scrollView.bouncesZoom = NO;
        };
    }
    return _header;
}
- (UIButton*)searchBtn{
    if (IsNilOrNull(_searchBtn)) {
        _searchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.header addSubview:_searchBtn];
        _searchBtn.sd_layout.rightSpaceToView(self.header, 20)
        .topSpaceToView(self.header, 15)
        .widthIs(20)
        .heightIs(20);
        [_searchBtn setBackgroundImage:[UIImage imageNamed:@"search"] forState:UIControlStateNormal];
    }
    return _searchBtn;
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger index = scrollView.contentOffset.x / scrollView.frame.size.width;
    [self.header setSelectIndex:index];
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
