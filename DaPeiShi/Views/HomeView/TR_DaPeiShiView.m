//
//  TR_DaPeiShiView.m
//  DaPeiShi
//
//  Created by xq的电脑 on 2019/6/19.
//  Copyright © 2019 candy.chen. All rights reserved.
//

#import "TR_DaPeiShiView.h"
#import "TR_DaPeiShiCell.h"

@interface TR_DaPeiShiView ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong)UICollectionView * collectionView;
@end

@implementation TR_DaPeiShiView

- (void)awakeFromNib{
    [super awakeFromNib];
}
- (instancetype)initWithFrame:(CGRect)frame withDaPeiShiList:(NSArray*)daPeiShiList{
    self = [super initWithFrame:frame];
    if (self) {
        [self collectionView];
    }
    return self;
}

- (UICollectionView *)collectionView
{
    if (_collectionView == nil) {
        UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
        layout.minimumLineSpacing=28;
        layout.minimumInteritemSpacing=3;
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        [self addSubview:_collectionView];
        _collectionView.sd_layout.leftSpaceToView(self, 0).rightSpaceToView(self, 0).topSpaceToView(self, 0).bottomSpaceToView(self, kSafeAreaBottomHeight);
        [_collectionView registerNib:[UINib nibWithNibName:@"TR_DaPeiShiCell" bundle:nil] forCellWithReuseIdentifier:@"cell1"];
//        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
        _collectionView.backgroundColor = UICOLOR_RGBA(249,249,249);
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
    NSInteger count = 10;
    return count;
}
/** cell的内容*/
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    TR_DaPeiShiCell  * cell  =[collectionView dequeueReusableCellWithReuseIdentifier:@"cell1" forIndexPath:indexPath];
    return cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGSize size = CGSizeMake(54, 100);
    return size;
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(5, 16, 5, 16);
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (self.clickTeacher) {
        self.clickTeacher(@"id");
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
