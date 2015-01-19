//
//  Dai21ViewController.h
//  MobileSell
//
//  Created by zhuqing on 14/12/14.
//  Copyright (c) 2014年 Sandro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Dai21ViewHTController : UIViewController
{
    UIView *zuoView;
    UIView *jieView;
}
@property (strong, nonatomic) IBOutlet UIButton *DaBtn;

- (IBAction)DaS:(UIControl *)sender;

@property (nonatomic,strong)NSString *kkkey;
@end
