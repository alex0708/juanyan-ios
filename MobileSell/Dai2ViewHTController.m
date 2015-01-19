//
//  Dai2ViewController.m
//  MobileSell
//
//  Created by zhuqing on 14/12/14.
//  Copyright (c) 2014年 Sandro. All rights reserved.
//

#import "Dai2ViewHTController.h"

#import "Dai21ViewHTController.h"
#import "Dai22ViewHTController.h"

@interface Dai2ViewHTController ()

@end

@implementation Dai2ViewHTController

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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)backAction
{
    [self.navigationController popViewControllerAnimated:YES];
    //[self dismissViewControllerAnimated:YES completion:nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;//+1
}





- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        
        NSArray *xibViews = [[NSBundle mainBundle] loadNibNamed:@"Dai2CellViewHT" owner:self options:NULL];
        cell = [xibViews lastObject];
        
    }
    
    UILabel *tv12lb = (UILabel *)[cell.contentView viewWithTag:202];
    UILabel *tv13lb = (UILabel *)[cell.contentView viewWithTag:203];
    UILabel *tv14lb = (UILabel *)[cell.contentView viewWithTag:204];
    UILabel *tv15lb = (UILabel *)[cell.contentView viewWithTag:205];
    
    if (indexPath.row == 0) {
        tv12lb.text = @"222333";
        tv13lb.text = @"333222";
        tv14lb.text = @"云南中烟工业有限责任公司";
        tv15lb.text = @"云南省烟草公司丽江市公司";
    } else if(indexPath.row == 1){
        tv12lb.text = @"23232";
        tv13lb.text = @"343435";
        tv14lb.text = @"上海烟草集团北京卷烟厂";
        tv15lb.text = @"上海烟草集团有限责任公司";
    } else if(indexPath.row == 2){
        tv12lb.text = @"56787";
        tv13lb.text = @"34677";
        tv14lb.text = @"河南中烟工业有限责任公司";
        tv15lb.text = @"河南省烟草公司焦作市公司";
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 130;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.row == 0)
    {
        Dai21ViewHTController *Dai21VC = [[Dai21ViewHTController alloc] init];
        
        Dai21VC.kkkey = _kkkey;
        [self.navigationController pushViewController:Dai21VC animated:YES];
    }else if(indexPath.row == 1){
        Dai22ViewHTController *Dai22VC = [[Dai22ViewHTController alloc] init];
        [self.navigationController pushViewController:Dai22VC animated:YES];
        Dai22VC.kkkey = _kkkey;
        
    }
   //DaiQ11ViewController *DaiQ11 = [[DaiQ11ViewController alloc] init];
    //[self.navigationController pushViewController:DaiQ11 animated:YES];
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
