//
//  TR_CDZTableViewCell.m
//  TR_CDZCollectionInTableViewDemo
//
//  Created by NemoTR_CDZ on 2017/1/21.
//  Copyright © 2017年 NemoTR_CDZ. All rights reserved.
//

#import "TR_CDZTableViewCell.h"
#import "TR_CDZCollectionViewCell.h"
#import "TR_CDZCollectionViewItem.h"
#import "SKFPreViewNavController.h"
#import <Masonry/Masonry.h>
#import "YH_PhotoPickerViewController.h"
#import "TR_NavigationViewController.h"

@interface TR_CDZTableViewCell()<UICollectionViewDelegate,UICollectionViewDataSource,TR_CDZCollectionCellDelegate,UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,YHPhotoPickerControllerDelegate>
@property (strong, nonatomic) UICollectionView *collectionView;
@property (strong, nonatomic) NSMutableArray<TR_CDZCollectionViewItem *>*itemsArray;
@property (strong, nonatomic) NSMutableArray<UIImage *>*itemsImageArray;
@property (strong, nonatomic) NSMutableArray *imageAssets;


@end
@implementation TR_CDZTableViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    TR_CDZCollectionViewItem *item = [TR_CDZCollectionViewItem new];
    item.delBtnHidden = YES;
    _itemsArray = [NSMutableArray arrayWithObject:item];
    [self addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.with.bottom.with.left.with.right.mas_equalTo(self);
        make.height.mas_equalTo(@100);
    }];
    self.imageAssets = [NSMutableArray array];
}

-(NSMutableArray*)itemsImageArray
{
    if(!_itemsImageArray) {
        _itemsImageArray = [[NSMutableArray alloc] init];
    }
    return _itemsImageArray;
}

- (void)didDelete:(UICollectionViewCell *)cell{
    NSIndexPath *indexPath = [self.collectionView indexPathForCell:cell];
    [self.itemsArray removeObjectAtIndex:indexPath.row];
    [self.delegate getSelectImageArray:self.itemsArray];
    [self.imageAssets removeObjectAtIndex:indexPath.row];
    [self reloadCell];
}

- (void)reloadCell{
    [self.collectionView reloadData];
    [self.collectionView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(self.collectionView.collectionViewLayout.collectionViewContentSize.height));
    }];
    [self.delegate didChangeCell:self.collectionView];
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if ((indexPath.row == self.itemsArray.count - 1)) {
        if(self.itemsArray.count >9) {
            [TRHUDUtil showMessageWithText:@"最多九张图"];
            return;
        }
        UIActionSheet *action=[[UIActionSheet alloc] initWithTitle:@"选取照片" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"从摄像头选取",@"从图片库选择",nil];
        [action showInView:self];
    } else{
        self.itemsImageArray = nil;
        for(int i = 0; i < self.itemsArray.count - 1; i++){
            TR_CDZCollectionViewItem* item = [self.itemsArray objectAtIndex:i];
            [self.itemsImageArray addObject:item.image];
        }
        //大图浏览
        SKFPreViewNavController *imagePickerVc = [[SKFPreViewNavController alloc] initWithSelectedPhotos:self.itemsImageArray index:indexPath.row DeletePic:NO];
        [imagePickerVc setDidFinishDeletePic:^(NSArray<UIImage *> *photos) {
        }];
        [self.window.rootViewController presentViewController:imagePickerVc animated:YES completion:nil];
    }
}
#pragma mark   ------------- 相机还是相册--------------
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex==0) {
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            UIImagePickerController *pickerController = [[UIImagePickerController alloc] init];
            //设置选取的照片是否可编辑
            pickerController.allowsEditing = NO;
            //设置相册呈现的样式
            pickerController.sourceType =  UIImagePickerControllerSourceTypeCamera;
            pickerController.cameraDevice = UIImagePickerControllerCameraDeviceFront;
            pickerController.delegate = self;
            [self.window.rootViewController presentViewController:pickerController animated:YES completion:^{
            }];
        }
    } else if (buttonIndex == 1) {
        [self photoSelectet];
    }
}

/** 获取当前View的控制器对象 */
- (UIViewController *)yh_getCurrentViewController
{
    UIResponder *next = [self nextResponder];
    do {
        if ([next isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)next;
        }
        next = [next nextResponder];
    } while (next != nil);
    
    return nil;
}

#pragma mark - 选择图片
- (void)photoSelectet{
    
    // 打开图片选择VC
    YH_PhotoPickerViewController *pickVC = [[YH_PhotoPickerViewController alloc] initWithSelectAssets:self.imageAssets];
    pickVC.nMaxCount = 9;
    pickVC.nInitCount = 0;
    pickVC.nColumnCount = 4;
    pickVC.nResultType = YH_PICKER_RESULT_ASSET;
    pickVC.delegate = self;
    UIViewController *currentVC = [self yh_getCurrentViewController];
    TR_NavigationViewController *navVC = [[TR_NavigationViewController alloc] initWithRootViewController:pickVC];
    navVC.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [currentVC presentViewController:navVC animated:YES completion:^{
        
    }];
}

#pragma mark - YHImagePickerControllerDelegate

- (void)didSelectPhotosFromPhotoPickerController:(YH_PhotoPickerViewController *)picker result:(NSArray *)aSelected finish:(BOOL)flag {
    [self.itemsArray removeAllObjects];
    TR_CDZCollectionViewItem *item = [[TR_CDZCollectionViewItem alloc]init];
    item.delBtnHidden = YES;
    self.itemsArray = [NSMutableArray arrayWithObject:item];
    if (flag) {
        [self.imageAssets removeAllObjects];
        [self.imageAssets addObjectsFromArray:aSelected];
        for (ALAsset *asset in aSelected) {
            UIImage *photoImage = (asset.aspectRatioThumbnail==NULL)?nil: [UIImage imageWithCGImage:asset.aspectRatioThumbnail] ;
            
            UIImage *thumbImage = photoImage;
            TR_CDZCollectionViewItem *item = [[TR_CDZCollectionViewItem alloc]init];
            item.image = thumbImage;
            
            [self.itemsArray insertObject:item atIndex:self.itemsArray.count - 1];
        }
        [self.delegate getSelectImageArray:self.itemsArray];
        NSLog(@"%@",self.itemsArray);
        
        !self.finishBlock ?: self.finishBlock(self.itemsArray);
    }
    [self reloadCell];
}


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    NSString *mediaType = [info objectForKey:UIImagePickerControllerMediaType];
    if ([mediaType isEqualToString:(NSString *)kUTTypeImage]){
        UIImage *theImage = nil;
        theImage = [info objectForKey:UIImagePickerControllerOriginalImage];
        TR_CDZCollectionViewItem *item = [TR_CDZCollectionViewItem new];
        item.image = theImage;
        [self.itemsArray insertObject:item atIndex:self.itemsArray.count - 1];
        [self.delegate getSelectImageArray:self.itemsArray];
        [self reloadCell];
    }
}
// 上面保存图片或录像的方法
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {
    NSLog(@"保存图片完成");
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (self.itemsArray.count <10) {
        return self.itemsArray.count;
    }
    return self.itemsArray.count - 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    TR_CDZCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionViewCell" forIndexPath:indexPath];
    cell.delegate = self;
    cell.item = self.itemsArray[indexPath.row];
    return cell;
}

- (UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout.alloc init];
        layout.itemSize = CGSizeMake((KScreenWidth-10)/4, 80);
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        _collectionView = [UICollectionView.alloc initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor clearColor];
        [_collectionView registerNib:[UINib nibWithNibName:@"TR_CDZCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"CollectionViewCell"];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
    }
    return _collectionView;
}
@end
