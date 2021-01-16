//
//  UITableView+Extension.h
//  HouseProperty
//
//  Created by isaac on 2018/9/11.
//  Copyright © 2018年 candy.chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (Extension)
-(void)setHeightWithSystemVersion;


/**
 允许tableView滑动，不允许点击
 */
-(void)stopTouchButCanScroll;

/**
允许点击
*/
-(void)allowCellClick;
@end
