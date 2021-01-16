//
//  TR_DaPeiShiContainCell.m
//  DaPeiShi
//
//  Created by xq的电脑 on 2019/8/17.
//  Copyright © 2019 candy.chen. All rights reserved.
//

#import "TR_DaPeiShiContainCell.h"
#import "FloatHeader.h"
#import "TR_DressShowVC.h"
#import "TR_DressServiceTableVC.h"
#import "TR_DressCommentVC.h"

#define sliderHeight 49

@interface TR_DaPeiShiContainCell()<UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic,strong) TR_DressShowVC *firstVC;
@property (nonatomic,strong) TR_DressServiceTableVC *secondVC;
@property (nonatomic,strong) TR_DressCommentVC *thirdVC;

@end

@implementation TR_DaPeiShiContainCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.scrollView];
        
        //        [self configScrollView];
    }
    return self;
}

- (void)setVC:(UIViewController *)VC{
    _VC=VC;
    [self configScrollView];
}

- (void)configScrollView{
    _firstVC=[TR_DressShowVC new];
    _firstVC.VC=_VC;
    _secondVC=[TR_DressServiceTableVC new];
    _secondVC.VC=_VC;
    _thirdVC = [TR_DressCommentVC new];
    _thirdVC.VC = _VC;
    
    [self.scrollView addSubview:_firstVC.view];
    [self.scrollView addSubview:_secondVC.view];
    [self.scrollView addSubview:_thirdVC.view];
    
    _firstVC.view.frame=CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WINDOW_HEIGHT-sliderHeight);
    _secondVC.view.frame=CGRectMake(SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_WINDOW_HEIGHT-sliderHeight);
    _thirdVC.view.frame=CGRectMake(SCREEN_WIDTH*2, 0, SCREEN_WIDTH, SCREEN_WINDOW_HEIGHT-sliderHeight);

}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    self.isSelectIndex = NO;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    // 为了横向滑动的时候，外层的tableView不动
    if (!self.isSelectIndex) {
        if (scrollView == self.scrollView) {
            if ([self.delegate respondsToSelector:@selector(containerScrollViewDidScroll:)]) {
                [self.delegate containerScrollViewDidScroll:scrollView];
            }
        }
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (scrollView == self.scrollView) {
        if ([self.delegate respondsToSelector:@selector(containerScrollViewDidEndDecelerating:)]) {
            [self.delegate containerScrollViewDidEndDecelerating:scrollView];
        }
    }
}


#pragma mark - Init Views
- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WINDOW_HEIGHT-sliderHeight)];
        _scrollView.delegate = self;
        _scrollView.pagingEnabled = YES;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.contentSize = CGSizeMake(_scrollView.frame.size.width * 2, _scrollView.frame.size.height);
    }
    return _scrollView;
}

- (void)setObjectCanScroll:(BOOL)objectCanScroll {
    _objectCanScroll = objectCanScroll;
    
    self.firstVC.vcCanScroll = objectCanScroll;
    self.secondVC.vcCanScroll = objectCanScroll;
    
    if (!objectCanScroll) {
        [self.firstVC.collectionView setContentOffset:CGPointZero animated:NO];
        [self.secondVC.tableView setContentOffset:CGPointZero animated:NO];
        [self.thirdVC.collectionView setContentOffset:CGPointZero animated:NO];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
