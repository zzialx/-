//
//  TR_UserModel.h
//  HouseProperty
//
//  Created by admin on 2018/9/18.
//  Copyright © 2018年 candy.chen. All rights reserved.
//

#import "TR_Model.h"

@interface TR_UserModel : TR_Model <NSCoding>

@property(strong, nonatomic) NSString *authenticateSign;//0审核中 1审核成功 2审核失败 3未提交审核
@property(strong, nonatomic) NSString *goodsCollectionNum; //收藏夹
@property(strong, nonatomic) NSString *nickName;//昵称
@property(strong, nonatomic) NSString *point;//积分
@property(strong, nonatomic) NSString *pointSign;//是否领积分 1：领了 0：未领 ,
@property(strong, nonatomic) NSURL *portraitPath;// 头像地址
@property(strong, nonatomic) NSString *printNum;//足迹数量
@property(strong, nonatomic) NSString *sexSign;// 1：男 2：女 ,
@property(strong, nonatomic) NSString *telephone;//手机号
@property(strong, nonatomic) NSString *shopConllectionNum;//关注的店铺 ,
@property(strong, nonatomic) NSString *waitDeliverNum;//待发货
@property(strong, nonatomic) NSString *waitEvaluateNum;//待评价
@property(strong, nonatomic) NSString *waitPayNum;//待付款
@property(strong, nonatomic) NSString *waitReceiveNum;// 待收货
@property (strong,nonatomic) NSString *relativePath; //头像半路径
@property (strong,nonatomic) NSString *afterSaleNum;//售后个数
@property (strong,nonatomic)NSString * signDay;//签到天数
@end
