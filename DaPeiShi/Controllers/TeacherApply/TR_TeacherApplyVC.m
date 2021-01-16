
//
//  TR_TeacherApplyVC.m
//  DaPeiShi
//
//  Created by admin on 2019/8/19.
//  Copyright © 2019 candy.chen. All rights reserved.
//

#import "TR_TeacherApplyVC.h"
#import "TR_TeacherHeadView.h"
#import "TR_TeacherInfoView.h"
#import "TR_TeacherStyleView.h"
#import "TR_TeacherApplyReuView.h"
#import "TR_CollectionView.h"
#import "TR_TeacherApplyFootView.h"
#import "TR_TeacherApplyCell.h"


static NSString *HeaderID = @"header";
static NSString *FootID = @"footer";


@interface TR_TeacherApplyVC ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (strong,nonatomic)TR_CollectionView * collectionView;
@property (strong,nonatomic)TR_TeacherHeadView * headView;
@property (strong,nonatomic)TR_TeacherInfoView * infoView;
@property (strong,nonatomic)TR_TeacherApplyFootView * footView;
@end

@implementation TR_TeacherApplyVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navView setLeftImg:@"back_gray" title:@"申请搭配师" bgColor:UIColor.whiteColor];
    [self collectionView];
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 4;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    CGFloat rowCount = 1;
    if (section==0) {
        rowCount = 1;
    }if (section==1) {
        rowCount = 1;
    }if (section==2) {
        rowCount = 5;
    }if (section==3) {
        rowCount=6;
    }
    return rowCount;
}


// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    TR_TeacherApplyCell *cellStyle = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell1" forIndexPath:indexPath];
    if (indexPath.section==0) {
        [cell.contentView addSubview:self.headView];
    }
    if (indexPath.section==1) {
        [cell.contentView addSubview:self.infoView];
    }
    if (indexPath.section==2||indexPath.section==3) {
        [cellStyle showName:@"肤白貌美色" isSelect:NO];
        return cellStyle;
    }
    return cell;
}


// The view that is returned must be retrieved from a call to -dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        TR_TeacherApplyReuView *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:HeaderID forIndexPath:indexPath];
        header.backgroundColor=UIColor.whiteColor;
        return header;
    }
    if ([kind isEqualToString:UICollectionElementKindSectionFooter]) {
        UICollectionReusableView *foot = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:FootID forIndexPath:indexPath];
        foot.backgroundColor=UICOLOR_RGBA(247, 247, 247);
        return foot;
    }
    return nil;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    //    NSString *name = self.hotSLsit[indexPath.row]
    if (indexPath.section==2||indexPath.section==3) {
        NSString *name = @"肤白貌美色";
        CGSize size = [name  sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14.f]}];
        CGFloat properWidth = MIN(KScreenWidth - 30, size.width+15);
        return CGSizeMake((properWidth + 30), 34);
    }if (indexPath.section==0) {
          return CGSizeMake(KScreenWidth, 100);
    }if (indexPath.section==1) {
          return CGSizeMake(KScreenWidth, 457);
    }
    return CGSizeMake(0, 0);
  
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    if (section==2||section==3) {
         return CGSizeMake(KScreenWidth-26, 60);
    }
    return CGSizeMake(0, 0);
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    return CGSizeMake(KScreenWidth, 10);
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(5, 10, 5, 5);
}
- (CGFloat) collectionView:(UICollectionView *)collectionView
                    layout:(UICollectionViewLayout *)collectionViewLayout
minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 3.0f;
}
- (CGFloat) collectionView:(UICollectionView *)collectionView
                    layout:(UICollectionViewLayout *)collectionViewLayout
minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 10.0f;
}
- (UICollectionView *)collectionView{
    if (_collectionView == nil) {
        UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
        layout.minimumLineSpacing=3;
        layout.minimumInteritemSpacing=3;
        _collectionView = [[TR_CollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        [self.view addSubview:_collectionView];
        _collectionView.sd_layout.leftSpaceToView(self.view, 0).rightSpaceToView(self.view, 0).topSpaceToView(self.navView, 0).bottomSpaceToView(self.footView, 0);
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
        [_collectionView registerNib:[UINib nibWithNibName:@"TR_TeacherApplyCell" bundle:nil] forCellWithReuseIdentifier:@"cell1"];
        [_collectionView registerNib:[UINib nibWithNibName:@"TR_TeacherApplyReuView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:HeaderID];
        [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:FootID];
        _collectionView.backgroundColor = UICOLOR_RGBA(255,255,255);
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
    }
    return _collectionView;
}
- (TR_TeacherHeadView*)headView{
    if (IsNilOrNull(_headView)) {
        _headView = (TR_TeacherHeadView*)[[[NSBundle mainBundle]loadNibNamed:@"TR_TeacherHeadView" owner:self options:nil]lastObject];
    }
    return _headView;
}
- (TR_TeacherInfoView*)infoView{
    if(IsNilOrNull(_infoView)){
        _infoView =(TR_TeacherInfoView*) [[[NSBundle mainBundle]loadNibNamed:@"TR_TeacherInfoView" owner:self options:nil] lastObject];
    }
    return _infoView;
}
- (TR_TeacherApplyFootView*)footView{
    if (IsNilOrNull(_footView)) {
        _footView =(TR_TeacherApplyFootView*) [[[NSBundle mainBundle]loadNibNamed:@"TR_TeacherApplyFootView" owner:self options:nil]lastObject];
        [self.view addSubview:_footView];
        _footView.sd_layout.leftSpaceToView(self.view, 0)
        .rightSpaceToView(self.view, 0)
        .bottomSpaceToView(self.view, kSafeAreaBottomHeight)
        .heightIs(60);
    }
    return _footView;
}


@end
