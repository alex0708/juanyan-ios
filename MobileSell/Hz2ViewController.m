//
//  Hz2ViewController.m
//  MobileSell
//
//  Created by zhuqing on 14/12/14.
//  Copyright (c) 2014年 Sandro. All rights reserved.
//

#import "Hz2ViewController.h"

@interface Hz2ViewController ()

@end

@implementation Hz2ViewController

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
        
        NSArray *xibViews = [[NSBundle mainBundle] loadNibNamed:@"Hz2CellView" owner:self options:NULL];
        cell = [xibViews lastObject];
        
    }
    
    UILabel *tv11lb = (UILabel *)[cell.contentView viewWithTag:80201];
    UILabel *tv12lb = (UILabel *)[cell.contentView viewWithTag:80202];

    
    if (indexPath.row == 0) {
        tv11lb.text = @"云南中烟工业有限责任公司";
        tv12lb.text = @"云南省烟草公司丽江市公司";
    } else if(indexPath.row == 1){
        tv11lb.text = @"上海烟草集团北京卷烟厂";
        tv12lb.text = @"上海烟草集团有限责任公司";
    } else if(indexPath.row == 2){
        tv11lb.text = @"河南中烟工业有限责任公司";
        tv12lb.text = @"河南省烟草公司焦作市公司";
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    

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
