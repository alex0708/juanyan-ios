//
//  XieYiViewController.h
//  MobileSell
//
//  Created by zhuqing on 14/12/13.
//  Copyright (c) 2014年 Sandro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XieYiViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    NSArray *xiang;
    
    
}
@property (weak, nonatomic) IBOutlet UITableView *tv1;

@property (nonatomic,strong)NSString *kkkey;


@property (nonatomic,strong)NSMutableArray *imagesName;

@end
