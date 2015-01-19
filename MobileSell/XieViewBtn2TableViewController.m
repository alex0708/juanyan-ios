//
//  XieViewBtn2TableViewController.m
//  MobileSell
//
//  Created by zhuqing on 14/12/15.
//  Copyright (c) 2014年 Sandro. All rights reserved.
//

#import "XieViewBtn2TableViewController.h"

@interface XieViewBtn2TableViewController ()

@end

@implementation XieViewBtn2TableViewController
@synthesize txt1;
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"选择名称";
    
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
    return 24;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier] ;
    }
    
    
    NSArray *timeAry = @[@"上海烟草集团",@"天津烟草集团",@"山东烟草集团",@"山西烟草集团",@"河北烟草集团",@"安徽烟草集团",@"湖北烟草集团",@"湖南烟草集团",@"四川烟草集团",@"宁夏烟草集团",@"大连烟草集团",@"北京烟草集团",@"重庆烟草集团",@"海南烟草集团",@"广西烟草集团",@"广东烟草集团",@"大同烟草集团",@"内蒙古烟草集团",@"上海烟草集团1",@"天津烟草集团1",@"山东烟草集团1",@"山西烟草集团2",@"河北烟草集团1",@"沈阳烟草集团1"];
    cell.textLabel.text = timeAry[indexPath.row];
    //    textt = cell.textLabel.text;
    //    textt = self.tableView cellForRowAtIndexPath:i;
    return cell;
}


#pragma mark - Table view delegate


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cel = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section]];
    
    txt1 = cel.textLabel.text;
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"xieviewbtn2" object:self userInfo:[NSDictionary dictionaryWithObject:txt1 forKey:@"txt1"]];
    //    [self setTxt:textt];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
