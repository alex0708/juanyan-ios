//
//  HuiZViewController.h
//  MobileSell
//
//  Created by zhuqing on 14/12/14.
//  Copyright (c) 2014年 Sandro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FPPopoverController.h"

#import "iflyMSC/IFlySpeechRecognizerDelegate.h"

//forward declare
@class PopupView;
@class IFlyDataUploader;
@class IFlySpeechRecognizer;

@interface HuiZViewHTController : UIViewController<FPPopoverControllerDelegate,UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIView *view4;
@property (weak, nonatomic) IBOutlet UIView *view3;
@property (weak, nonatomic) IBOutlet UIView *view2;
@property (weak, nonatomic) IBOutlet UIView *view1;
@property (strong, nonatomic) IBOutlet UIButton *BigBtn;

@property (nonatomic,strong)NSString *txt1;


- (IBAction)HsAc:(UIButton *)sender;

@property (nonatomic,strong)NSString *viewkey;

@property (weak, nonatomic) IBOutlet UIButton *view1Btn1;
@property (weak, nonatomic) IBOutlet UIButton *view1Btn2;
- (IBAction)view1Btn1Ac:(UIButton *)sender;

- (IBAction)view1Btn2Ac:(UIButton *)sender;
- (IBAction)view1starnianAc:(UIButton *)sender;
- (IBAction)view1staryueAc:(UIButton *)sender;
- (IBAction)view1starriAc:(UIButton *)sender;
- (IBAction)view1endnianAc:(UIButton *)sender;
- (IBAction)view1endyueAc:(UIButton *)sender;
- (IBAction)view1endriAc:(UIButton *)sender;

- (IBAction)view2btn1:(UIButton *)sender;
- (IBAction)view2btn2:(UIButton *)sender;
- (IBAction)view2starnian:(UIButton *)sender;
- (IBAction)view2staryue:(UIButton *)sender;
- (IBAction)view2starri:(UIButton *)sender;
- (IBAction)view2endnian:(UIButton *)sender;
- (IBAction)view2endyue:(UIButton *)sender;
- (IBAction)view2endri:(UIButton *)sender;


- (IBAction)bbbAC:(UIButton *)sender;

//识别对象
@property (nonatomic, strong) IFlySpeechRecognizer * iFlySpeechRecognizer;

//数据上传对象
@property (nonatomic, strong) IFlyDataUploader     * uploader;

@property (nonatomic, weak)   UITextView           * resultView;
@property (nonatomic, strong) PopupView            * popUpView;
@property (nonatomic, weak)   UIButton             * startBtn;
@property (nonatomic, weak)   UIButton             * stopBtn;
@property (nonatomic, weak)   UIButton             * cancelBtn;
@property (nonatomic, weak)   UIButton             * uploadWordBtn;
@property (nonatomic, weak)   UIButton             * uploadContactBtn;

@property (nonatomic, strong) NSString             * result;
@property (nonatomic)         BOOL                 isCanceled;


- (void) onBtnStart:(id) sender;




@end
