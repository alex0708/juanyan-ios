//
//  Dai2ViewController.h
//  MobileSell
//
//  Created by zhuqing on 14/12/14.
//  Copyright (c) 2014年 Sandro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Dai2ViewHTController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *TbV;

@property (nonatomic,strong)NSString *kkkey;

@end
