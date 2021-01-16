//
//  TR_SearchViewController.m
//  DaPeiShi
//
//  Created by admin on 2019/1/4.
//  Copyright © 2019年 candy.chen. All rights reserved.
//

#import "TR_SearchViewController.h"


@interface TR_SearchViewController ()
//<UICollectionViewDelegate,UICollectionViewDataSource>
//@property(nonatomic,strong)SearchBarView * searchView;
//@property(nonatomic,strong)TR_CollectionView * collectionView;
//@property(nonatomic,strong)NSMutableArray * historySList;
//@property(nonatomic,strong)NSMutableArray * hotSLsit;
//@property(nonatomic,assign)BOOL isHasHistrorySearch;///<是否有历史搜索
//@property(nonatomic,strong)SearchCacheManager * manager;
//@property(nonatomic,strong)TR_SearchViewModel * searchVM;
@end

@implementation TR_SearchViewController
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    self.historySList = [self.manager getSearchHistory].mutableCopy;
//    [self.collectionView reloadData];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navView.hidden = YES;
    self.view.backgroundColor=UIColor.whiteColor;
//    self.isHasHistrorySearch = YES;
//    self.manager = [SearchCacheManager sharedManager];
//    self.hotSLsit = [NSMutableArray arrayWithCapacity:0];
//    [self searchView];
//    if (self.isShowHotGoods) {
//        [self collectView];
//    }

}
/*
#pragma mark -- UICollectionViewDelegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return  self.historySList.count>0?2:1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.historySList.count>0?(section==0?self.historySList.count:self.hotSLsit.count):self.hotSLsit.count;
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    WS(weakSelf);
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        TR_SearchHeaderReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"classHeader" forIndexPath:indexPath];
        header.delHistory = ^{
            [weakSelf.manager deleateAllHistroy];
            weakSelf.historySList = nil;
            [weakSelf.collectionView reloadData];
        };
        if (self.historySList.count>0) {
            if (indexPath.section==0) {
                [header setHeadName:@"历史搜索" isShowBtn:NO];
            }if (indexPath.section==1) {
                [header setHeadName:@"热门搜索" isShowBtn:YES];
            }
        }else{
            [header setHeadName:@"热门搜索" isShowBtn:YES];
        }
        return header;
    }
    return nil;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    __weak TR_SearchCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell1" forIndexPath:indexPath];
    [cell showCloseBtn:NO];
    if (self.historySList.count>0) {
        if (indexPath.section==0) {
            [cell showTeaName:self.historySList[indexPath.row] index:indexPath.row];
            WS(weakSelf);
            cell.delItem = ^(NSInteger index) {
                [weakSelf.manager deleateOneHistory:index];
                weakSelf.historySList = [self.manager getSearchHistory].mutableCopy;
                [weakSelf.collectionView reloadData];
            };
            cell.longPress = ^{
                [cell showCloseBtn:YES];
            };
        }else{
            [cell showTeaName:self.hotSLsit[indexPath.row] index:indexPath.row];
        }
    }else{
        [cell showTeaName:self.hotSLsit[indexPath.row] index:indexPath.row];
    }
    return cell;
    
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *name = self.historySList.count>0?(indexPath.section == 0 ? self.historySList[indexPath.row] : self.hotSLsit[indexPath.row]):self.hotSLsit[indexPath.row];
    CGSize size = [name  sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14.f]}];
    /// 30是左右各15，不至于Label贴边,有减号按钮，右侧又多了8
    //15是角标的宽度
    CGFloat properWidth = MIN(KScreenWidth - 30, size.width+15);
    return CGSizeMake((properWidth + 30), 34);
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(KScreenWidth, 40);
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(5, 10, 5, 5);
}
- (CGFloat) collectionView:(UICollectionView *)collectionView
                    layout:(UICollectionViewLayout *)collectionViewLayout
minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 6.0f;
}
- (CGFloat) collectionView:(UICollectionView *)collectionView
                    layout:(UICollectionViewLayout *)collectionViewLayout
minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 10.0f;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    //失去相应
    [self resignFirstResponder];
   
}
#pragma mark UICOLLECTVIEW
- (UICollectionView *)collectView
{
    if (_collectionView == nil) {
        UICollectionViewLeftAlignedLayout *layout = [[UICollectionViewLeftAlignedLayout alloc] init];
        [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
        layout.minimumLineSpacing = 3;
        layout.minimumInteritemSpacing = 3;
        _collectionView = [[TR_CollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        [self.view addSubview:_collectionView];
        _collectionView.sd_layout.leftSpaceToView(self.view, 0).rightSpaceToView(self.view, 0).topSpaceToView(self.searchView, 0).bottomSpaceToView(self.view, 0);
        _collectionView.backgroundColor = [UIColor whiteColor];
        [_collectionView registerNib:[UINib nibWithNibName:@"TR_SearchCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"cell1"];
        [_collectionView registerNib:[UINib nibWithNibName:@"TR_SearchHeaderReusableView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"classHeader"];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
    }
    return _collectionView;
}
- (TR_SearchViewModel*)searchVM{
    if (IsNilOrNull(_searchVM)) {
        _searchVM=[[TR_SearchViewModel alloc]init];
    }
    return _searchVM;
}
-(BOOL)canBecomeFirstResponder{
    return YES;
}
*/
@end
