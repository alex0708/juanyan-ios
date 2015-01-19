//
//  HuiZViewController.m
//  MobileSell
//
//  Created by zhuqing on 14/12/14.
//  Copyright (c) 2014年 Sandro. All rights reserved.
//

#import "HuiZViewController.h"

#import "Hz1ViewController.h"
#import "Hz2ViewController.h"
#import "Hz3ViewController.h"

#import "View1Btn1TableViewController.h"
#import "View1Btn2TableViewController.h"
#import "view1starnianTableViewController.h"
#import "view1starriTableViewController.h"
#import "view1staryueTableViewController.h"
#import "view1endnianTableViewController.h"
#import "view1endriTableViewController.h"
#import "view1endyueTableViewController.h"

#import "view2btn1TableViewController.h"
#import "view2btn2TableViewController.h"
#import "view2starnianTableViewController.h"
#import "view2starriTableViewController.h"
#import "view2staryueTableViewController.h"
#import "view2endnianTableViewController.h"
#import "view2endriTableViewController.h"
#import "view2endyueTableViewController.h"



#import <QuartzCore/QuartzCore.h>
#import "iflyMSC/IFlyContact.h"
#import "iflyMSC/IFlyDataUploader.h"
#import "Definition.h"
#import "iflyMSC/IFlyUserWords.h"
#import "RecognizerFactory.h"
#import "UIPlaceHolderTextView.h"
#import "iflyMSC/IFlySpeechUtility.h"
#import "iflyMSC/IFlySpeechRecognizer.h"
#import "PopupView.h"
#import "ISRDataHelper.h"
#import "iflyMSC/IFlySpeechConstant.h"
#import "iflyMSC/IFlyResourceUtil.h"


#define KScreenHeight [UIScreen mainScreen].bounds.size.height
#define KScreenWidth [UIScreen mainScreen].bounds.size.width

@interface HuiZViewController ()

@end

@implementation HuiZViewController


- (instancetype) init
{
    self = [super init];
    if (!self) {
        return nil;
    }
    
    //创建识别
    _iFlySpeechRecognizer = [RecognizerFactory CreateRecognizer:self Domain:@"iat"];
    
    self.uploader = [[IFlyDataUploader alloc] init];
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _txt1 = @"";
    
    
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 70000
    if ( IOS7_OR_LATER )
    {
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.extendedLayoutIncludesOpaqueBars = NO;
        self.modalPresentationCapturesStatusBarAppearance = NO;
        self.navigationController.navigationBar.translucent = NO;
    }
#endif
    
    CGRect frame = [[UIScreen mainScreen] applicationFrame];
    UIView *mainView = [[UIView alloc] initWithFrame:frame];
    mainView.backgroundColor = [UIColor whiteColor];
    //self.view = mainView;
    int top = Margin*2;
    
    UIPlaceHolderTextView *resultView = [[UIPlaceHolderTextView alloc] initWithFrame:
                                         CGRectMake(Margin*2, top, self.view.frame.size.width-Margin*4, 160)];
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
    
    
    //----
    UIView *bView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, 44)];
    bView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"navbar_bg_normal"]];
    
    
    //[_tv1 addSubview:bView];
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn1.frame = CGRectMake(15, 6, 59, 32);
    [btn1 setTitle:@"协议" forState:UIControlStateNormal];
    [btn1 setBackgroundImage:[UIImage imageNamed:@"btnbg_blue"] forState:UIControlStateNormal];
    //[backButton setBackgroundImage:[UIImage imageNamed:@"back_on"   ] forState:UIControlStateHighlighted];
    [btn1 addTarget:self action:@selector(btn1Ac:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn2.frame = CGRectMake((KScreenWidth-30)/4+15, 6, 59, 32);
    [btn2 setTitle:@"交易" forState:UIControlStateNormal];
    [btn2 setBackgroundImage:[UIImage imageNamed:@"btnbg_blue"] forState:UIControlStateNormal];
    //[backButton setBackgroundImage:[UIImage imageNamed:@"back_on"   ] forState:UIControlStateHighlighted];
    [btn2 addTarget:self action:@selector(btn2Ac:) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn3.frame = CGRectMake((KScreenWidth-30)/2+15, 6, 59, 32);
    [btn3 setTitle:@"调出" forState:UIControlStateNormal];
    [btn3 setBackgroundImage:[UIImage imageNamed:@"btnbg_blue"] forState:UIControlStateNormal];
    //[backButton setBackgroundImage:[UIImage imageNamed:@"back_on"   ] forState:UIControlStateHighlighted];
    [btn3 addTarget:self action:@selector(btn3Ac:) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *btn4 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn4.frame = CGRectMake((KScreenWidth-30)/4*3+15, 6, 59, 32);
    [btn4 setTitle:@"调入" forState:UIControlStateNormal];
    [btn4 setBackgroundImage:[UIImage imageNamed:@"btnbg_blue"] forState:UIControlStateNormal];
    //[backButton setBackgroundImage:[UIImage imageNamed:@"back_on"   ] forState:UIControlStateHighlighted];
    [btn4 addTarget:self action:@selector(btn4Ac:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [bView addSubview:btn1];
    [bView addSubview:btn2];
    [bView addSubview:btn3];
    [bView addSubview:btn4];
    
    
    [self.view addSubview:bView];
    
    //[self.view insertSubview:bView aboveSubview:_tv1];
    
    [self.view bringSubviewToFront:bView];
    
    _viewkey = @"1";
    
    [_view1 setUserInteractionEnabled:YES];
    [_view2 setUserInteractionEnabled:YES];
    [_view3 setUserInteractionEnabled:YES];
    [_view4 setUserInteractionEnabled:YES];
    
    
    [_view1 setHidden:NO];
    [_view2 setHidden:YES];
    
    //---tongzhi
    //--
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationAction1:) name:@"view1btn1" object:nil];
    //--
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationAction2:) name:@"view1btn2" object:nil];
    //--
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationAction3:) name:@"view1starnian" object:nil];
    //--
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationAction4:) name:@"view1staryue" object:nil];
    //--
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationAction5:) name:@"view1starri" object:nil];
    //--
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationAction6:) name:@"view1endnian" object:nil];
    //--
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationAction7:) name:@"view1endyue" object:nil];
    //--
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationAction8:) name:@"view1endri" object:nil];
    
    //---tongzhi
    //--
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationAction21:) name:@"view2btn1" object:nil];
    //--
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationAction22:) name:@"view2btn2" object:nil];
    //--
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationAction23:) name:@"view2starnian" object:nil];
    //--
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationAction24:) name:@"view2staryue" object:nil];
    //--
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationAction25:) name:@"view2starri" object:nil];
    //--
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationAction26:) name:@"view2endnian" object:nil];
    //--
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationAction27:) name:@"view2endyue" object:nil];
    //--
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationAction28:) name:@"view2endri" object:nil];
}

- (void)notificationAction1:(NSNotification *)notification {
    
    NSString *te = [[notification userInfo] objectForKey:@"txt1"];
    
    NSLog(@"%@",te);
    UIButton *btn1 = (UIButton *)[self.view viewWithTag:98];
    
    [btn1 setTitle:te forState:UIControlStateNormal];
    
    
    
    
}

- (void)notificationAction2:(NSNotification *)notification {
    
    NSString *te = [[notification userInfo] objectForKey:@"txt1"];
    
    NSLog(@"%@",te);
    UIButton *btn1 = (UIButton *)[self.view viewWithTag:99];
    
    [btn1 setTitle:te forState:UIControlStateNormal];
    
    
    
    
}

- (void)notificationAction3:(NSNotification *)notification {
    
    NSString *te = [[notification userInfo] objectForKey:@"txt1"];
    
    NSLog(@"%@",te);
    UIButton *btn1 = (UIButton *)[self.view viewWithTag:71];
    
    [btn1 setTitle:te forState:UIControlStateNormal];
    
    
    
    
}

- (void)notificationAction4:(NSNotification *)notification {
    
    NSString *te = [[notification userInfo] objectForKey:@"txt1"];
    
    NSLog(@"%@",te);
    UIButton *btn1 = (UIButton *)[self.view viewWithTag:72];
    
    [btn1 setTitle:te forState:UIControlStateNormal];
    
    
    
    
}

- (void)notificationAction5:(NSNotification *)notification {
    
    NSString *te = [[notification userInfo] objectForKey:@"txt1"];
    
    NSLog(@"%@",te);
    UIButton *btn1 = (UIButton *)[self.view viewWithTag:73];
    
    [btn1 setTitle:te forState:UIControlStateNormal];
    
    
    
    
}

- (void)notificationAction6:(NSNotification *)notification {
    
    NSString *te = [[notification userInfo] objectForKey:@"txt1"];
    
    NSLog(@"%@",te);
    UIButton *btn1 = (UIButton *)[self.view viewWithTag:81];
    
    [btn1 setTitle:te forState:UIControlStateNormal];
    
    
    
    
}

- (void)notificationAction7:(NSNotification *)notification {
    
    NSString *te = [[notification userInfo] objectForKey:@"txt1"];
    
    NSLog(@"%@",te);
    UIButton *btn1 = (UIButton *)[self.view viewWithTag:82];
    
    [btn1 setTitle:te forState:UIControlStateNormal];
    
    
    
    
}

- (void)notificationAction8:(NSNotification *)notification {
    
    NSString *te = [[notification userInfo] objectForKey:@"txt1"];
    
    NSLog(@"%@",te);
    UIButton *btn1 = (UIButton *)[self.view viewWithTag:83];
    
    [btn1 setTitle:te forState:UIControlStateNormal];
    
    
    
    
}


- (void)notificationAction21:(NSNotification *)notification {
    
    NSString *te = [[notification userInfo] objectForKey:@"txt1"];
    
    NSLog(@"%@",te);
    UIButton *btn1 = (UIButton *)[self.view viewWithTag:298];
    
    [btn1 setTitle:te forState:UIControlStateNormal];
    
    
    
    
}

- (void)notificationAction22:(NSNotification *)notification {
    
    NSString *te = [[notification userInfo] objectForKey:@"txt1"];
    
    NSLog(@"%@",te);
    UIButton *btn1 = (UIButton *)[self.view viewWithTag:299];
    
    [btn1 setTitle:te forState:UIControlStateNormal];
    
    
    
    
}

- (void)notificationAction23:(NSNotification *)notification {
    
    NSString *te = [[notification userInfo] objectForKey:@"txt1"];
    
    NSLog(@"%@",te);
    UIButton *btn1 = (UIButton *)[self.view viewWithTag:271];
    
    [btn1 setTitle:te forState:UIControlStateNormal];
    
    
    
    
}

- (void)notificationAction24:(NSNotification *)notification {
    
    NSString *te = [[notification userInfo] objectForKey:@"txt1"];
    
    NSLog(@"%@",te);
    UIButton *btn1 = (UIButton *)[self.view viewWithTag:272];
    
    [btn1 setTitle:te forState:UIControlStateNormal];
    
    
    
    
}

- (void)notificationAction25:(NSNotification *)notification {
    
    NSString *te = [[notification userInfo] objectForKey:@"txt1"];
    
    NSLog(@"%@",te);
    UIButton *btn1 = (UIButton *)[self.view viewWithTag:273];
    
    [btn1 setTitle:te forState:UIControlStateNormal];
    
    
    
    
}

- (void)notificationAction26:(NSNotification *)notification {
    
    NSString *te = [[notification userInfo] objectForKey:@"txt1"];
    
    NSLog(@"%@",te);
    UIButton *btn1 = (UIButton *)[self.view viewWithTag:281];
    
    [btn1 setTitle:te forState:UIControlStateNormal];
    
    
    
    
}

- (void)notificationAction27:(NSNotification *)notification {
    
    NSString *te = [[notification userInfo] objectForKey:@"txt1"];
    
    NSLog(@"%@",te);
    UIButton *btn1 = (UIButton *)[self.view viewWithTag:282];
    
    [btn1 setTitle:te forState:UIControlStateNormal];
    
    
    
    
}

- (void)notificationAction28:(NSNotification *)notification {
    
    NSString *te = [[notification userInfo] objectForKey:@"txt1"];
    
    NSLog(@"%@",te);
    UIButton *btn1 = (UIButton *)[self.view viewWithTag:283];
    
    [btn1 setTitle:te forState:UIControlStateNormal];
    
    
    
    
}


-(void)popover1:(id)sender
{
    //the controller we want to present as a popover
    
    View1Btn1TableViewController *controller = [[View1Btn1TableViewController alloc] initWithStyle:UITableViewStylePlain];
    
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

-(void)popover2:(id)sender
{
    //the controller we want to present as a popover
    
    View1Btn2TableViewController *controller = [[View1Btn2TableViewController alloc] initWithStyle:UITableViewStylePlain];
    
    FPPopoverController *popover = [[FPPopoverController alloc] initWithViewController:controller];
    
    
    //popover.arrowDirection = FPPopoverArrowDirectionAny;
    popover.tint = FPPopoverDefaultTint;
    
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        popover.contentSize = CGSizeMake(300, 300);
    }
    popover.arrowDirection = FPPopoverArrowDirectionAny;
    
    //sender is the UIButton view
    [popover presentPopoverFromView:sender];
}

-(void)popover3:(id)sender
{
    //the controller we want to present as a popover
    
    view1starnianTableViewController *controller = [[view1starnianTableViewController alloc] initWithStyle:UITableViewStylePlain];
    
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

-(void)popover4:(id)sender
{
    //the controller we want to present as a popover
    
    view1staryueTableViewController *controller = [[view1staryueTableViewController alloc] initWithStyle:UITableViewStylePlain];
    
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

-(void)popover5:(id)sender
{
    //the controller we want to present as a popover
    
    view1starriTableViewController *controller = [[view1starriTableViewController alloc] initWithStyle:UITableViewStylePlain];
    
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

-(void)popover6:(id)sender
{
    //the controller we want to present as a popover
    
    view1endnianTableViewController *controller = [[view1endnianTableViewController alloc] initWithStyle:UITableViewStylePlain];
    
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

-(void)popover7:(id)sender
{
    //the controller we want to present as a popover
    
    view1endyueTableViewController *controller = [[view1endyueTableViewController alloc] initWithStyle:UITableViewStylePlain];
    
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

-(void)popover8:(id)sender
{
    //the controller we want to present as a popover
    
    view1endriTableViewController *controller = [[view1endriTableViewController alloc] initWithStyle:UITableViewStylePlain];
    
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


-(void)popover21:(id)sender
{
    //the controller we want to present as a popover
    
    view2btn1TableViewController *controller = [[view2btn1TableViewController alloc] initWithStyle:UITableViewStylePlain];
    
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

-(void)popover22:(id)sender
{
    //the controller we want to present as a popover
    
    view2btn2TableViewController *controller = [[view2btn2TableViewController alloc] initWithStyle:UITableViewStylePlain];
    
    FPPopoverController *popover = [[FPPopoverController alloc] initWithViewController:controller];
    
    
    //popover.arrowDirection = FPPopoverArrowDirectionAny;
    popover.tint = FPPopoverDefaultTint;
    
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        popover.contentSize = CGSizeMake(200, 300);
    }
    popover.arrowDirection = FPPopoverArrowDirectionAny;
    
    //sender is the UIButton view
    [popover presentPopoverFromView:sender];
}

-(void)popover23:(id)sender
{
    //the controller we want to present as a popover
    
    view2starnianTableViewController *controller = [[view2starnianTableViewController alloc] initWithStyle:UITableViewStylePlain];
    
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

-(void)popover24:(id)sender
{
    //the controller we want to present as a popover
    
    view2staryueTableViewController *controller = [[view2staryueTableViewController alloc] initWithStyle:UITableViewStylePlain];
    
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

-(void)popover25:(id)sender
{
    //the controller we want to present as a popover
    
    view2starriTableViewController *controller = [[view2starriTableViewController alloc] initWithStyle:UITableViewStylePlain];
    
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

-(void)popover26:(id)sender
{
    //the controller we want to present as a popover
    
    view2endnianTableViewController *controller = [[view2endnianTableViewController alloc] initWithStyle:UITableViewStylePlain];
    
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

-(void)popover27:(id)sender
{
    //the controller we want to present as a popover
    
    view2endyueTableViewController *controller = [[view2endyueTableViewController alloc] initWithStyle:UITableViewStylePlain];
    
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

-(void)popover28:(id)sender
{
    //the controller we want to present as a popover
    
    view2endriTableViewController *controller = [[view2endriTableViewController alloc] initWithStyle:UITableViewStylePlain];
    
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


- (void)btn1Ac:(UIButton *)button
{
    [_view1 setHidden:NO];
    [_view2 setHidden:YES];
    
    _viewkey = @"1";

}

- (void)btn2Ac:(UIButton *)button
{
    [_view1 setHidden:YES];
    [_view2 setHidden:NO];
    
    _viewkey = @"2";
    
}

- (void)btn3Ac:(UIButton *)button
{
    [_view1 setHidden:YES];
    [_view2 setHidden:NO];
    
    _viewkey = @"3";
    
}

- (void)btn4Ac:(UIButton *)button
{
    [_view1 setHidden:YES];
    [_view2 setHidden:NO];
    
    _viewkey = @"4";
    
    
    NSLog(@"%@",_viewkey);
    
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

- (IBAction)HsAc:(UIButton *)sender {
    NSLog(@"rr");
    
    if ([_viewkey isEqualToString:@"1"]) {
        Hz1ViewController *hz1VC = [[Hz1ViewController alloc]init];
        [self.navigationController pushViewController:hz1VC animated:YES];
        
    } else if([_viewkey isEqualToString:@"2"]){
        Hz2ViewController *hz2VC = [[Hz2ViewController alloc]init];
        [self.navigationController pushViewController:hz2VC animated:YES];
        
    } else{
        Hz3ViewController *hz3VC = [[Hz3ViewController alloc]init];
        [self.navigationController pushViewController:hz3VC animated:YES];
        
    }
}
- (IBAction)view1Btn1Ac:(UIButton *)sender {
    [self popover1:sender];
}

- (IBAction)view1Btn2Ac:(UIButton *)sender {
    [self popover2:sender];
}

- (IBAction)view1starnianAc:(UIButton *)sender {
    [self popover3:sender];
}

- (IBAction)view1staryueAc:(UIButton *)sender {
    [self popover4:sender];
}

- (IBAction)view1starriAc:(UIButton *)sender {
    [self popover5:sender];
}

- (IBAction)view1endnianAc:(UIButton *)sender {
    [self popover6:sender];
}

- (IBAction)view1endyueAc:(UIButton *)sender {
    [self popover7:sender];
}

- (IBAction)view1endriAc:(UIButton *)sender {
    [self popover8:sender];
}

- (IBAction)view2btn1:(UIButton *)sender {
    [self popover21:sender];
}

- (IBAction)view2btn2:(UIButton *)sender {
    [self popover22:sender];
}

- (IBAction)view2starnian:(UIButton *)sender {
    [self popover23:sender];
}

- (IBAction)view2staryue:(UIButton *)sender {
    [self popover24:sender];
}

- (IBAction)view2starri:(UIButton *)sender {
    [self popover25:sender];
}

- (IBAction)view2endnian:(UIButton *)sender {
    [self popover26:sender];
}

- (IBAction)view2endyue:(UIButton *)sender {
    [self popover27:sender];
}

- (IBAction)view2endri:(UIButton *)sender {
    [self popover28:sender];
}

- (IBAction)bbbAC:(UIButton *)sender {
    UITextField *tf4 = (UITextField *)[self.view viewWithTag:31];
    [tf4 resignFirstResponder];
}



- (void)textFieldDidBeginEditing:(UITextField *)textField{
    
    
    NSLog(@"被点到了！");
    
    
    
    
    self.isCanceled = NO;
    
    
    UITextField *tf1 =  (UITextField *)[self.view viewWithTag:31];
    UITextField *tf2 =  (UITextField *)[self.view viewWithTag:32];
    
    //设置为录音模式
    [_iFlySpeechRecognizer setParameter:IFLY_AUDIO_SOURCE_MIC forKey:@"audio_source"];
    
    bool ret = [_iFlySpeechRecognizer startListening];
    
    if (ret) {
        
        
    }
    else
    {
        [_popUpView setText: @"启动识别服务失败，请稍后重试"];//可能是上次请求未结束，暂不支持多路并发
        [self.view addSubview:_popUpView];
    }
    
    
    
    
    
    if (textField.tag == 31) {
        _txt1 = @"";
        if (ret) {
            [tf1 setEnabled:YES];
            [tf2 setEnabled:NO];
            [_BigBtn setEnabled:NO];
            
        } else {
            [tf1 setEnabled:YES];
            [tf2 setEnabled:YES];
            [_BigBtn setEnabled:YES];
        }
        
    } else if(textField.tag == 32) {
        _txt1 = @"";
        
        if (ret) {
            [tf1 setEnabled:NO];
            [tf2 setEnabled:YES];
            [_BigBtn setEnabled:NO];
            
        } else {
            [tf1 setEnabled:YES];
            [tf2 setEnabled:YES];
            [_BigBtn setEnabled:YES];
        }
    }
}


- (void) onVolumeChanged: (int)volume
{
    //    NSLog(@"onVolumeChanged=%d",volume);
    if (self.isCanceled) {
        
        [_popUpView removeFromSuperview];
        
        return;
    }
    
    NSString * vol = [NSString stringWithFormat:@"音量：%d",volume];
    
    [_popUpView setText: vol];
    
    [self.view addSubview:_popUpView];
}


- (void) onBeginOfSpeech
{
    NSLog(@"onBeginOfSpeech");
    
    [_popUpView setText: @"正在录音"];
    
    [self.view addSubview:_popUpView];
    
    _stopBtn.enabled = YES;
    _cancelBtn.enabled  = YES;
}

- (void) onEndOfSpeech
{
    NSLog(@"onEndOfSpeech");
    
    [_popUpView setText: @"停止录音"];
    [self.view addSubview:_popUpView];
}

- (void) onResults:(NSArray *) results isLast:(BOOL)isLast
{
    
    
    
    //_txt1 = @"";
    
    UITextField *tf1 =  (UITextField *)[self.view viewWithTag:31];
    UITextField *tf2 =  (UITextField *)[self.view viewWithTag:32];
    
    if([tf1 isFirstResponder]){
        
        NSMutableString *resultString = [[NSMutableString alloc] init];
        
        NSDictionary *dic = results[0];
        
        for (NSString *key in dic) {
            [resultString appendFormat:@"%@",key];
        }
        
        NSLog(@"听写结果：%@",resultString);
        UILabel *lb1 = (UILabel *)[self.view viewWithTag:41];
        
        
        
        lb1.text = @"";
        
        
        
        NSString * resultFromJson =  [[ISRDataHelper shareInstance] getResultFromJson:resultString];
        
        _txt1 = [NSString stringWithFormat:@"%@%@", _txt1,resultFromJson];
        
        tf1.text = _txt1;
    }else if ([tf2 isFirstResponder]){
        
        NSMutableString *resultString = [[NSMutableString alloc] init];
        
        NSDictionary *dic = results[0];
        
        for (NSString *key in dic) {
            [resultString appendFormat:@"%@",key];
        }
        
        NSLog(@"听写结果：%@",resultString);
        UILabel *lb1 = (UILabel *)[self.view viewWithTag:41];
        
        
        
        lb1.text = @"";
        
        
        NSString * resultFromJson =  [[ISRDataHelper shareInstance] getResultFromJson:resultString];
        
        
        
        _txt1 = [NSString stringWithFormat:@"%@%@", _txt1,resultFromJson];
        
        tf2.text = _txt1;
    }
    
    
    if (isLast)
    {
        // NSLog(@"听写结果(json)：%@测试",  self.result);
    }
    
    NSLog(@"isLast=%d",isLast);
}






/**
 * @fn      onResults
 * @brief   识别结果回调
 *
 * @param   result      -[out] 识别结果，NSArray的第一个元素为NSDictionary，NSDictionary的key为识别结果，value为置信度
 * @see
 */



- (void) onError:(IFlySpeechError *) error
{
    NSString *text ;
    
    if (self.isCanceled) {
        text = @"识别取消";
    }
    else if (error.errorCode ==0 ) {
        
        if (_result.length==0) {
            
            text = @"无识别结果";
        }
        else
        {
            text = @"识别成功";
        }
    }
    else
    {
        text = [NSString stringWithFormat:@"发生错误：%d %@",error.errorCode,error.errorDesc];
        
        NSLog(@"%@",text);
    }
    
    [_popUpView setText: text];
    
    [self.view addSubview:_popUpView];
    
    UITextField *tf1 =  (UITextField *)[self.view viewWithTag:31];
    UITextField *tf2 =  (UITextField *)[self.view viewWithTag:32];
    
    [tf1 setEnabled:YES];
    [tf2 setEnabled:YES];
    [_BigBtn setEnabled:YES];
    
    [_stopBtn setEnabled:NO];
    [_cancelBtn setEnabled:NO];
    [_startBtn setEnabled:YES];
    [_uploadContactBtn setEnabled:YES];
    [_uploadWordBtn setEnabled:YES];
}

-(void)viewWillDisappear:(BOOL)animated
{
    //取消识别
    [_iFlySpeechRecognizer cancel];
    [_iFlySpeechRecognizer setDelegate: nil];
    
    [super viewWillDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
@end
