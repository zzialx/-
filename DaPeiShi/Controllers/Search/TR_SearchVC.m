//
//  TR_SearchVC.m
//  DaPeiShi
//
//  Created by xq的电脑 on 2019/6/22.
//  Copyright © 2019 candy.chen. All rights reserved.
//

#import "TR_SearchVC.h"
#import "TR_SearchView.h"
#import "TR_SortView.h"
#import "TR_SortHeadView.h"
#import "TR_SortResultCell.h"


@interface TR_SearchVC ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic,strong)TR_SearchView * searchHeadView;
@property (nonatomic,strong)TR_SortView * sortView;
@property (nonatomic,strong)TR_SortHeadView * sortHeadView;
@property (nonatomic,strong)UICollectionView * collectionView;
@end

@implementation TR_SearchVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=UIColor.whiteColor;
    [self searchHeadView];
    [self sortHeadView];
    [self collectionView];
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
        _collectionView.sd_layout.leftSpaceToView(self.view, 0).rightSpaceToView(self.view, 0).topSpaceToView(self.sortHeadView, 0).bottomSpaceToView(self.view, kSafeAreaBottomHeight);
        [_collectionView registerNib:[UINib nibWithNibName:@"TR_SortResultCell" bundle:nil] forCellWithReuseIdentifier:@"cell"];
        _collectionView.backgroundColor = UICOLOR_RGBA(255,255,255);
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
    }
    return _collectionView;
}
#pragma mark - UICollectionViewDelegate, UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 5;
}


/** cell的内容*/
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    TR_SortResultCell  * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGSize size = CGSizeMake(KScreenWidth, 307);
    return size;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 0, 0, 0);
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
}
- (TR_SortView*)sortView{
    if (IsNilOrNull(_sortView)) {
        _sortView = (TR_SortView*)[[[NSBundle mainBundle]loadNibNamed:@"TR_SortView" owner:self options:nil]lastObject];
        [self.view addSubview:_sortView];
    }
    return _sortView;
}
- (TR_SortHeadView*)sortHeadView{
    if (IsNilOrNull(_sortHeadView)) {
        _sortHeadView =  (TR_SortHeadView*)[[[NSBundle mainBundle]loadNibNamed:@"TR_SortHeadView" owner:self options:nil]lastObject];
        [self.view addSubview:_sortHeadView];
        _sortHeadView.sd_layout.leftSpaceToView(self.view, 0).rightSpaceToView(self.view, 0).topSpaceToView(self.searchHeadView, 19).heightIs(41);
        
    }
    return _sortHeadView;
}
- (TR_SearchView*)searchHeadView{
    if (IsNilOrNull(_searchHeadView)) {
        WS(weakSelf);
        _searchHeadView = (TR_SearchView*)[[[NSBundle mainBundle]loadNibNamed:@"TR_SearchView" owner:self options:nil]lastObject];
        [self.view addSubview:_searchHeadView];
        _searchHeadView.sd_layout.topSpaceToView(self.view, KNAV_STATUS_HEIGHT).leftEqualToView(self.view).rightEqualToView(self.view).heightIs(30);
        _searchHeadView.clickAction = ^(SEARCH_BTN_TYPE type) {
            if (type == SEARCH_BTN_TYPE_BACK) {
                [weakSelf.navigationController popViewControllerAnimated:YES];
            }if (type == SEARCH_BTN_TYPE_SOUSUO) {
                
            }
        };
    }
    return _searchHeadView;
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
