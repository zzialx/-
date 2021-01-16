//
//  CommentTableVC.h
//  DaPeiShi
//
//  Created by admin on 2019/8/12.
//  Copyright © 2019 candy.chen. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^updateCurrentCell)(NSInteger index);
@interface CommentTableVC : UITableViewController

@property(nonatomic,strong)NSMutableArray * dataArray;
@property(nonatomic,copy)updateCurrentCell  updateCurrentCell;
@property (assign, nonatomic)NSInteger selectIndex;

@end

NS_ASSUME_NONNULL_END
