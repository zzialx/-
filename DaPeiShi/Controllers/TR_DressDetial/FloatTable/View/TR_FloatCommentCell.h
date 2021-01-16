//
//  TR_FloatCommentCell.h
//  DaPeiShi
//
//  Created by admin on 2019/8/12.
//  Copyright © 2019 candy.chen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommentTableVC.h"

NS_ASSUME_NONNULL_BEGIN
typedef void(^updateCurrentTable)(NSInteger selectIndx);
@interface TR_FloatCommentCell : UITableViewCell

@property (nonatomic,copy)updateCurrentTable updateCuurentTable;
@property (strong, nonatomic)CommentTableVC * table;
@property (strong, nonatomic)NSMutableArray * dataList;
@property (assign, nonatomic)BOOL isOpen;
@property (assign, nonatomic)NSInteger selectIndex;
@end

NS_ASSUME_NONNULL_END
