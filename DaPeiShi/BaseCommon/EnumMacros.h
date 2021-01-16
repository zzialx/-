//
//  EnumMacros.h
//  Traceability
//
//  Created by candy.chen on 2018/9/03.
//  Copyright © 2018年 candy.chen. All rights reserved.
//

#ifndef EnumMacros_h
#define EnumMacros_h

typedef void(^clickAction)(NSString * actionId);

typedef NS_ENUM(NSInteger, TR_DataLoadingType) {
    TR_DataLoadingTypeRefresh = 1,  //刷新数据
    TR_DataLoadingTypeInfinite = 2, //下一页数据
};

typedef NS_ENUM(NSInteger, ScrollViewLoadingState) {
    ScrollViewLoadingState_Idle       = -1,
    ScrollViewLoadingState_LoadingNew = 0,
    ScrollViewLoadingState_LoadingMore
};

//LOADING
typedef NS_ENUM(NSInteger, SHGProgressHUDType)
{
    SHGProgressHUDTypeNormal = 0,
    SHGProgressHUDTypeGray
};

typedef NS_ENUM (NSInteger,TR_GoodsInfoType){
    TR_InfoType_Score,//积分
    TR_InfoType_Discount,//优惠券
    TR_InfoType_Normal,//规格
    TR_InfoType_Parameter,//参数
    TR_InfoType_AllComment,//查看所有评论
    TR_InfoType_Detail,//详情
};

typedef NS_ENUM(NSInteger,TR_NoticeType) {
    TR_Notice_News = 0,//行业资讯
    TR_Notice_Publish,//公示公告
};

typedef NS_ENUM(NSInteger,TR_PayResultType) {
    TR_PayResult_Success,//支付成功
    TR_PayResult_Fail,//支付失败
};

typedef NS_ENUM(NSInteger,TR_PayResultAction) {
    TR_Result_RePay,//重新支付
    TR_Result_Order,//查看订单
    TR_Result_Home,//返回首页
    TR_Result_SecondKill,//返回我的秒杀
};
typedef NS_ENUM(NSInteger,TR_MyAuctionType) {
    TR_MyAuctionType_Biding,//竞拍中
    TR_MyAuctionType_NoBided,//未拍中
    TR_MyAuctionType_Bided,//已拍下
};

typedef NS_ENUM(NSInteger,NO_DATATYPE){
    NO_DATATYPE_NODATA = 0,
    NO_DATATYPE_NOMESSAGE,
    NO_DATATYPE_NETERROR,
    NO_DATATYPE_NOCOLLECTIONPRO, //无收藏商品
    NO_DATATYPE_NOCOLLECTIONSHOP, //五无收藏店铺
    NO_DATATYPE_NOCOUPON,  //无优惠券
    NO_DATATYPE_CARTNOLOGIN,//购物车未登录
    NO_DATATYPE_CARTNOPRO, //购物车无商品
    NO_DATATYPE_FOOTPRINT //无足迹
};

// 请求方式
typedef NS_ENUM(NSInteger, RequestType) {
    RequestTypeGet = 0,
    RequestTypePost,
    RequestTypeUpLoad,
    RequestTypeUpArrayLoad,
    RequestTypeDownload
};

//订单状态
typedef NS_ENUM(NSInteger, OrderRequestStatusType) {
    OrderRequestStatusTypeDefault = 0,//默认
    OrderRequestStatusTypeCance,//取消订单
    OrderRequestStatusTypePay,//付款
    OrderRequestStatusTypePayNow,//立即付款
    OrderRequestStatusTypeDelect,//删除订单
    OrderRequestStatusTypeExpress,//查看物流
    OrderRequestStatusTypeExtendReceipt,//延长收货
    OrderRequestStatusTypeConfirmReceipt,//确认收货
    OrderRequestStatusTypeAssess,//评价
    OrderRequestStatusTypeAgainAssess,//追加评价
    OrderRequestStatusTypeAfterSale,//申请售后
    OrderRequestStatusTypeRefund,//已退款
    OrderRequestStatusTypeReminderShip,//提醒发货
    OrderRequestStatusTypeComplain,//发起投诉
    OrderRequestStatusTypeAfterSaleDdetail,//申请售后详情页
};

typedef NS_ENUM(NSInteger, OrderCommentType) {
    OrderCommentTypeFirst = 0,//评论
    OrderCommentTypeSecond,//追评
};

typedef NS_ENUM(NSInteger, OrderApplyReasonType) {
    OrderApplyReasonTypeComplain = 0,//投诉
    OrderApplyReasonTypeAfter,//售后
};

typedef NS_ENUM(NSInteger, OrderCommentLevelType) {
    OrderCommentLevelTypeGood = 0,//好评
    OrderCommentLevelTypeMiddle,//中评
    OrderCommentLevelTypeBad,//差评
};

typedef NS_ENUM(NSInteger, OrderAfterSaleType) {
    OrderAfterSaleTypeMoneying = 0,//仅退款 待处理
    OrderAfterSaleTypeRefuseMoney,//仅退款 售后申请已拒绝
    OrderAfterSaleTypeReturnMoney,//仅退款 已退款
    OrderAfterSaleTypeReturnRefunding,//退货退款 待处理
    OrderAfterSaleTypeRefuseReturnRefund,//退货退款 售后申请已拒绝
    OrderAfterSaleTypeReturnRefundSure,//退货退款 待卖家确认收货
    OrderAfterSaleTypeReturnRefundMoney,//退货退款 已退款
    OrderAfterSaleTypeReplaceing,//换货 待处理
    OrderAfterSaleTypeReplaceRefuse,//换货 售后申请已拒绝
    OrderAfterSaleTypeReplaceShipped,//换货 待发货
    OrderAfterSaleTypeReplaceReceived,//换货 待收货
    OrderAfterSaleTypeReplaceSure,//换货 已换货
    OrderAfterSaleTypeComplain,//订单投诉
};

typedef NS_ENUM(NSInteger, ApplyType) {
    ApplyTypeAfterSales = 0,//售后类型
    ApplyTypeReason,//售后原因
    ApplyTypeComplain,//投诉类型
    ApplyTypeComplainReason//投诉原因
};
/*竞拍状态*/
typedef  enum{
    AUCTION_STATE_TYPE_ALL = 0,
    AUCTION_STATE_TYPE_NOSTART,
    AUCTION_STATE_TYPE_BEGINGING,
    AUCTION_STATE_TYPE_STOP,
    AUCTION_STATE_TYPE_END,
}AUCTION_STATE_TYPE;

typedef NS_ENUM(NSInteger, CheckTelephoneCodeType) {
    CheckTelephoneCodeTypeModify = 0,//校验手机验证码(修改登录密码)
    CheckTelephoneCodeTypeReset,//校验手机验证码(重置手机号)
    CheckTelephoneCodeTypeForget,//校验手机号（忘记密码)
};

typedef NS_ENUM(NSInteger,SHOPVC_TYPE) {
    SHOPVC_TYPE_ALLDOODS = 0,//所有商品
    SHOPVC_TYPE_HOTSALE,//热销
    SHOPVC_TYPE_NEWGOODS,//新品
    SHOPVC_TYPE_RECOMMEND,//推荐
    SHOPVC_TYPE_CATEGORY,//分类
    SHOPVC_TYPE_Main,//主页面
};
typedef NS_ENUM(NSInteger,BTN_TYPE) {
    BTN_TYPE_CONTACT= 0,//联系我们
    BTN_TYPE_SHOP,//商店
    BTN_TYPE_FAVORITE,//收藏
    BTN_TYPE_ADDCAR,//加入购物车
    BTN_TYPE_BUY,//立即购买
    BTN_TYPE_CANCLE_FAV,//取消收藏
} ;
typedef NS_ENUM(NSInteger,INFO_TYPE) {
    INFO_TYPE_NORMAL = 0,//普通商品
    INFO_TYPE_KILL,//秒杀
    INFO_TYPE_NOGOODS,//暂无库存
    INFO_TYPE_OFFSHOP,//下架
};
typedef NS_ENUM(NSInteger,AfterSalesDetailType) {
    AfterSalesDetailTypeAfter = 0,//售后列表
    AfterSalesDetailTypeOrderDetail,//我的订单详情页
};

typedef NS_ENUM (NSInteger, SORT_TYPE){
    SORT_TYPE_ALL = 0,//综合排序
    SORT_TYPE_SALE,//销量
    SORT_TYPE_PRICE_DESC,//价格降序
    SORT_TYPE_PRICE_ASC,//价格升序
};


//推送类型和banner跳转类型
typedef NS_ENUM (NSInteger, TR_JumpType){
    TR_JumpTypeH5,//H5
    TR_JumpTypeH5Local,//本地H5
    TR_JumpTypeTeaMarket,//茶市
    TR_JumpTypeHouseMarket,//湄潭产权
    TR_JumpTypeHouseGZ,//贵州产权
    TR_JumpTypeHouseTD,//土地二级市场
    TR_JumpTypeOrigins,//溯源
    TR_JumpTypeHome,//首页
    TR_JumpTypeSearch,//搜索
    TR_JumpTypeNotice,//公告公示
    TR_JumpTypeProduce,//热销商品
    TR_JumpTypeShop,//热销店铺
    TR_JumpTypeCategary,//分类
    TR_JumpTypeShopping,//购物车
    TR_JumpTypeProduceDetail,//商品详情页
    TR_JumpTypeShopDetail,//店铺详情页
    TR_JumpTypeMy,//我的
    TR_JumpTypeMyStore,//我的收藏夹
    TR_JumpTypeMyFollow, //关注店铺
    TR_JumpTypeMyFooter, //我的足迹
    TR_JumpTypeMyOrder,//我的订单
    TR_JumpTypeMyKill,//我的秒杀
    TR_JumpTypeMyCoupon,//我的优惠券
    TR_JumpTypeMyShop,//积分商城
    TR_JumpTypeMyCouponCenter,// 领券中心
    TR_JumpTypeMyKillCenter,//秒杀专区
    TR_JumpTypeLogin,//登录
    TR_JumpTypeMyInformation,//个人信息
};

typedef NS_ENUM(NSInteger,TR_NORMALVIEW_TYPE) {
    TR_NORMALVIEW_TYPE_ADDCAR_FOOT = 0,//点击购物车弹出规格view
    TR_NORMALVIEW_TYPE_BUYNOW_FOOT ,//点击立即购买弹出规格view
    TR_NORMALVIEW_TYPE_BUYNOW_KILLL_FOOT ,//点击秒杀立即购买弹出规格view
    TR_NORMALVIEW_TYPE_ADDCAR ,//点击规格view弹出加入购物车
    TR_NORMALVIEW_TYPE_BUYNOW ,//点击规格view弹出立即购买
    TR_NORMALVIEW_TYPE_BUYNOW_KILLL ,//秒杀点击规格view弹出立即购买
};

typedef NS_ENUM(NSInteger,CLASS_TYPE) {
    HEADER_SCAN = 0,
    HEADER_SEARCH,
    HEADER_MESSAGE,
};


#endif /* EnumMacros_h */
