//
//  TR_IDCardView.h
//  HouseProperty
//
//  Created by candy.chen on 2018/9/12.
//  Copyright © 2018年 candy.chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TR_SelectImagesView : UIView
typedef void (^offstHightBlock)(CGFloat hight);

@property (strong, nonatomic) offstHightBlock hightBlock;

@property (strong, nonatomic) ArrayBlock imageBlock;

@property(strong, nonatomic) NSString* title;

-(NSMutableArray*)getFinalImageArray;
@end
