//
//  TR_FloatCommentCell.m
//  DaPeiShi
//
//  Created by admin on 2019/8/12.
//  Copyright © 2019 candy.chen. All rights reserved.
//

#import "TR_FloatCommentCell.h"

@interface TR_FloatCommentCell ()
@property (weak, nonatomic) IBOutlet UIView *commentView;
@end

@implementation TR_FloatCommentCell

- (void)setDataList:(NSMutableArray *)dataList{
    _dataList = dataList;
    self.table.dataArray = dataList;
}
- (void)setSelectIndex:(NSInteger)selectIndex{
    _selectIndex = selectIndex;
    self.table.selectIndex = self.selectIndex;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.commentView.layer.cornerRadius = 8;
    self.commentView.layer.masksToBounds = YES;
    self.dataList = [NSMutableArray arrayWithCapacity:0];
    
    WS(weakSelf);
    self.table.updateCurrentCell = ^(NSInteger index) {
        if (weakSelf.updateCuurentTable) {
            weakSelf.updateCuurentTable(index);
        }
    };
}
- (CommentTableVC*)table{
    if (IsNilOrNull(_table)) {
        _table = [CommentTableVC new];
        [self.commentView addSubview:_table.view];
        _table.view.sd_layout.leftSpaceToView(self.commentView, 16)
        .topSpaceToView(self.commentView, 16)
        .rightSpaceToView(self.commentView, 16)
        .bottomSpaceToView(self.commentView, 16);
        _table.dataArray = [NSMutableArray arrayWithCapacity:0];
    }
    return _table;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
