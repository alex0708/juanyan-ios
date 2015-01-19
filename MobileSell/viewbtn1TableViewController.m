//
//  viewbtn1TableViewController.m
//  MobileSell
//
//  Created by zhuqing on 14/12/15.
//  Copyright (c) 2014年 Sandro. All rights reserved.
//

#import "viewbtn1TableViewController.h"

@interface viewbtn1TableViewController ()

@end

@implementation viewbtn1TableViewController
@synthesize txt1;

long static nu;
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"选择时间";
    
    NSDate *now = [NSDate date];
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    [fmt setDateFormat:@"yyyy"];
    NSString *date1 = [fmt stringFromDate:now];
    long  year= [date1 intValue];
    
    
    nu = (year - 2011)*2;
    
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
    return nu;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier] ;
    }
    
    
    long year2 = 2015 - indexPath.row/2;
    
    
    // NSArray *timeAry = @[@"2012上半年",@"2012下半年",@"2013上半年",@"2013下半年",@"2014上半年",@"2014下半年",@"2015上半年",@"2015下半年",@"2016上半年",@"2016下半年"];
    
    
    if ((nu-indexPath.row)%2 == 0) {
        cell.textLabel.text = [NSString  stringWithFormat:@"%ld下半年",year2];
    } else {
        cell.textLabel.text = [NSString  stringWithFormat:@"%ld上半年",year2];
    }
    return cell;
}


#pragma mark - Table view delegate

//- (void)setTxt:(NSString *)txt
//{
//    if (txt) {
//
//    }
//}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cel = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section]];
    //    btn12time = cel12.textLabel.text;
    //    NSLog(@"%@",btn12time);
    txt1 = cel.textLabel.text;
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"viewbtn1" object:self userInfo:[NSDictionary dictionaryWithObject:txt1 forKey:@"txt1"]];
    //    [self setTxt:textt];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
