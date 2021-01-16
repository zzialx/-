//
//  TR_SexAndHeightVC.m
//  DaPeiShi
//
//  Created by admin on 2019/8/19.
//  Copyright © 2019 candy.chen. All rights reserved.
//

#import "TR_SexAndHeightVC.h"
#import "TR_WightAndSkinColorVC.h"
#import "DYScrollRulerView.h"
@interface TR_SexAndHeightVC ()<DYScrollRulerDelegate>

@property(nonatomic,strong)DYScrollRulerView *noneZeroRullerView;
@property (weak, nonatomic) IBOutlet UIView *mineHeightView;

@end

@implementation TR_SexAndHeightVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.navView setLeftImg:@"back_gray" title:@"编辑身材数据1/3" bgColor:UIColor.whiteColor];
    [self.mineHeightView addSubview:self.noneZeroRullerView];
}
- (IBAction)nextStepAction:(UIButton *)sender {
    TR_WightAndSkinColorVC * vc = [[TR_WightAndSkinColorVC alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
-(DYScrollRulerView *)noneZeroRullerView{
    if (!_noneZeroRullerView) {
        NSString *unitStr = @"";
        CGFloat rullerHeight = [DYScrollRulerView rulerViewHeight];
        _noneZeroRullerView = [[DYScrollRulerView alloc]initWithFrame:CGRectMake(5, 0, KScreenWidth-20, rullerHeight) theMinValue:140 theMaxValue:220  theStep:1 theUnit:unitStr theNum:5];
        [_noneZeroRullerView setDefaultValue:170 animated:YES];
        _noneZeroRullerView.bgColor = [UIColor whiteColor];
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
