//
//  TR_ShopSelectReusableView.m
//  TeaCity
//
//  Created by admin on 2019/4/10.
//  Copyright © 2019年 candy.chen. All rights reserved.
//

#import "TR_ShopSelectReusableView.h"
#import "TR_SelectItemView.h"
@interface TR_ShopSelectReusableView ()
@property(nonatomic,strong)TR_SelectItemView*selectView;
@end

@implementation TR_ShopSelectReusableView

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.backgroundColor=UIColor.orangeColor;
//    [self addSubview:self.selectView];
//    self.selectView.sd_layout.leftSpaceToView(self, 0).topSpaceToView(self, 0).rightSpaceToView(self, 0).heightIs(40);
}
- (TR_SelectItemView*)selectView{
    if (!_selectView) {
        _selectView =(TR_SelectItemView*)[[[NSBundle mainBundle] loadNibNamed:@"TR_SelectItemView" owner:nil options:nil] lastObject];
        //        [self.view addSubview:_selectView];
        //        //        _selectView.sd_layout.leftSpaceToView(self.view, 0).topSpaceToView(self.view, 0).rightSpaceToView(self.view, 0).heightIs(40);
//        WS(weakSelf);
        _selectView.selectItem = ^(SORT_TYPE type) {
            switch (type) {
                case SORT_TYPE_ALL:{
//                    weakSelf.sortType = @"1";
                } break;
                case SORT_TYPE_SALE:{
//                    weakSelf.sortType = @"2";
                } break;
                case SORT_TYPE_PRICE_DESC:{
//                    weakSelf.sortType = @"4";
                } break;
                case SORT_TYPE_PRICE_ASC:{
//                    weakSelf.sortType = @"3";
                } break;
                default:
                    break;
            }
//            [weakSelf loadRefreshData];
        };
    }
    return _selectView;
}
@end
