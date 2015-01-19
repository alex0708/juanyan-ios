//
//  ChaViewController.m
//  MobileSell
//
//  Created by zhuqing on 14/12/14.
//  Copyright (c) 2014年 Sandro. All rights reserved.
//

#import "ChaViewHTController.h"

#import "HuiZViewHTController.h"
#import "MingChaViewHTController.h"
#import "XieShengChaViewHTController.h"

@interface ChaViewHTController ()

@end

@implementation ChaViewHTController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
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
//    _tv1.delegate = self;
//    _tv1.dataSource = self;
  //  self.view = _tv1;
    
    xiang = @[@"合同单份查询",@"合同汇总查询",@"合同明细查询",@"合同省公司查询",@"合同修改纪录查询"];
}

- (void)backAction
{
    [self.navigationController popViewControllerAnimated:YES];
    //[self dismissViewControllerAnimated:YES completion:nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return xiang.count;//+1
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RootCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"RootCell"] ;
    }
    
    
    
    
    cell.textLabel.text = xiang[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {

        
    }else if (indexPath.row == 1) {
        HuiZViewHTController *HzVC = [[HuiZViewHTController alloc]init];
        [self.navigationController pushViewController:HzVC animated:YES];

        
    }else if (indexPath.row == 2) {
        MingChaViewHTController *MingChaVC = [[MingChaViewHTController alloc] init];
        [self.navigationController pushViewController:MingChaVC animated:YES];

    }else if (indexPath.row == 3) {
        XieShengChaViewHTController *XieSVC = [[XieShengChaViewHTController alloc] init];
        [self.navigationController pushViewController:XieSVC animated:YES];
        
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
