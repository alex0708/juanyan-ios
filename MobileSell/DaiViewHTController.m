//
//  DaiViewController.m
//  MobileSell
//
//  Created by zhuqing on 14/12/13.
//  Copyright (c) 2014年 Sandro. All rights reserved.
//

#import "DaiViewHTController.h"
#import "DaiQue1ViewHTController.h"
#import "Dai2ViewHTController.h"

@interface DaiViewHTController ()

@end

@implementation DaiViewHTController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title  = @"合同";
    
    
    //-------------backbtn
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(0, 0, 68, 33);
    [backButton setTitle:@"  返回" forState:UIControlStateNormal];
    [backButton setBackgroundImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [backButton setBackgroundImage:[UIImage imageNamed:@"back_on"   ] forState:UIControlStateHighlighted];
    [backButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    
    //-----cellview
    _tv1.delegate = self;
    _tv1.dataSource = self;
    self.view = _tv1;
    
    xiang2 = @[@"待确认合同订单",@"待确认解除合同订单",@"未通过鉴章的合同订单"];
}

- (void)backAction
{
    [self.navigationController popViewControllerAnimated:YES];
    //[self dismissViewControllerAnimated:YES completion:nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return xiang2.count;//+1
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RootCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"RootCell"] ;
    }
    
    
    
    
    cell.textLabel.text = xiang2[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        DaiQue1ViewHTController *daiQ1 = [[DaiQue1ViewHTController alloc]init];
        [self.navigationController pushViewController:daiQ1 animated:YES];

    }else if (indexPath.row == 1) {
        Dai2ViewHTController *daiQ2 = [[Dai2ViewHTController alloc]init];
        [self.navigationController pushViewController:daiQ2 animated:YES];
        daiQ2.kkkey = _kkkey;
        
    }else if (indexPath.row == 2) {
        Dai2ViewHTController *daiQ2 = [[Dai2ViewHTController alloc]init];
        daiQ2.kkkey = _kkkey;
        [self.navigationController pushViewController:daiQ2 animated:YES];
        
    }
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
