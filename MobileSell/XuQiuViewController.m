//
//  XuQiuViewController.m
//  MobileSell
//
//  Created by zhuqing on 14/12/13.
//  Copyright (c) 2014年 Sandro. All rights reserved.
//

#import "XuQiuViewController.h"

@interface XuQiuViewController ()

@end

@implementation XuQiuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //self.title = @"需求";
    UIFont* font = [UIFont fontWithName:@"Arial-ItalicMT" size:21.0];
    NSDictionary* textAttributes = @{NSFontAttributeName:font,
                                     NSForegroundColorAttributeName:[UIColor whiteColor]};
    
    
    [self.navigationController.navigationBar setTitleTextAttributes:textAttributes];
    
    //self.view.backgroundColor = [UIColor blueColor];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navbar_bg_normal"] forBarMetrics:UIBarMetricsDefault];
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
