//
//  DaiQ11ViewController.m
//  MobileSell
//
//  Created by zhuqing on 14/12/13.
//  Copyright (c) 2014年 Sandro. All rights reserved.
//

#import "DaiQ11ViewHTController.h"
#import "MingViewHTController.h"

#define KScreenHeight [UIScreen mainScreen].bounds.size.height
#define KScreenWidth [UIScreen mainScreen].bounds.size.width

@interface DaiQ11ViewHTController ()

@end

@implementation DaiQ11ViewHTController

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
    
    
    //----
    UIView *bView = [[UIView alloc] initWithFrame:CGRectMake(0, KScreenHeight-88-44-20, KScreenWidth, 44)];
    bView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"navbar_bg_normal"]];
    
    //[_tv1 addSubview:bView];
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn1.frame = CGRectMake(15, 6, 59, 32);
    [btn1 setTitle:@"确认" forState:UIControlStateNormal];
    [btn1 setBackgroundImage:[UIImage imageNamed:@"btnbg_blue"] forState:UIControlStateNormal];
    //[backButton setBackgroundImage:[UIImage imageNamed:@"back_on"   ] forState:UIControlStateHighlighted];
    [btn1 addTarget:self action:@selector(btn1Ac:) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn2.frame = CGRectMake(KScreenWidth-15-59, 6, 59, 32);
    [btn2 setTitle:@"明细" forState:UIControlStateNormal];
    [btn2 setBackgroundImage:[UIImage imageNamed:@"btnbg_blue"] forState:UIControlStateNormal];
    //[backButton setBackgroundImage:[UIImage imageNamed:@"back_on"   ] forState:UIControlStateHighlighted];
    [btn2 addTarget:self action:@selector(btn2Ac:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [bView addSubview:btn1];
    [bView addSubview:btn2];
    
    
    [self.view addSubview:bView];
    
    [self.view insertSubview:bView aboveSubview:_tv1];
    
    //[self.view bringSubviewToFront:bView];
    
}

- (void)btn1Ac:(UIButton *)button
{
    UIAlertView *da = [[UIAlertView alloc] initWithTitle:@"处理成功" message:@"" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    da.alertViewStyle = UIAlertViewStyleDefault;
    [da show];
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)btn2Ac:(UIButton *)button
{
    MingViewHTController *MingVC = [[MingViewHTController alloc] init];
    [self.navigationController pushViewController:MingVC animated:YES];
}


- (void)backAction
{
    [self.navigationController popViewControllerAnimated:YES];
    //[self dismissViewControllerAnimated:YES completion:nil];
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 100;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;//+1
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        
        NSArray *xibViews = [[NSBundle mainBundle] loadNibNamed:@"DaiQ11CellViewHT" owner:self options:NULL];
        cell = [xibViews lastObject];
        
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 259;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc] init];
    
    //        view.backgroundColor = [UIColor colorWithRed:0.059 green:1.000 blue:0.989 alpha:1.000];
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, 100)];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = @"待确认合同订单";
    titleLabel.textColor = [UIColor blackColor];
    titleLabel.backgroundColor = [UIColor clearColor];
    [view addSubview:titleLabel];
    return view;
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
