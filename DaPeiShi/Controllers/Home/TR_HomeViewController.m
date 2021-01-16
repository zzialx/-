//
//  TR_HomeViewController.m
//  DaPeiShi
//
//  Created by xq的电脑 on 2019/6/16.
//  Copyright © 2019 candy.chen. All rights reserved.
//

#import "TR_HomeViewController.h"
#import "TR_BindPhoneVC.h"
#import "SDCycleScrollView.h"
#import "TR_SortView.h"
#import "TR_DaPeiShiView.h"
#import "TR_FourWordCell.h"
#import "TR_HomeDaPeiShiCell.h"
#import "TR_DressShowCell.h"
#import "TR_SearchVC.h"
#import "TR_TeacherDetialVC.h"

@interface TR_HomeViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic,strong)UICollectionView * collectionView;
@property (nonatomic,strong)UIView * searchView;
@property (nonatomic,strong)TR_SortView * sortView;
@property (nonatomic,strong)TR_DaPeiShiView * daPeiShiView;

@end

@implementation TR_HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=UIColor.whiteColor;
    // Do any additional setup after loading the view.
    if (@available(iOS 11.0, *)) {
        self.collectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    [self searchView];
    [self.searchView addClickEvent:self action:@selector(showSearch)];
    [self collectionView];
}
- (void)showSearch{
    TR_SearchVC * sVC = [[TR_SearchVC alloc]init];
    [self.navigationController pushViewController:sVC animated:YES hideBottomTabBar:YES];
    
}
#pragma mark UICOLLECTVIEW
- (UICollectionView *)collectionView
{
    if (_collectionView == nil) {
        UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
        layout.minimumLineSpacing=3;
        layout.minimumInteritemSpacing=3;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        [self.view addSubview:_collectionView];
        _collectionView.sd_layout.leftSpaceToView(self.view, 0).rightSpaceToView(self.view, 0).topSpaceToView(self.searchView, 0).bottomSpaceToView(self.view, 0);
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
        [_collectionView registerClass:[TR_HomeDaPeiShiCell class] forCellWithReuseIdentifier:@"cell2"];
        [_collectionView registerNib:[UINib nibWithNibName:@"TR_FourWordCell" bundle:nil] forCellWithReuseIdentifier:@"cell3"];
        [_collectionView registerNib:[UINib nibWithNibName:@"TR_DressShowCell" bundle:nil] forCellWithReuseIdentifier:@"cell4"];
        _collectionView.backgroundColor = UICOLOR_RGBA(255,255,255);
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
    }
    return _collectionView;
}
#pragma mark - UICollectionViewDelegate, UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 4;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSInteger count = 0;
    if (section == 0) {
        count = 1;
    }if (section==1) {
        count=1;
    }if (section == 2) {
        count = 4;
    }if (section == 3) {
        count = 5;
    }
    return count;
}
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{

}
/** cell的内容*/
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    WS(weakSelf);
    UICollectionViewCell  * cell ;
    if (indexPath.section==1) {
        TR_HomeDaPeiShiCell * daPeiShiCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell2" forIndexPath:indexPath];
        daPeiShiCell.clickTeacher = ^(NSString *actionId) {
            TR_TeacherDetialVC * vc = [[TR_TeacherDetialVC alloc]init];
            [weakSelf.navigationController pushViewController:vc animated:NO hideBottomTabBar:YES];
        };
        cell = daPeiShiCell;
    }
    if (indexPath.section==2) {
        TR_FourWordCell * fourWordCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell3" forIndexPath:indexPath];
        cell = fourWordCell;
    }
    if (indexPath.section==0) {
        cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
        cell.backgroundColor=UIColor.orangeColor;
    }
    if (indexPath.section==3) {
        TR_DressShowCell * dressCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell4" forIndexPath:indexPath];
        cell = dressCell;
    }
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGSize size = CGSizeZero;
    if (indexPath.section== 1) {
        size = CGSizeMake(KScreenWidth-24, 110);
    }if (indexPath.section==0) {
        size = CGSizeMake(KScreenWidth-24, 200);
    }if (indexPath.section==3) {
        size = CGSizeMake(KScreenWidth, 470);
    }
    if (indexPath.section==2) {
        size = CGSizeMake((KScreenWidth - 36)/2, 100);
    }
    return size;
}
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
//    return CGSizeMake(KScreenWidth -24, 50);
//}
//-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
//    CGSize size = CGSizeMake(KScreenWidth-24, section==4?50:0);
//    return size;
//}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(5, 12, 5, 12);
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

}
- (UIView*)searchView{
    if (IsNilOrNull(_searchView)) {
        _searchView=[[UIView alloc]initWithFrame:CGRectMake(0, KNAV_STATUS_HEIGHT, KScreenWidth, 30)];
        [self.view addSubview:_searchView];
        _searchView.backgroundColor=UIColor.redColor;
    }
    return _searchView;
}
- (void)clikci:(UIButton*)sender{
//    TR_BindPhoneVC * pVC = [[TR_BindPhoneVC alloc]init];
//    [self.navigationController pushViewController:pVC animated:YES hideBottomTabBar:YES];
    [self.view addSubview:self.daPeiShiView];
}
- (TR_SortView*)sortView{
    if (IsNilOrNull(_sortView)) {
        _sortView = (TR_SortView*)[[[NSBundle mainBundle]loadNibNamed:@"TR_SortView" owner:self options:nil]lastObject];
        _sortView.frame=CGRectMake(0, 200, KScreenWidth, 310);
        [self.view addSubview:_sortView];
    }
    return _sortView;
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
