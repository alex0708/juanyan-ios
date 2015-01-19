//
//  MingViewController.m
//  MobileSell
//
//  Created by zhuqing on 14/12/14.
//  Copyright (c) 2014年 Sandro. All rights reserved.
//

#import "MingViewController.h"

#define KScreenHeight [UIScreen mainScreen].bounds.size.height
#define KScreenWidth [UIScreen mainScreen].bounds.size.width

@interface MingViewController ()

@end

@implementation MingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //-------------backbtn
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(0, 0, 68, 33);
    [backButton setTitle:@"  返回" forState:UIControlStateNormal];
    [backButton setBackgroundImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [backButton setBackgroundImage:[UIImage imageNamed:@"back_on"   ] forState:UIControlStateHighlighted];
    [backButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    
    //----toplabel
    
    for (int i = 0; i<4; i++) {
        UILabel *topL = [[UILabel alloc] initWithFrame:CGRectMake((KScreenWidth/4)*i, 0, KScreenWidth/4, 80)];
        topL.numberOfLines = 0;
        topL.textAlignment = NSTextAlignmentCenter;
        topL.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"danlan"]];
        topL.layer.borderColor = [UIColor blackColor].CGColor;
        topL.layer.borderWidth = 1.0;
        if (i == 0) {
            topL.text = @"序号";
        }else if(i == 1){
            topL.text = @"牌号";
        }else if(i == 2){
            topL.text = @"数量（万支）";
        }else if(i == 3){
            topL.text = @"金额（元）";
        }
        
        [self.view addSubview:topL];
    }
    
    //--
    
    _scv1.frame = CGRectMake(0, 80, KScreenWidth, KScreenHeight - 200);
    //------------表格1
    
    
    int t = 2;//行数
    _scv1.contentSize = CGSizeMake(KScreenWidth, t*50);
    
    for (int i = 0; i<t; i++) {

        for (int j = 0; j<4; j++) {
            UILabel *bLabel = [[UILabel alloc] init];
            bLabel.tag = (i+1)*100+(j+1);
            
            bLabel.frame = CGRectMake((KScreenWidth/4)*j, 50*i, KScreenWidth/4, 50);
            bLabel.numberOfLines = 0;
            bLabel.textAlignment = NSTextAlignmentCenter;
            //bLabel.backgroundColor = [UIColor lightGrayColor];
            bLabel.layer.borderColor = [UIColor blackColor].CGColor;
            bLabel.layer.borderWidth = 0.5;
            
            if (bLabel.tag == 102) {
                bLabel.text = @"真龙（祥云）";
            }else if(bLabel.tag == 103) {
                bLabel.text = @"200";
            }else if(bLabel.tag == 202) {
                bLabel.text = @"真龙（软娇子）";
            }else if(bLabel.tag == 203) {
                bLabel.text = @"1350";
            }
            

            

            
            
            
            
            
            
            
            [_scv1 addSubview:bLabel];
            

            
            
        }
        //        [bImageView addSubview:bla];
    }
}


- (void)backAction
{
    [self.navigationController popViewControllerAnimated:YES];
    //[self dismissViewControllerAnimated:YES completion:nil];
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
