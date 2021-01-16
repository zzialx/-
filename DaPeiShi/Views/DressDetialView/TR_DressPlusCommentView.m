//
//  TR_DressPlusCommentView.m
//  DaPeiShi
//
//  Created by admin on 2019/8/9.
//  Copyright © 2019 candy.chen. All rights reserved.
//

#import "TR_DressPlusCommentView.h"
//#import "NewDynamicsLayout.h"

@interface TR_DressPlusCommentView ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UIImageView * bgImgView;
//@property(nonatomic,strong)YYLabel * thumbLabel;
@property(nonatomic,strong)UIView * dividingLine;
@property(nonatomic,strong)NSMutableArray * likeArray;
@property(nonatomic,strong)NSMutableArray * commentArray;
//@property(nonatomic,strong)NewDynamicsLayout * layout;
@property(nonatomic,strong)UITableView * commentTable;

@end

@implementation TR_DressPlusCommentView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (frame.size.width == 0 && frame.size.height == 0) {
//        frame.size.width = KScreenWidth - kDynamicsNormalPadding * 2 - kDynamicsPortraitNamePadding - kDynamicsPortraitWidthAndHeight;;
        frame.size.height = 0;
    }
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}
- (void)setup
{
    [self addSubview:self.bgImgView];
//    [self addSubview:self.thumbLabel];
    [self addSubview:self.dividingLine];
    [self addSubview:self.commentTable];
    
}
//- (void)setWithLikeArr:(NSMutableArray *)likeArr CommentArr:(NSMutableArray *)commentArr DynamicsLayout:(NewDynamicsLayout *)layout
//{
//    _likeArray = likeArr;
//    self.commentArray = layout.commentLayoutArr;
//    _layout = layout;
//    [self layoutView];
//}
- (void)layoutView
{
    _bgImgView.top = 0;
    _bgImgView.left = 0;
    _bgImgView.width = self.frame.size.width;
//    _bgImgView.height = _layout.thumbCommentHeight;
    
    UIView * lastView = _bgImgView;
    
    if (_likeArray.count != 0) {
//        _thumbLabel.hidden = NO;
//        _thumbLabel.top = 10;
//        _thumbLabel.left = kDynamicsNameDetailPadding;
//        _thumbLabel.width = self.frame.size.width - kDynamicsNameDetailPadding*2;
//        _thumbLabel.height = _layout.thumbLayout.textBoundingSize.height;
//        _thumbLabel.textLayout = _layout.thumbLayout;
//        lastView = _thumbLabel;
    }else{
//        _thumbLabel.hidden = YES;
    }
    
    
    if (_likeArray.count != 0 && _commentArray.count != 0) {
        _dividingLine.hidden = NO;
//        _dividingLine.top = _thumbLabel.bottom;
        _dividingLine.left = 0;
        _dividingLine.width = self.frame.size.width;
        _dividingLine.height = .5;
        lastView = _dividingLine;
    }else{
        _dividingLine.hidden = YES;
    }
    
    if (_commentArray.count != 0) {
        _commentTable.hidden = NO;
        _commentTable.left = _bgImgView.left;
        _commentTable.top = lastView == _dividingLine ? lastView.bottom + .5 : lastView.top + 10;
        _commentTable.width = _bgImgView.width;
//        _commentTable.height = _layout.commentHeight;
        
        [_commentTable reloadData];
    }else{
        _commentTable.hidden = YES;
    }
    
}
#pragma mark - TableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.commentArray.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    YYTextLayout * layout = self.commentArray[indexPath.row];
//    return layout.textBoundingSize.height + kDynamicsGrayPicPadding*2;
    return 100;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell;//这里不使用重用机制(会出现评论窜位bug)
    
//    YYTextLayout * layout = self.commentArray[indexPath.row];
//
//    YYLabel * label;
//    if (!cell) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"commentCell"];
//        cell.backgroundColor = [UIColor clearColor];
//        label = [YYLabel new];
//        [cell addSubview:label];
//    }
    
//    label.top = kDynamicsGrayPicPadding;
//    label.left = kDynamicsNameDetailPadding;
//    label.width = self.frame.size.width - kDynamicsNameDetailPadding*2;
//    label.height = layout.textBoundingSize.height;
//    label.textLayout = layout;
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
//    if (_cell.delegate != nil && [_cell.delegate respondsToSelector:@selector(DynamicsCell:didClickComment:)]) {
//        [_cell.delegate DynamicsCell:_cell didClickComment:(DynamicsCommentItemModel *)_cell.layout.model.commentArr[indexPath.row]];
//    }
}
-(UIImageView *)bgImgView
{
    if (!_bgImgView) {
        _bgImgView = [UIImageView new];
        UIImage *bgImage = [[[UIImage imageNamed:@"LikeCmtBg"] stretchableImageWithLeftCapWidth:40 topCapHeight:30] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        _bgImgView.image = bgImage;
        _bgImgView.backgroundColor = [UIColor clearColor];
    }
    return _bgImgView;
}
//-(YYLabel *)thumbLabel
//{
//    if (!_thumbLabel) {
//        _thumbLabel = [YYLabel new];
//    }
//    return _thumbLabel;
//}
-(UIView *)dividingLine
{
    if (!_dividingLine) {
        _dividingLine = [UIView new];
        _dividingLine.backgroundColor = UICOLOR_RGBA(210, 210, 210);
    }
    return _dividingLine;
}
- (UITableView*)table{
    if (IsNilOrNull(_commentTable)) {
        _commentTable = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        [self addSubview:_commentTable];
        _commentTable.delegate = self;
        _commentTable.dataSource = self;
        _commentTable.scrollEnabled = NO;
        _commentTable.separatorStyle = UITableViewCellSeparatorStyleNone;
        _commentTable.backgroundColor = [UIColor clearColor];
    }
    return _commentTable;
}

@end
