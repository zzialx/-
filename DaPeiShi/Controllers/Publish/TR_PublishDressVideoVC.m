//
//  TR_PublishDressVideoVC.m
//  DaPeiShi
//
//  Created by admin on 2019/7/24.
//  Copyright © 2019 candy.chen. All rights reserved.
//

#import "TR_PublishDressVideoVC.h"
#import "ZYQAssetPickerController.h"
#import "SelwynExpandableTextView.h"

@interface TR_PublishDressVideoVC()<UIImagePickerControllerDelegate,UINavigationControllerDelegate,UITextViewDelegate,AMapLocationManagerDelegate,ZYQAssetPickerControllerDelegate>

@property (nonatomic,strong)SelwynExpandableTextView *expandableTextView;///<输入框
@property (nonatomic,strong)UIButton * addPic;
@property (nonatomic,strong)NSMutableArray       *imageArray;
@property (nonatomic,strong)NSArray *arr;
@property (nonatomic,strong)UIView *editv;
@property(nonatomic, strong) AMapLocationManager *locationManager;//定位管理器
@property(nonatomic,strong)NSString * address;
@property(nonatomic,strong)UIButton * dapeishiBtn;
@property(nonatomic,strong)UIButton * locationBtn;

@end

@implementation TR_PublishDressVideoVC
-(void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    [self.navView.leftBtn setTitle:@"取消" forState:UIControlStateNormal];
    [self.navView.rightBtn setTitle:@"发布" forState:UIControlStateNormal];
    [self.view addSubview:self.expandableTextView];
    
    _imageArray = [NSMutableArray array];
    _editv = [[UIView alloc] initWithFrame:CGRectMake(16, KNAV_HEIGHT+60, KScreenWidth-16*2, 0)];
    _editv.backgroundColor = [UIColor whiteColor];
    
    _addPic = [UIButton buttonWithType:UIButtonTypeCustom];
    [_addPic setImage:[UIImage imageNamed:@"AlbumAddBtn"] forState:UIControlStateNormal];
    _addPic.frame = CGRectMake(15, 10, 70, 70);
    [_addPic addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    _editv.frame = CGRectMake(0, KNAV_HEIGHT+60, KScreenWidth, CGRectGetMaxY(_addPic.frame)+20);
    [_editv addSubview:_addPic];
    [self.view addSubview:_editv];
    [self dapeishiBtn];
    [self locationBtn];
}
#pragma mark---选择位置
- (void)selectDaPeishiAction{
    
}
#pragma mark-----选择位置
- (void)selectLocationAction{
    
}

-(void)click{
    ZYQAssetPickerController *pickerController = [[ZYQAssetPickerController alloc] init];
    pickerController.maximumNumberOfSelection = 1;
    //    pickerController.nowCount = _imageArray.count;
    pickerController.assetsFilter = ZYQAssetsFilterAllVideos;
    pickerController.showEmptyGroups=NO;
    pickerController.delegate=self;
    pickerController.selectionFilter = [NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, NSDictionary *bindings) {
        if ([(ZYQAsset*)evaluatedObject mediaType]==ZYQAssetMediaTypeVideo) {
            NSTimeInterval duration = [(ZYQAsset*)evaluatedObject duration];
            return duration >= 5;
        } else {
            return YES;
        }
    }];
    [self presentViewController:pickerController animated:YES completion:nil];
}
- (void)assetPickerController:(ZYQAssetPickerController *)picker didFinishPickingAssets:(NSArray *)assets
{
    WS(weakSelf);
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^
                   {
                       for (int i=0; i<assets.count; i++)
                       {
                           
                           ZYQAsset *asset = assets[i];
                           
                           [asset setGetFullScreenImage:^(UIImage *result){
                               
                               if (result == nil) {
                                   NSLog(@"空空以控控");
                               }
                               if(weakSelf.imageArray.count >8){
                                   NSLog(@"超了");
                               }else{
                                   [weakSelf.imageArray addObject:result];
                                   dispatch_async(dispatch_get_main_queue(), ^{
                                       [self nineGrid];
                                   });
                               }
                               NSLog(@"---%ld",weakSelf.imageArray.count);
                           }];
                       }
                       NSLog(@"现在剩余是多少%ld",weakSelf.imageArray.count);
                   });
}
// 删除照片
- (void)deleteEvent:(UIButton *)sender
{
    UIButton *btn = (UIButton *)sender;
    [_imageArray removeObjectAtIndex:btn.tag-10];
    
    [self nineGrid];
    
    if (_imageArray.count == 0)
    {
        _addPic.frame = CGRectMake(15, 10, 70, 70);
        _editv.frame = CGRectMake(0, KNAV_HEIGHT+60, KScreenWidth, CGRectGetMaxY(_addPic.frame)+20);
    }
}
// 9宫格图片布局
- (void)nineGrid
{
    NSLog(@"九宫格%ld",_imageArray.count);
    for (UIImageView *imgv in _editv.subviews)
    {
        if ([imgv isKindOfClass:[UIImageView class]]) {
            [imgv removeFromSuperview];
        }
    }
    
    CGFloat width = 70;
    CGFloat widthSpace = (KScreenWidth - 15*2 - 70*4) / 3.0;
    CGFloat heightSpace = 10;
    
    NSInteger count = _imageArray.count;
    _imageArray.count > 9 ? (count = 9) : (count = _imageArray.count);
    
    for (int i=0; i<count; i++)
    {
        UIImageView *imgv = [[UIImageView alloc] initWithFrame:CGRectMake(15+(width+widthSpace)*(i%4), (i/4)*(width+heightSpace) + 10, width, width)];
        imgv.image = _imageArray[i];
        imgv.userInteractionEnabled = YES;
        [_editv addSubview:imgv];
        
        UIButton *delete = [UIButton buttonWithType:UIButtonTypeCustom];
        delete.frame = CGRectMake(width-16, -5, 16, 16);
        //        delete.backgroundColor = [UIColor greenColor];
        [delete setBackgroundImage:[UIImage imageNamed:@"close"] forState:UIControlStateNormal];
        [delete addTarget:self action:@selector(deleteEvent:) forControlEvents:UIControlEventTouchUpInside];
        delete.tag = 10+i;
        [imgv addSubview:delete];
        
        if (i == _imageArray.count - 1)
        {
            if (_imageArray.count % 4 == 0) {
                _addPic.frame = CGRectMake(15, CGRectGetMaxY(imgv.frame) + heightSpace, 70, 70);
            } else {
                _addPic.frame = CGRectMake(CGRectGetMaxX(imgv.frame) + widthSpace, CGRectGetMinY(imgv.frame), 70, 70);
            }
            
            _editv.frame = CGRectMake(0, KNAV_HEIGHT+60, KScreenWidth, CGRectGetMaxY(_addPic.frame)+20);
        }
    }
}

-(UIImage*) OriginImage:(UIImage *)image scaleToSize:(CGSize)size
{
    UIGraphicsBeginImageContext(size);  //size 为CGSize类型，即你所需要的图片尺寸
    
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return scaledImage;   //返回的就是已经改变的图片
}
- (void)textViewDidChange:(UITextView *)textView {
    NSLog(@"输入框内容");
}
- (SelwynExpandableTextView *)expandableTextView {
    if (!_expandableTextView) {
        _expandableTextView = [[SelwynExpandableTextView alloc]init];
        _expandableTextView.delegate = self;
        _expandableTextView.textContainerInset = UIEdgeInsetsMake(8,16, 2, 16);
        _expandableTextView.textContainer.lineFragmentPadding = 0;
        _expandableTextView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        _expandableTextView.textAlignment = NSTextAlignmentLeft;
        _expandableTextView.backgroundColor = [UIColor whiteColor];
        _expandableTextView.font =FONT_TEXT(14)
        _expandableTextView.scrollEnabled = YES;
        _expandableTextView.autocorrectionType = UITextAutocorrectionTypeNo;
        _expandableTextView.layoutManager.allowsNonContiguousLayout = NO;
        _expandableTextView.showsVerticalScrollIndicator = YES;
        _expandableTextView.showsHorizontalScrollIndicator = NO;
        _expandableTextView.textAlignment = NSTextAlignmentLeft;
        NSAttributedString *attributedPlaceholder = [[NSAttributedString alloc]initWithString:@"快来秀出你的穿搭吧" attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14],NSForegroundColorAttributeName:[UIColor tr_colorwithHexString:@"#999999"]}];
        _expandableTextView.attributedPlaceholder = attributedPlaceholder;
        _expandableTextView.editable = YES;
        _expandableTextView.keyboardType = UIKeyboardTypeDefault;
        _expandableTextView.maxLength = 60;
        _expandableTextView.frame=CGRectMake(0, KNAV_HEIGHT, KScreenWidth, 60);
    }
    return _expandableTextView;
}
- (UIButton*)dapeishiBtn{
    if (IsNilOrNull(_dapeishiBtn)) {
        _dapeishiBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.view addSubview:_dapeishiBtn];
        _dapeishiBtn.sd_layout.leftSpaceToView(self.view, 16)
        .topSpaceToView(self.editv, 10)
        .widthIs(100)
        .heightIs(30);
        _dapeishiBtn.backgroundColor=UIColor.lightGrayColor;
        _dapeishiBtn.layer.cornerRadius=15;
        _dapeishiBtn.layer.masksToBounds=YES;
        [_dapeishiBtn setImage:[UIImage imageNamed:@"raw"] forState:UIControlStateNormal];
        _dapeishiBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;//设置按钮的位置居左
        [_dapeishiBtn setTitle:@"选择搭配师" forState:UIControlStateNormal];
        [_dapeishiBtn setTitleColor:UICOLOR_RGBA(58, 124, 210) forState:UIControlStateNormal];
        _dapeishiBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;// 水平左对齐
        _dapeishiBtn.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;// 垂直居中对齐
        _dapeishiBtn.titleLabel.font=FONT_TEXT(12);
        //获取文本的宽度
        CGRect rect = [_dapeishiBtn.titleLabel.text boundingRectWithSize:CGSizeMake(MAXFLOAT, _dapeishiBtn.titleLabel.height) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName : _dapeishiBtn.titleLabel.font} context:nil];
        _dapeishiBtn.imageEdgeInsets = UIEdgeInsetsMake(0, rect.size.width+12, 0, -rect.size.width);
        _dapeishiBtn.titleEdgeInsets = UIEdgeInsetsMake(0, -_dapeishiBtn.imageView.frame.size.width+10, 0, _dapeishiBtn.imageView.frame.size.width);
        [_dapeishiBtn addTarget:self action:@selector(selectDaPeishiAction) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _dapeishiBtn;
}
- (UIButton*)locationBtn{
    if (IsNilOrNull(_locationBtn)) {
        _locationBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.view addSubview:_locationBtn];
        _locationBtn.sd_layout.rightSpaceToView(self.view, 16)
        .topSpaceToView(self.editv, 10)
        .widthIs(100)
        .heightIs(30);
        _locationBtn.backgroundColor=UIColor.lightGrayColor;
        _locationBtn.layer.cornerRadius=15;
        _locationBtn.layer.masksToBounds=YES;
        [_locationBtn setImage:[UIImage imageNamed:@"raw"] forState:UIControlStateNormal];
        _locationBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;//设置按钮的位置居左
        [_locationBtn setTitle:@"你在哪里?" forState:UIControlStateNormal];
        [_locationBtn setTitleColor:UICOLOR_RGBA(58, 124, 210) forState:UIControlStateNormal];
        _locationBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;// 水平左对齐
        _locationBtn.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;// 垂直居中对齐
        _locationBtn.titleLabel.font=FONT_TEXT(12);
        //获取文本的宽度
        CGRect rect = [_locationBtn.titleLabel.text boundingRectWithSize:CGSizeMake(MAXFLOAT, _locationBtn.titleLabel.height) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName : _locationBtn.titleLabel.font} context:nil];
        
        _locationBtn.imageEdgeInsets = UIEdgeInsetsMake(0,5, 0, rect.size.width);
        _locationBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
        [_locationBtn addTarget:self action:@selector(selectLocationAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _locationBtn;
}
@end
