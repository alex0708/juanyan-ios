//
//  ChaViewController.h
//  MobileSell
//
//  Created by zhuqing on 14/12/14.
//  Copyright (c) 2014年 Sandro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChaViewHTController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    NSArray *xiang;
}
@property (weak, nonatomic) IBOutlet UITableView *tv1;

@end
