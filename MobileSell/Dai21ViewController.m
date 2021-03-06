//
//  Dai21ViewController.m
//  MobileSell
//
//  Created by zhuqing on 14/12/14.
//  Copyright (c) 2014年 Sandro. All rights reserved.
//

#import "Dai21ViewController.h"
#import "Dai21bViewController.h"

#define KScreenHeight [UIScreen mainScreen].bounds.size.height
#define KScreenWidth [UIScreen mainScreen].bounds.size.width

@interface Dai21ViewController ()

@end

@implementation Dai21ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self.view setUserInteractionEnabled:YES];
    
    //-------------backbtn
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(0, 0, 68, 33);
    [backButton setTitle:@"  返回" forState:UIControlStateNormal];
    [backButton setBackgroundImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [backButton setBackgroundImage:[UIImage imageNamed:@"back_on"   ] forState:UIControlStateHighlighted];
    [backButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    
    //------
    UILabel *topL = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, 50)];
    topL.textAlignment = NSTextAlignmentCenter;
    topL.text = @"省际电子交易专用工商协议（工商）";
    
    [self.view addSubview:topL];
    
    //-----zuoVie
    zuoView = [[UIView alloc] initWithFrame:CGRectMake(0, KScreenHeight-88-44-20, KScreenWidth, 44)];
    //zuoView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"navbar_bg_normal"]];
    
    //[_tv1 addSubview:bView];
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn1.frame = CGRectMake(15, 6, 59, 32);
    [btn1 setTitle:@"确认" forState:UIControlStateNormal];
    [btn1 setBackgroundImage:[UIImage imageNamed:@"btnbg_blue"] forState:UIControlStateNormal];
    //[backButton setBackgroundImage:[UIImage imageNamed:@"back_on"   ] forState:UIControlStateHighlighted];
    //[btn1 addTarget:self action:@selector(btn1Ac:) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn2.frame = CGRectMake(KScreenWidth-15-59, 6, 59, 32);
    [btn2 setTitle:@"作废" forState:UIControlStateNormal];
    [btn2 setBackgroundImage:[UIImage imageNamed:@"btnbg_blue"] forState:UIControlStateNormal];
    //[backButton setBackgroundImage:[UIImage imageNamed:@"back_on"   ] forState:UIControlStateHighlighted];
    //[btn2 addTarget:self action:@selector(btn2Ac:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [zuoView addSubview:btn1];
    [zuoView addSubview:btn2];
    
    
    [self.view addSubview:zuoView];
    //[zuoView setHidden:YES];
    
    
    //-----jie
    
    jieView = [[UIView alloc] initWithFrame:CGRectMake(0, KScreenHeight-88-44-20, KScreenWidth, 44)];
    //zuoView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"navbar_bg_normal"]];
    
    //[_tv1 addSubview:bView];
    
    UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn3.frame = CGRectMake(KScreenWidth/2-30, 6, 59, 32);
    [btn3 setTitle:@"解除" forState:UIControlStateNormal];
    [btn3 setBackgroundImage:[UIImage imageNamed:@"btnbg_blue"] forState:UIControlStateNormal];
    //[backButton setBackgroundImage:[UIImage imageNamed:@"back_on"   ] forState:UIControlStateHighlighted];
    //[btn1 addTarget:self action:@selector(btn1Ac:) forControlEvents:UIControlEventTouchUpInside];
    

    
    
    [jieView addSubview:btn3];
    //[jieView addSubview:btn2];
    
    
    [self.view addSubview:jieView];
    //[jieView setHidden:YES];
    
    //-----
        if ([_kkkey isEqualToString:@"0"]) {
            [jieView setHidden:YES];
            [zuoView setHidden:YES];
    
        }else if([_kkkey isEqualToString:@"3"]){
            [zuoView setHidden:NO];
            [jieView setHidden:YES];
        }else if([_kkkey isEqualToString:@"4"]){
            [jieView setHidden:NO];
            [zuoView setHidden:YES];
        }
    
    //----tongzhi
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationAction1:) name:@"2k" object:nil];
    
}


//- (void)notificationAction1:(NSNotification *)notification {
//    
//    NSString *te = [[notification userInfo] objectForKey:@"kkk"];
//    
//    NSLog(@"%@",te);
//    if ([te isEqualToString:@"0"]) {
//        
//    }else if([te isEqualToString:@"3"]){
//        [zuoView setHidden:NO];
//    }else if([te isEqualToString:@"4"]){
//        [jieView setHidden:NO];
//    }
//    
//    
//    
//}

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

- (IBAction)DaS:(UIControl *)sender {
   // NSLog(@"hehe");
    
    Dai21bViewController *Dai21bVC = [[Dai21bViewController alloc] init];
    [self.navigationController pushViewController:Dai21bVC animated:YES];
}
@end
