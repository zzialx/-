//
//  TR_WightAndSkinColorVC.m
//  DaPeiShi
//
//  Created by admin on 2019/8/19.
//  Copyright © 2019 candy.chen. All rights reserved.
//

#import "TR_WightAndSkinColorVC.h"
#import "DYScrollRulerView.h"
#import "TR_SearchCollectionViewCell.h"
#import "UICollectionViewLeftAlignedLayout.h"
#import "TR_CollectionView.h"

@interface TR_WightAndSkinColorVC ()<DYScrollRulerDelegate,UICollectionViewDelegate,UICollectionViewDataSource>

@property(nonatomic,strong)DYScrollRulerView *noneZeroRullerView;
@property (weak, nonatomic) IBOutlet UIView *mineWeightView;
@property (weak, nonatomic) IBOutlet UIView *mineColorView;
@property (strong, nonatomic)TR_CollectionView *collectView;
@end

@implementation TR_WightAndSkinColorVC
- (IBAction)nextStepAction:(id)sender {
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.navView setLeftImg:@"back_gray" title:@"编辑身材数据2/3" bgColor:UIColor.whiteColor];
    [self.mineWeightView addSubview:self.noneZeroRullerView];
    [self.mineColorView addSubview:self.collectView];
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
        [self.mineColorView addSubview:_collectView];
        _collectView.sd_layout.leftSpaceToView(self.mineColorView, 0).rightSpaceToView(self.mineColorView, 0).topSpaceToView(self.mineColorView, 0).bottomSpaceToView(self.mineColorView, 0);
        _collectView.backgroundColor = [UIColor whiteColor];
        [_collectView registerNib:[UINib nibWithNibName:@"TR_SearchCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"cell1"];
        _collectView.dataSource = self;
        _collectView.delegate = self;
    }
    return _collectView;
}
-(DYScrollRulerView *)noneZeroRullerView{
    if (!_noneZeroRullerView) {
        NSString *unitStr = @"";
        CGFloat rullerHeight = [DYScrollRulerView rulerViewHeight];
        _noneZeroRullerView = [[DYScrollRulerView alloc]initWithFrame:CGRectMake(5, 0, KScreenWidth-20, rullerHeight) theMinValue:40 theMaxValue:100  theStep:1 theUnit:unitStr theNum:5];
        [_noneZeroRullerView setDefaultValue:70 animated:YES];
        _noneZeroRullerView.bgColor = [UIColor whiteColor];
        //        _noneZeroRullerView.triangleColor   = [UIColor redColor];
        _noneZeroRullerView.delegate        = self;
        _noneZeroRullerView.scrollByHand    = YES;
    }
    return _noneZeroRullerView;
}
#pragma mark - YKScrollRulerDelegate
-(void)dyScrollRulerView:(DYScrollRulerView *)rulerView valueChange:(float)value{
    
    NSLog(@"value->%.f",value);
    
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
