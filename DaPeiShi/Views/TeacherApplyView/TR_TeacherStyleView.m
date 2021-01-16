//
//  TR_TeacherStyleView.m
//  DaPeiShi
//
//  Created by xq的电脑 on 2019/8/19.
//  Copyright © 2019 candy.chen. All rights reserved.
//

#import "TR_TeacherStyleView.h"
#import "TR_CollectionView.h"
#import "TR_SearchCollectionViewCell.h"
#import "UICollectionViewLeftAlignedLayout.h"


@interface TR_TeacherStyleView ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property(strong,nonatomic)UILabel  * titleLab;
@property (strong, nonatomic)TR_CollectionView *collectView;

@end


@implementation TR_TeacherStyleView



- (instancetype)initWithFrame:(CGRect)frame withStyleList:(NSArray*)styleList{
    self = [super initWithFrame:frame];
    if (self) {
        [self titleLab];
        [self collectView];
    }
    return self;
}
- (UILabel*)titleLab{
    if (IsNilOrNull(_titleLab)) {
        _titleLab = [[UILabel alloc]init];
        [self addSubview:_titleLab];
        _titleLab.sd_layout.leftSpaceToView(self, 13)
        .topSpaceToView(self, 20)
        .widthIs(150)
        .heightIs(20);
    }
    return _titleLab;
}

#pragma mark -- UICollectionViewDelegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 5;
}

/** cell的内容*/
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    __weak TR_SearchCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell1" forIndexPath:indexPath];
    [cell showCloseBtn:NO];
    [cell showTeaName:@"肤白貌美色" index:indexPath.row];
    return cell;
    
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    //    NSString *name = self.hotSLsit[indexPath.row];
    NSString *name = @"肤白貌美色";
    CGSize size = [name  sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14.f]}];
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
    return 3.0f;
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
    if (_collectView == nil) {
        UICollectionViewLeftAlignedLayout *layout = [[UICollectionViewLeftAlignedLayout alloc] init];
        [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
        layout.minimumLineSpacing = 3;
        layout.minimumInteritemSpacing = 3;
        _collectView = [[TR_CollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        [self addSubview:_collectView];
        _collectView.sd_layout.leftSpaceToView(self, 0).rightSpaceToView(self, 0).topSpaceToView(self.titleLab, 20).bottomSpaceToView(self, 0);
        _collectView.backgroundColor = [UIColor whiteColor];
        [_collectView registerNib:[UINib nibWithNibName:@"TR_SearchCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"cell1"];
        _collectView.dataSource = self;
        _collectView.delegate = self;
    }
    return _collectView;
}

@end
