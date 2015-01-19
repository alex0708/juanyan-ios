//
//  XieShengChaViewController.h
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

@interface XieShengChaViewHTController : UIViewController<FPPopoverControllerDelegate,UITextFieldDelegate>

- (IBAction)XieAc:(UIButton *)sender;

- (IBAction)XieViewBtn1:(UIButton *)sender;
- (IBAction)XieViewBtn2:(UIButton *)sender;
- (IBAction)bbbbAc:(UIButton *)sender;
@property (strong, nonatomic) IBOutlet UIButton *BigBtn;

@property (nonatomic,strong)NSString *txt1;

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
