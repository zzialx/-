//
//  UIView+Clicks.h
//  HouseProperty
//
//  Created by isaac on 2018/9/11.
//  Copyright © 2018年 candy.chen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TR_BaseViewController.h"
@interface UIView (Clicks)
- (void)addClickEvent:(id)target action:(SEL)action;
- (TR_BaseViewController *)viewController;
@end
