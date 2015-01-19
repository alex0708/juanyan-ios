//
//  XieShengChaViewController.m
//  MobileSell
//
//  Created by zhuqing on 14/12/14.
//  Copyright (c) 2014年 Sandro. All rights reserved.
//

#import "XieShengChaViewController.h"
#import "Hz1ViewController.h"
#import "XieViewBtn1TableViewController.h"
#import "XieViewBtn2TableViewController.h"


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
//#import ""


@interface XieShengChaViewController ()

@end

@implementation XieShengChaViewController


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
    // Do any additional setup after loading the view from its nib.
    
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
    
    //-------------backbtn
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(0, 0, 68, 33);
    [backButton setTitle:@"  返回" forState:UIControlStateNormal];
    [backButton setBackgroundImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [backButton setBackgroundImage:[UIImage imageNamed:@"back_on"   ] forState:UIControlStateHighlighted];
    [backButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    
    
    //--
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationAction1:) name:@"xieviewbtn1" object:nil];
    
    //--
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationAction2:) name:@"xieviewbtn2" object:nil];

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
    UIButton *btn1 = (UIButton *)[self.view viewWithTag:97];
    
    [btn1 setTitle:te forState:UIControlStateNormal];
    
    
    
    
}

- (void)presentedNewPopoverController:(FPPopoverController *)newPopoverController
          shouldDismissVisiblePopover:(FPPopoverController*)visiblePopoverController
{
    [visiblePopoverController dismissPopoverAnimated:YES];
}


-(void)popover1:(id)sender
{
    //the controller we want to present as a popover
    
    XieViewBtn1TableViewController *controller = [[XieViewBtn1TableViewController alloc] initWithStyle:UITableViewStylePlain];
    
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
    
    XieViewBtn2TableViewController *controller = [[XieViewBtn2TableViewController alloc] initWithStyle:UITableViewStylePlain];
    
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


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

- (IBAction)XieAc:(UIButton *)sender {
    Hz1ViewController *hz1VC = [[Hz1ViewController alloc]init];
    [self.navigationController pushViewController:hz1VC animated:YES];
}

- (IBAction)XieViewBtn1:(UIButton *)sender {
    [self popover1:sender];
}

- (IBAction)XieViewBtn2:(UIButton *)sender {
    [self popover2:sender];
}

- (IBAction)bbbbAc:(UIButton *)sender {
    
    UITextField *tf3 = (UITextField *)[self.view viewWithTag:31];
    [tf3 resignFirstResponder];
    UITextField *tf4 = (UITextField *)[self.view viewWithTag:32];
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
