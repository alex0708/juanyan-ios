//
//  MingChaViewController.m
//  MobileSell
//
//  Created by zhuqing on 14/12/14.
//  Copyright (c) 2014年 Sandro. All rights reserved.
//

#import "MingChaViewHTController.h"
#import "Hz1ViewHTController.h"
#import "viewbtn1TableViewHTController.h"

@interface MingChaViewHTController ()

@end

@implementation MingChaViewHTController

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
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationAction1:) name:@"viewbtn1" object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)notificationAction1:(NSNotification *)notification {
    
    NSString *te = [[notification userInfo] objectForKey:@"txt1"];
    
    NSLog(@"%@",te);
    UIButton *btn1 = (UIButton *)[self.view viewWithTag:98];
    
    [btn1 setTitle:te forState:UIControlStateNormal];
    
    
    
    
}


-(void)popover1:(id)sender
{
    //the controller we want to present as a popover
    
    viewbtn1TableViewHTController *controller = [[viewbtn1TableViewHTController alloc] initWithStyle:UITableViewStylePlain];
    
    FPPopoverController *popover = [[FPPopoverController alloc] initWithViewController:controller];
    
    
    //popover.arrowDirection = FPPopoverArrowDirectionAny;
    popover.tint = FPPopoverDefaultTint;
    
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        popover.contentSize = CGSizeMake(200, 300);
    }
    popover.arrowDirection = FPPopoverArrowDirectionAny;
    
    //sender is the UIButton view
    [popover presentPopoverFromView:sender];
}


- (void)presentedNewPopoverController:(FPPopoverController *)newPopoverController
          shouldDismissVisiblePopover:(FPPopoverController*)visiblePopoverController
{
    [visiblePopoverController dismissPopoverAnimated:YES];
}



- (void)backAction
{
    [self.navigationController popViewControllerAnimated:YES];
    //[self dismissViewControllerAnimated:YES completion:nil];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)ChaAc:(UIButton *)sender {
    Hz1ViewHTController *hz1VC = [[Hz1ViewHTController alloc]init];
    [self.navigationController pushViewController:hz1VC animated:YES];
}

- (IBAction)viewbtn1:(UIButton *)sender {
    [self popover1:sender];
}
@end
