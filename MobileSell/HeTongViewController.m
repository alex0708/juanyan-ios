//
//  HeTongViewController.m
//  MobileSell
//
//  Created by zhuqing on 14/12/13.
//  Copyright (c) 2014年 Sandro. All rights reserved.
//

#import "HeTongViewController.h"

#import "DaiViewHTController.h"
#import "ZuoViewHTController.h"
#import "ChaViewHTController.h"

@interface HeTongViewController ()

@end




@implementation HeTongViewController

@synthesize kkkey;
@synthesize imagesName;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _tv1.delegate = self;
    _tv1.dataSource = self;
    self.view = _tv1;
    
    //self.title = @"合同";
    UIFont* font = [UIFont fontWithName:@"Arial-ItalicMT" size:21.0];
    NSDictionary* textAttributes = @{NSFontAttributeName:font,
                                     NSForegroundColorAttributeName:[UIColor whiteColor]};
    
    
    [self.navigationController.navigationBar setTitleTextAttributes:textAttributes];
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navbar_bg_normal"] forBarMetrics:UIBarMetricsDefault];
    
    
    
    xiang = @[@"       待办任务列表",@"       合同申请",@"       合同订单跟踪",@"       合同确认、作废",@"       合同解除",@"       合同调整",@"       合同调整跟踪",@"       合同查询"];
    imagesName = [NSMutableArray arrayWithCapacity:1];
    [imagesName addObject:@"aaa"];
    
    for (int i = 0; i<8; i++) {
        
        NSString *a = [NSString stringWithFormat:@"xy0%d00.jpg",(i+1)];
        UIImage *si = [UIImage imageNamed:a];
        
        imagesName[i] = si;
        
    }
    
    NSLog(@"%@",imagesName);
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
    
    UIImageView *touImg = [[UIImageView alloc] initWithImage:imagesName[indexPath.row]];
    
    //cell.imageView.image = imagesName[indexPath.row];
    
    touImg.frame = CGRectMake(10, 10, 36, 30);
    
    [cell addSubview:touImg];
    cell.textLabel.text = xiang[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        kkkey = @"0";
        
        
        DaiViewHTController *daiVC = [[DaiViewHTController alloc]init];
        daiVC.kkkey = kkkey;
        [self.navigationController pushViewController:daiVC animated:YES];
    }else if (indexPath.row == 3)
    {
        kkkey = @"3";
        
        
        ZuoViewHTController *ZuoVC = [[ZuoViewHTController alloc]init];
        ZuoVC.kkkey = kkkey;
        
        [self.navigationController pushViewController:ZuoVC animated:YES];
        
        
    }else if (indexPath.row == 4)
    {
        kkkey = @"4";
        
        
        ZuoViewHTController *ZuoVC = [[ZuoViewHTController alloc]init];
        ZuoVC.kkkey = kkkey;
        
        [self.navigationController pushViewController:ZuoVC animated:YES];
        
        
    }else if (indexPath.row == 7)
    {
        kkkey = @"7";
        
        
        ChaViewHTController *ChaVC = [[ChaViewHTController alloc]init];
        //ZuoVC.kkkey = kkkey;
        
        [self.navigationController pushViewController:ChaVC animated:YES];
        
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
