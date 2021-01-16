//
//  DataShareHeadView.m
//  DaPeiShi
//
//  Created by admin on 2019/8/16.
//  Copyright © 2019 candy.chen. All rights reserved.
//

#import "DataShareHeadView.h"
#import "DataShareHeadCell.h"

#define HEAD_W   120

@implementation DataShareHeadView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self bottomView];
    }
    return self;
}
- (UICollectionView *)collectView
{
    if (_collectView == nil) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        [layout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        _collectView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) collectionViewLayout:layout];
        [self addSubview:_collectView];
        _collectView.sd_layout.leftSpaceToView(self, KScreenWidth/2-HEAD_W).topSpaceToView(self, 0).heightIs(50).widthIs(HEAD_W*2);
        _collectView.backgroundColor = [UIColor whiteColor];
        [_collectView registerNib:[UINib nibWithNibName:@"DataShareHeadCell" bundle:nil] forCellWithReuseIdentifier:@"cell1"];
        _collectView.showsHorizontalScrollIndicator = NO;
        _collectView.showsVerticalScrollIndicator = NO;
        _collectView.dataSource = self;
        _collectView.delegate = self;
        
    }
    return _collectView;
}
- (UIView*)bottomView{
    if(!_bottomView){
        _bottomView = [[UIView alloc]initWithFrame:CGRectZero];
        [self addSubview:_bottomView];
        _bottomView.sd_layout.leftSpaceToView(self, 0).rightSpaceToView(self, 0).topSpaceToView(self.collectView, 0).heightIs(0).bottomSpaceToView(self, 0.5);
        _bottomView.backgroundColor=UICOLOR_RGBA(242, 242, 242);
    }
    return _bottomView;
}
- (void)setSelectIndex:(NSUInteger)selectIndex{
    _selectIndex = selectIndex;
    [self.collectView reloadData];
    [self.collectView selectItemAtIndexPath:[NSIndexPath indexPathForItem:selectIndex inSection:0] animated:YES scrollPosition:UICollectionViewScrollPositionCenteredHorizontally];
}
- (void)setDataList:(NSMutableArray *)dataList
{
    _dataList = dataList;
    if (_dataList) {
        [self.collectView reloadData];
    }
    
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataList.count;
}

/** cell的内容*/
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    DataShareHeadCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell1" forIndexPath:indexPath];
    if (_selectIndex == indexPath.row) {
        [cell showCellStateIsKillIng:YES title:self.dataList[indexPath.row]];
        cell.dataNameType.textColor = self.selectTextColor ? self.selectTextColor:REDCOLOR;
        cell.dataLine.backgroundColor = self.selectTextColor ? self.selectTextColor:REDCOLOR;
    }else{
        [cell showCellStateIsKillIng:NO title:self.dataList[indexPath.row]];
        cell.dataNameType.textColor = self.textColor ? self.textColor:[UIColor darkTextColor];
        cell.dataLine.hidden = YES;
    }
    return cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(HEAD_W, self.frame.size.height);
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    _selectIndex = indexPath.row;
    [self.collectView selectItemAtIndexPath:[NSIndexPath indexPathForItem:_selectIndex inSection:0] animated:YES scrollPosition:UICollectionViewScrollPositionCenteredHorizontally];
    [collectionView reloadData];
    if (self.selectDataType) {
        self.selectDataType(indexPath.row);
    }
}

@end
