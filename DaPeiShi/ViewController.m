//
//  ViewController.m
//  DaPeiShi
//
//  Created by candylee on 2018/12/31.
//  Copyright © 2018年 candy.chen. All rights reserved.
//

#import "ViewController.h"
#import "TR_TabBarViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self viewManagerAdpter];
    // Do any additional setup after loading the view, typically from a nib.

}

-(void)viewManagerAdpter
{
    [self addChildViewController:[TR_TabBarViewController defaultTabBar]];
    [[TR_TabBarViewController defaultTabBar].view setFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds))];
    [self.view addSubview:[TR_TabBarViewController defaultTabBar].view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
