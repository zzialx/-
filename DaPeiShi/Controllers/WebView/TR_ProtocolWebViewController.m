//
//  TR_ProtocolWebViewController.m
//  HouseProperty
//
//  Created by candy.chen on 2018/9/28.
//  Copyright © 2018年 candy.chen. All rights reserved.
//

#import "TR_ProtocolWebViewController.h"

@interface TR_ProtocolWebViewController ()

@property (copy, nonatomic) NSString *webUrl;

@end

@implementation TR_ProtocolWebViewController

- (instancetype)initWithProtocolType:(NSString *)url
{
    self = [super init];
    if (self) {
        self.webUrl = url;
    }
    return self;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadWebRequest:self.webUrl];
    self.navView.backgroundColor = [UIColor whiteColor];
    self.navView.titleLabel.textColor = [UIColor blackColor];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
