//
//  TR_UserSetInfoVC.m
//  DaPeiShi
//
//  Created by admin on 2019/8/16.
//  Copyright © 2019 candy.chen. All rights reserved.
//

#import "TR_UserSetInfoVC.h"
#import "DYScrollRulerView.h"

@interface TR_UserSetInfoVC ()<DYScrollRulerDelegate>

@property(nonatomic,strong)DYScrollRulerView *noneZeroRullerView;

@end

@implementation TR_UserSetInfoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
-(DYScrollRulerView *)noneZeroRullerView{
    if (!_noneZeroRullerView) {
        NSString *unitStr = @"";
        CGFloat rullerHeight = [DYScrollRulerView rulerViewHeight];
        _noneZeroRullerView = [[DYScrollRulerView alloc]initWithFrame:CGRectMake(5, KScreenHeight/5.0*3.5, KScreenWidth-20, rullerHeight) theMinValue:20 theMaxValue:200  theStep:1 theUnit:unitStr theNum:5];
        [_noneZeroRullerView setDefaultValue:50 animated:YES];
        //        _noneZeroRullerView.bgColor = [UIColor orangeColor];
        //        _noneZeroRullerView.triangleColor   = [UIColor redColor];
        _noneZeroRullerView.delegate        = self;
        _noneZeroRullerView.scrollByHand    = YES;
    }
    return _noneZeroRullerView;
}
#pragma mark - YKScrollRulerDelegate
-(void)dyScrollRulerView:(DYScrollRulerView *)rulerView valueChange:(float)value{
    
    NSLog(@"value->%.f",value);
    
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
