//
//  DataShareHeadCell.h
//  DaPeiShi
//
//  Created by admin on 2019/8/16.
//  Copyright © 2019 candy.chen. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DataShareHeadCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *dataNameType;
@property (weak, nonatomic) IBOutlet UILabel *dataLine;
- (void)showCellStateIsKillIng:(BOOL)isKilling title:(NSString*)title;
@end

NS_ASSUME_NONNULL_END
