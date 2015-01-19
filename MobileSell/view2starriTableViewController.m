//
//  view2starriTableViewController.m
//  MobileSell
//
//  Created by zhuqing on 14/12/15.
//  Copyright (c) 2014年 Sandro. All rights reserved.
//

#import "view2starriTableViewController.h"

@interface view2starriTableViewController ()

@end

@implementation view2starriTableViewController
@synthesize txt1;
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"选择时间";
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 31;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier] ;
    }
    
    
    // NSArray *timeAry = @[@"湖北省烟草公司鄂州市公司",@"湖北省烟草公司恩施州公司",@"湖北省烟草公司黄冈市公司",@"湖北省烟草公司黄石市公司",@"湖北省烟草公司荆门市公司",@"湖北中烟工业有限责任公司"];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",1+indexPath.row];
    //    textt = cell.textLabel.text;
    //    textt = self.tableView cellForRowAtIndexPath:i;
    return cell;
}


#pragma mark - Table view delegate


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cel = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section]];
    
    txt1 = cel.textLabel.text;
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"view2starri" object:self userInfo:[NSDictionary dictionaryWithObject:txt1 forKey:@"txt1"]];
    //    [self setTxt:textt];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
