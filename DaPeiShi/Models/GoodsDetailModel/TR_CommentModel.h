//
//  TR_CommentModel.h
//  DaPeiShi
//
//  Created by apple on 2019/1/4.
//  Copyright © 2019年 candy.chen. All rights reserved.
//

#import "TR_Model.h"
#import "TR_FileModel.h"

@class TR_CommentList;
@interface TR_CommentModel : TR_Model
@property(nonatomic,copy)NSString * comments;
@property(nonatomic,copy)NSString * createTime;
@property(nonatomic,copy)NSString * logo;
@property(nonatomic,copy)NSString * nickName;
@property(nonatomic,copy)NSString * normDesc;
@property(nonatomic,copy)NSString * praiseAmount;
@property(nonatomic,copy)NSString * praiseSign;///<【点赞】按钮标记：Y-可点赞、N-已点赞 ,
@property(nonatomic,copy)NSString * reportSign;///<【举报】按钮标记：Y-可举报、N-已举报 ,
@property(nonatomic,assign)NSInteger  score;
@property(nonatomic,assign)NSInteger  scoreId;//举报标识id
@property(nonatomic,strong)TR_CommentList *againScoreVO;
@property(nonatomic,strong)NSArray *imgPathLst;

@end

@interface TR_CommentList : TR_Model

@property(nonatomic,copy)NSString * comments;
@property(nonatomic,copy)NSString * createTime;
@property(nonatomic,copy)NSString * scoreType;
@property(nonatomic,strong)NSArray *imgPathLst;

@end

@interface TR_CommentInfoModel : TR_Model
@property (nonatomic,assign)NSInteger  goodsRate;///<好评率
@property (nonatomic,assign)NSInteger  total;///<评价总数
@end
