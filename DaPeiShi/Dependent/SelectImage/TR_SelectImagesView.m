//
//  TR_IDCardView.m
//  HouseProperty
//
//  Created by candy.chen on 2018/9/12.
//  Copyright © 2018年 candy.chen. All rights reserved.
//

#import "TR_SelectImagesView.h"
#import "TR_CDZTableViewCell.h"
#import "TR_CDZCollectionViewItem.h"

@interface TR_SelectImagesView()<TR_CDZTableViewCellDelegate>
@property (nonatomic, strong) UIView* titleView;
@property (nonatomic, strong) UILabel* itemTitleLab;
@property (nonatomic, strong) TR_CDZTableViewCell* itemView;
@property (nonatomic, strong) NSMutableArray* finallArray;
@end
@implementation TR_SelectImagesView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        _finallArray = [[NSMutableArray alloc] init];
        [self initView];
        
        //            [self setupAutoHeightWithBottomView:self.itemView bottomMargin:0];
    }
    return self;
}


-(void)initView
{
    [self addSubview:self.titleView];
    self.titleView.sd_layout.topSpaceToView(self, 20).leftSpaceToView(self, 0).rightSpaceToView(self, 0).autoHeightRatio(0);
    
    [self addSubview:self.itemView];
    self.itemView.sd_layout.topSpaceToView(self.titleView, 10).leftSpaceToView(self, 5).rightSpaceToView(self, 5).bottomSpaceToView(self, 0);
}

-(TR_CDZTableViewCell*)itemView
{
    if(!_itemView)
    {
        _itemView = [[TR_CDZTableViewCell alloc] init];
        _itemView.delegate = self;
    }
    
    return _itemView;
}

-(void)setTitle:(NSString *)title
{
    _itemTitleLab.text = title;
}

-(UIView*)titleView
{
    if(!_titleView) {
        _titleView = [[UIView alloc] init];
        UILabel* star = [[UILabel alloc] init];
        star.font = [UIFont systemFontOfSize:20];
        star.textColor = [UIColor redColor];
        star.textAlignment = NSTextAlignmentLeft;
        star.text = @"*";
        [_titleView addSubview:star];
        
        star.sd_layout.leftSpaceToView(_titleView, 15).centerYEqualToView(_titleView).offset(3).widthIs(10).autoHeightRatio(0);
        
        _itemTitleLab = [[UILabel alloc] init];
        _itemTitleLab.font = [UIFont systemFontOfSize:15];
        _itemTitleLab.textColor = [UIColor blackColor];
        _itemTitleLab.textAlignment = NSTextAlignmentLeft;
        _itemTitleLab.text = @"";
        [_titleView addSubview:_itemTitleLab];
        
        
        
        UILabel* limit = [[UILabel alloc] init];
        limit.font = [UIFont systemFontOfSize:12];
        limit.textColor = [UIColor tr_colorwithHexString:@"#666666"];
        limit.textAlignment = NSTextAlignmentLeft;
        limit.text = @"（最多9张）";
        
        [_titleView addSubview:limit];
        _itemTitleLab.sd_layout.leftSpaceToView(star, 5).centerYEqualToView(_titleView).autoHeightRatio(0);
        [_itemTitleLab setSingleLineAutoResizeWithMaxWidth:(KScreenWidth)];
        
        limit.sd_layout.leftSpaceToView(_itemTitleLab, 0).centerYEqualToView(_titleView).rightSpaceToView(_titleView, 10).autoHeightRatio(0);
        
    }
    return _titleView;
}
- (void)didChangeCell:(UICollectionView *)cell{
    if(self.hightBlock) {
        self.hightBlock(cell.collectionViewLayout.collectionViewContentSize.height + CGRectGetMaxY(self.titleView.frame) + 10);
    }
}

- (void)getSelectImageArray:(NSMutableArray*)imageArray
{
    _finallArray = imageArray;
    BLOCK_EXEC(self.imageBlock,[self getFinalImageArray],nil);
}

-(NSMutableArray*)getFinalImageArray
{
    NSMutableArray* array = [[NSMutableArray alloc] init];
    if(_finallArray.count > 1) {
        for (TR_CDZCollectionViewItem* item in _finallArray) {
            [array addObject:item.image];
        }
    }
    [array removeLastObject];
    return array;
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
