//
//  TR_DataShareVC.m
//  DaPeiShi
//
//  Created by admin on 2019/8/16.
//  Copyright © 2019 candy.chen. All rights reserved.
//

#import "TR_DataShareVC.h"
#import "DataShareHeadView.h"
#import "TR_DataShareMineVC.h"
#import "TR_DataShareOtherVC.h"
#import "TR_DataFootView.h"
#import "TR_CreatDataPhoneVC.h"


#define HAED_SCROLLVIEW 50
#define SCROLLVIEW_H   KScreenHeight - HAED_SCROLLVIEW-KNAV_HEIGHT 

@interface TR_DataShareVC ()<UIScrollViewDelegate>
@property(nonatomic,strong)DataShareHeadView *header;
@property(nonatomic,strong)NSMutableArray *headMenus;
@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,strong)NSMutableArray *contentVCList;
@property(nonatomic,strong)UIButton * searchBtn;
@property(nonatomic,strong)TR_DataFootView * footView;

@end

@implementation TR_DataShareVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if (@available(iOS 11.0, *)) {
        self.scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    [self.navView setLeftImg:@"back_gray" title:@"demo测试" bgColor:UIColor.whiteColor];
    self.headMenus = [NSMutableArray arrayWithArray:@[@"测试1",@"测试2"]];
    self.contentVCList = [NSMutableArray new];
    [self.header setDataList:self.headMenus];
    [self scrollView];
    [self initScrollViewSubView];
    [self footView];
    [self.scrollView setContentOffset:CGPointMake(0*KScreenWidth, 0) animated:YES];
    self.header.selectIndex=0;
}
- (UIScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, KNAV_HEIGHT+HAED_SCROLLVIEW, KScreenWidth, SCROLLVIEW_H)];
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
            TR_DataShareMineVC *vc = [[TR_DataShareMineVC alloc] init];
            [self addChildViewController:vc];
            vc.view.frame = CGRectMake(i*KScreenWidth, 0, KScreenWidth, SCROLLVIEW_H);
            [self.scrollView addSubview:vc.view];
        }else{
            TR_DataShareOtherVC *vc = [[TR_DataShareOtherVC alloc] init];
            [self addChildViewController:vc];
            vc.view.frame = CGRectMake(i*KScreenWidth, 0, KScreenWidth, SCROLLVIEW_H);
            [self.scrollView addSubview:vc.view];
        }
    }
    self.scrollView.contentSize = CGSizeMake(KScreenWidth * self.headMenus.count, SCROLLVIEW_H);
}

- (DataShareHeadView *)header{
    if (!_header) {
        _header = [[DataShareHeadView alloc]initWithFrame:CGRectZero];
        [self.view addSubview:_header];
        _header.sd_layout.leftSpaceToView(self.view, 0)
        .rightEqualToView(self.view)
        .topSpaceToView(self.view, KNAV_HEIGHT)
        .heightIs(HAED_SCROLLVIEW);
        _header.backgroundColor = [UIColor whiteColor];
        WS(weakSelf);
        _header.selectDataType  = ^(NSInteger index) {
            [weakSelf.scrollView setContentOffset:CGPointMake(index*KScreenWidth, 0) animated:YES];
            weakSelf.scrollView.bouncesZoom = NO;
        };
    }
    return _header;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger index = scrollView.contentOffset.x / scrollView.frame.size.width;
    [self.header setSelectIndex:index];
}
- (TR_DataFootView*)footView{
    if (IsNilOrNull(_footView)) {
        _footView =(TR_DataFootView*) [[[NSBundle mainBundle]loadNibNamed:@"TR_DataFootView" owner:self options:nil]lastObject];
        [self.view addSubview:_footView];
        _footView.sd_layout.leftSpaceToView(self.view, 0)
        .bottomSpaceToView(self.view, kSafeAreaBottomHeight)
        .rightSpaceToView(self.view, 0)
        .heightIs(66);
        WS(weakSelf);
        _footView.shareData = ^(NSInteger index) {
            if (index==999) {
                NSLog(@"分享自己的数据");
                
            }
            if (index==1000) {
                NSLog(@"创建共享数据");
                TR_CreatDataPhoneVC * vc = [[TR_CreatDataPhoneVC alloc]init];
                [weakSelf.navigationController pushViewController:vc animated:YES];
            }
        };
    }
    return _footView;
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
