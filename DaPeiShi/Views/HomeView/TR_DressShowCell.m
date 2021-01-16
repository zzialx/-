//
//  TR_DressShowCell.m
//  DaPeiShi
//
//  Created by xq的电脑 on 2019/6/22.
//  Copyright © 2019 candy.chen. All rights reserved.
//

#import "TR_DressShowCell.h"
#import "TR_DressPicCell.h"

@interface TR_DressShowCell()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UIImageView *headImg;
@property (weak, nonatomic) IBOutlet UILabel *nameLab;
@property (weak, nonatomic) IBOutlet UIButton *fouceOnBtn;
@property (weak, nonatomic) IBOutlet UILabel *contentLab;
@property (weak, nonatomic) IBOutlet UICollectionView *dressPicCollectionView;
@property (weak, nonatomic) IBOutlet UILabel *dressTeacherLab;
@property (weak, nonatomic) IBOutlet UILabel *likeCount;
@property (weak, nonatomic) IBOutlet UILabel *msgConutLab;
@property (weak, nonatomic) IBOutlet UIButton *likeBtn;
@property (weak, nonatomic) IBOutlet UIButton *commentBtn;

@end

@implementation TR_DressShowCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.headImg.layer.cornerRadius=19;
    self.headImg.layer.masksToBounds=YES;
    self.fouceOnBtn.layer.cornerRadius=15;
    self.fouceOnBtn.layer.masksToBounds=YES;
    self.fouceOnBtn.layer.borderWidth=1;
    self.fouceOnBtn.layer.borderColor=UICOLOR_RGBA(255, 46, 46).CGColor;
    self.dressPicCollectionView.layer.cornerRadius=8;
    self.dressPicCollectionView.layer.masksToBounds=YES;
    [_dressPicCollectionView registerNib:[UINib nibWithNibName:@"TR_DressPicCell" bundle:nil] forCellWithReuseIdentifier:@"cell1"];
    _dressPicCollectionView.dataSource = self;
    _dressPicCollectionView.delegate = self;
    self.dressTeacherLab.layer.cornerRadius=8;
    self.dressTeacherLab.layer.masksToBounds=YES;
}
- (void)showCellModel:(BOOL)fouceOnModel{
    if (fouceOnModel) {
        self.fouceOnBtn.hidden=YES;
    }
}

- (IBAction)founceOnAction:(UIButton *)sender {
}
- (IBAction)giveALikeAction:(UIButton *)sender {
}
- (IBAction)giveCommentAction:(UIButton *)sender {
}
#pragma mark - UICollectionViewDelegate, UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSInteger count = 3;
    return count;
}
/** cell的内容*/
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    TR_DressPicCell  * cell  =[collectionView dequeueReusableCellWithReuseIdentifier:@"cell1" forIndexPath:indexPath];
    return cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGSize size = CGSizeMake(220, 276);
    return size;
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 0, 0, 0);
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
}
@end
