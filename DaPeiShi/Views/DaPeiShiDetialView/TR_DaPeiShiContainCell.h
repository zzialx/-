//
//  TR_DaPeiShiContainCell.h
//  DaPeiShi
//
//  Created by xq的电脑 on 2019/8/17.
//  Copyright © 2019 candy.chen. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol  TR_DaPeiShiContainCellDelegate <NSObject>

@optional
- (void)containerScrollViewDidScroll:(UIScrollView *)scrollView;

- (void)containerScrollViewDidEndDecelerating:(UIScrollView *)scrollView;

@end


@interface TR_DaPeiShiContainCell : UITableViewCell

@property (nonatomic,strong) UIViewController *VC;
- (void)configScrollView;

@property (nonatomic, strong, readonly) UIScrollView *scrollView;

@property (nonatomic, assign) BOOL objectCanScroll;
@property (nonatomic, assign) BOOL isSelectIndex;

@property (nonatomic,weak) id<TR_DaPeiShiContainCellDelegate>delegate;
@end

NS_ASSUME_NONNULL_END
