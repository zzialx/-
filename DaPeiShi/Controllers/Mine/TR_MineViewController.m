//
//  TR_MineViewController.m
//  DaPeiShi
//
//  Created by xq的电脑 on 2019/6/16.
//  Copyright © 2019 candy.chen. All rights reserved.
//

#import "TR_MineViewController.h"
#import "TR_MineHeadView.h"
#import "TR_MineDataCell.h"
#import "TR_MineOrderCell.h"
#import "TR_PersonInfoVC.h"
#import "TR_MineOrderVC.h"
#import "TR_PublichDressPicVC.h"
#import "TR_PublishDressVideoVC.h"
#import "TR_DataShareVC.h"
#import "TR_TeacherApplyVC.h"
#import "TR_DaPeiShiServiceVC.h"
#import "TR_MineMoneyVC.h"
#import "TR_LoginViewController.h"

@interface TR_MineViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView * mineTab;
@property(nonatomic,strong)TR_MineHeadView * headView;
@end

@implementation TR_MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if (@available(iOS 11.0, *)) {
        self.mineTab.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    [self mineTab];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 6;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat rowHeight = 60;
    if (indexPath.row==0) {
        rowHeight=100;
    }
    return rowHeight;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    WS(weakSelf);
    if (indexPath.row==0) {
        TR_MineOrderCell * order_cell =[tableView dequeueReusableCellWithIdentifier:@"cell1" forIndexPath:indexPath];
//        if (order_cell==nil) {
//            order_cell = [[TR_MineOrderCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell1"];
//        }
        order_cell.seeOrderDetail = ^(MineOrder_Type detialType) {
            [weakSelf seeMineOrderDetial:detialType];
        };

        return order_cell;
    }else{
        TR_MineDataCell * data_cell = [tableView dequeueReusableCellWithIdentifier:@"cell2" forIndexPath:indexPath];
//        if (data_cell==nil) {
//            data_cell = [[TR_MineDataCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell2"];
//        }
        return data_cell;
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==0) {
        TR_LoginViewController * vc  = [[TR_LoginViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES hideBottomTabBar:YES];
    }if (indexPath.row==1) {
        TR_PublichDressPicVC * vc  =[[TR_PublichDressPicVC alloc]init];
        [self.navigationController pushViewController:vc animated:YES hideBottomTabBar:YES];
        //    TR_PublishDressVideoVC * vc  =[[TR_PublishDressVideoVC alloc]init];
    }if (indexPath.row== 2) {
        TR_DataShareVC * vc  =[[TR_DataShareVC alloc]init];
        [self.navigationController pushViewController:vc animated:YES hideBottomTabBar:YES];
    }if (indexPath.row==3){
        TR_TeacherApplyVC * vc = [[TR_TeacherApplyVC alloc]init];
        [self.navigationController pushViewController:vc animated:YES hideBottomTabBar:YES];
    }if(indexPath.row==4){
        TR_DaPeiShiServiceVC * vc  = [[TR_DaPeiShiServiceVC alloc]init];
         [self.navigationController pushViewController:vc animated:YES hideBottomTabBar:YES];
    }if (indexPath.row == 5) {
        TR_MineMoneyVC * vc = [[TR_MineMoneyVC alloc]init];
        [self.navigationController pushViewController:vc animated:YES hideBottomTabBar:YES];
//        [self jumpToBizPay];
    }
   

    
}
#pragma mark------订单查看
- (void)seeMineOrderDetial:(MineOrder_Type)type{
    TR_MineOrderVC * vc = [[TR_MineOrderVC alloc]init];
    [self.navigationController pushViewController:vc animated:YES hideBottomTabBar:YES];
}
#pragma mark-----头部点击事件
- (void)seeHeadDetial:(MineHead_Type)type{
    if (type == MineHead_Type_Person) {
        TR_PersonInfoVC * vc = [[TR_PersonInfoVC alloc]init];
        [self.navigationController pushViewController:vc animated:YES hideBottomTabBar:YES];
    }
    if (type == MineHead_Type_Money){
        
    }
}
- (UITableView*)mineTab{
    if (IsNilOrNull(_mineTab)) {
        _mineTab=[[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        [self.view addSubview:_mineTab];
        _mineTab.sd_layout.leftEqualToView(self.view)
        .topEqualToView(self.view)
        .rightEqualToView(self.view)
        .bottomSpaceToView(self.view, 0);
        _mineTab.delegate=self;
        _mineTab.dataSource=self;
        [_mineTab registerNib:[UINib nibWithNibName:@"TR_MineOrderCell" bundle:nil] forCellReuseIdentifier:@"cell1"];
        [_mineTab registerNib:[UINib nibWithNibName:@"TR_MineDataCell" bundle:nil] forCellReuseIdentifier:@"cell2"];
        _mineTab.separatorStyle=UITableViewCellSeparatorStyleNone;
        UIView * mineHeadView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 271)];
        [mineHeadView addSubview:self.headView];
        self.mineTab.tableHeaderView = mineHeadView;
    }
    return _mineTab;
}
- (TR_MineHeadView*)headView{
    if (IsNilOrNull(_headView)) {
        _headView = (TR_MineHeadView*)[[[NSBundle mainBundle] loadNibNamed:@"TR_MineHeadView" owner:self options:nil]lastObject];
        WS(weakSelf);
        _headView.seeDetial = ^(MineHead_Type type) {
            [weakSelf seeHeadDetial:type];
        };
    }
    return _headView;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (NSString *)jumpToBizPay {
    
    //============================================================
    // V3&V4支付流程实现
    // 注意:参数配置请查看服务器端Demo
    // 更新时间：2015年11月20日
    //============================================================
    NSString *urlString   = @"https://wxpay.wxutil.com/pub_v2/app/app_pay.php?plat=ios";
    //解析服务端返回json数据
    NSError *error;
    //加载一个NSURL对象
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    //将请求的url数据放到NSData对象中
    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    if ( response != nil) {
        NSMutableDictionary *dict = NULL;
        //IOS5自带解析类NSJSONSerialization从response中解析出数据放到字典中
        dict = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableLeaves error:&error];
        
        NSLog(@"url:%@",urlString);
        if(dict != nil){
            NSMutableString *retcode = [dict objectForKey:@"retcode"];
            if (retcode.intValue == 0){
                NSMutableString *stamp  = [dict objectForKey:@"timestamp"];
                
                //调起微信支付
                PayReq* req             = [[PayReq alloc] init];
                req.partnerId           = [dict objectForKey:@"partnerid"];
                req.prepayId            = [dict objectForKey:@"prepayid"];
                req.nonceStr            = [dict objectForKey:@"noncestr"];
                req.timeStamp           = stamp.intValue;
                req.package             = [dict objectForKey:@"package"];
                req.sign                = [dict objectForKey:@"sign"];
                [WXApi sendReq:req];
                //日志输出
                NSLog(@"appid=%@\npartid=%@\nprepayid=%@\nnoncestr=%@\ntimestamp=%ld\npackage=%@\nsign=%@",[dict objectForKey:@"appid"],req.partnerId,req.prepayId,req.nonceStr,(long)req.timeStamp,req.package,req.sign );
                return @"";
            }else{
                return [dict objectForKey:@"retmsg"];
            }
        }else{
            return @"服务器返回错误，未获取到json对象";
        }
    }else{
        return @"服务器返回错误";
    }
}
@end
