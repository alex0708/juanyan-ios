//
//  DaiViewController.h
//  MobileSell
//
//  Created by zhuqing on 14/12/13.
//  Copyright (c) 2014年 Sandro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DaiViewHTController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    NSArray *xiang2;
}
@property (weak, nonatomic) IBOutlet UITableView *tv1;

@property (nonatomic,strong)NSString *kkkey;

@end
