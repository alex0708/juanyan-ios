//
//  MainTabBarViewController.m
//  MobileSell
//
//  Created by zhuqing on 14/12/13.
//  Copyright (c) 2014年 Sandro. All rights reserved.
//

#import "MainTabBarViewController.h"
#import "XieYiViewController.h"
#import "HeTongViewController.h"
#import "XuQiuViewController.h"
#import "GengDuoViewController.h"

#import "iflyMSC/iflySetting.h"
#import "Definition.h"
#import "iflyMSC/IFlySpeechUtility.h"
#import "IFlyFlowerCollector.h"


#define KScreenHeight [UIScreen mainScreen].bounds.size.height
#define KScreenWidth [UIScreen mainScreen].bounds.size.width

@interface MainTabBarViewController (){
    UIView *_tabbarView;
}



@end

@implementation MainTabBarViewController



- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    NSString *initString = [[NSString alloc] initWithFormat:@"appid=%@",@"54b4eec3"]; [IFlySpeechUtility createUtility:initString];
    
    [self initViewControllers];
    
    [self initTabbar];
    
    UISwipeGestureRecognizer *swipe1 = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeAction:)];
    swipe1.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipe1];
    
    UISwipeGestureRecognizer *swipe2 = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeAction:)];
    //设置轻扫方向
    swipe2.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipe2];
    
}

- (void)swipeAction:(UISwipeGestureRecognizer *)swipe
{
    if (swipe.direction == UISwipeGestureRecognizerDirectionRight  &&  self.selectedIndex >0) {
        self.selectedIndex = self.selectedIndex -1;
        NSLog(@"向右轻扫");
        
        UIImageView *arrowImg = (UIImageView *)[_tabbarView viewWithTag:123];
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:.35];
        
        NSLog(@"%f",arrowImg.center.x);
        
        CGPoint temp = arrowImg.center;
        temp.x = temp.x - KScreenWidth/4;
        arrowImg.center = temp;
        
        [UIView commitAnimations];
        
        
    }else if(swipe.direction == UISwipeGestureRecognizerDirectionLeft  &&  self.selectedIndex < 3) {
        self.selectedIndex = self.selectedIndex +1;
        NSLog(@"向左轻扫");
        
        UIImageView *arrowImg = (UIImageView *)[_tabbarView viewWithTag:123];
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:.35];
        
        NSLog(@"%f",arrowImg.center.x);
        
        CGPoint temp = arrowImg.center;
        temp.x = temp.x + KScreenWidth/4;
        arrowImg.center = temp;
        
        [UIView commitAnimations];
    }
}

- (void)initTabbar
{
    //1.隐藏标签工具栏
    
   // _suppurtGestureTransition = YES;
    
    self.tabBar.hidden = YES;
    
    //2.创建自定义标签工具栏视图
    _tabbarView = [[UIView alloc] initWithFrame:CGRectMake(0, KScreenHeight - 44, KScreenWidth, 44)];
    _tabbarView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"navbar_bg_normal"]];
    [self.view addSubview:_tabbarView];
    
    //3.创建按钮
    NSArray *imgNames = @[@"btnbg_blue1.png",@"btnbg_blue2.png",@"btnbg_blue3.png",@"btnbg_blue4.png"];
    for (int i = 0; i < imgNames.count; i ++) {
        NSString *imgName = imgNames[i];
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.tag = i;

        button.showsTouchWhenHighlighted = YES;
        [button setImage:[UIImage imageNamed:imgName] forState:UIControlStateNormal];
        button.frame = CGRectMake(KScreenWidth/4*i, 0, KScreenWidth/4, 44);
        [button addTarget:self action:@selector(seletedClick:) forControlEvents:UIControlEventTouchUpInside];
        [_tabbarView addSubview:button];
    }
    UIImageView *arrowImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"home_bottom_tab_arrow"]];
    arrowImg.tag = 123;
    arrowImg.frame = CGRectMake(KScreenWidth/40, 0, 64, 45);
    [_tabbarView addSubview:arrowImg];
}




- (void)seletedClick:(UIButton *)btn
{
    
    
    //self.tabBar =
    self.selectedIndex = btn.tag;
    
    UIImageView *arrowImg = (UIImageView *)[_tabbarView viewWithTag:123];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:.35];
    arrowImg.center = btn.center;
    [UIView commitAnimations];
    
}

- (void)initViewControllers
{
    
    XieYiViewController *xie = [[XieYiViewController alloc] init];
    xie.title = @"协议";
    HeTongViewController *he = [[HeTongViewController alloc] init];
    he.title = @"合同";
    XuQiuViewController *xu = [[XuQiuViewController alloc] init];
    xu.title = @"需求";
    GengDuoViewController *geng = [[GengDuoViewController alloc] init];
    geng.title = @"更多";
    
    

    UINavigationController *xieNav = [[UINavigationController alloc] initWithRootViewController:xie];
    UINavigationController *heNav = [[UINavigationController alloc] initWithRootViewController:he];
    UINavigationController *xuNav = [[UINavigationController alloc] initWithRootViewController:xu];
    UINavigationController *gengNav = [[UINavigationController alloc] initWithRootViewController:geng];

    
    NSArray *array = @[xieNav,heNav,xuNav,gengNav];
    self.viewControllers = array;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
