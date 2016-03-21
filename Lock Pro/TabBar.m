//
//  TabBar.m
//  Lock Pro
//
//  Created by Nav on 3/19/16.
//  Copyright © 2016 nav. All rights reserved.
//

#import "TabBar.h"
#import "DoorsTab.h"
#import "UsersTab.h"
#import "MoreTab.h"

@implementation TabBar

-(instancetype)init{
    self = [super init];
    if (self) {
        UIColor *backgroundColor = [UIColor colorWithRed:0.937 green:0.937 blue:0.957 alpha:1.00];
        UIViewController *vc1 = [[DoorsTab alloc]initWithStyle:UITableViewStyleGrouped];
        vc1.view.backgroundColor = backgroundColor;
        vc1.title = @"Doors";
        //vc1.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemMostViewed tag:0];
        vc1.tabBarItem.image = [UIImage imageNamed:@"door"];
        UINavigationController *navBar1 = [[UINavigationController alloc]initWithRootViewController:vc1];
        //[navBar1.navigationBar setBackgroundImage:[UIImage imageNamed:@"wood"] forBarMetrics:UIBarMetricsDefault];
        
        UIViewController *vc2 = [[UsersTab alloc]initWithStyle:UITableViewStyleGrouped];
        vc2.view.backgroundColor = backgroundColor;
        vc2.title = @"Users";
        //vc2.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemContacts tag:0];
        vc2.tabBarItem.image = [UIImage imageNamed:@"users"];
        UINavigationController *navBar2 = [[UINavigationController alloc]initWithRootViewController:vc2];

        UIViewController *vc3 = [[UIViewController alloc]init];
        vc3.view.backgroundColor = backgroundColor;
        vc3.title = @"History";
        //vc3.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemHistory tag:0];
        vc3.tabBarItem.image = [UIImage imageNamed:@"history"];
        UINavigationController *navBar3 = [[UINavigationController alloc]initWithRootViewController:vc3];
        
        UIViewController *vc4 = [[MoreTab alloc]init];
        vc4.view.backgroundColor = backgroundColor;
        vc4.title = @"More";
        //vc4.tabBarItem.image = [UIImage imageNamed:@"settings"];
        vc4.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemMore tag:0];
        UINavigationController *navBar4 = [[UINavigationController alloc]initWithRootViewController:vc4];

        NSArray *Controllers = [[NSArray alloc] initWithObjects:navBar1,navBar2,navBar3,navBar4, nil];
        [self setViewControllers:Controllers];
    }
    
    return self;
}

-(void)viewDidLoad{
    [super viewDidLoad];
    [self.navigationItem setHidesBackButton:YES];
//    UIImage* tabBarBackground = [UIImage imageNamed:@"wood"];
//    UIImageView *imageView = [[UIImageView alloc] initWithImage:tabBarBackground];
//    [self.tabBar insertSubview:imageView atIndex:1];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.barStyle = UIStatusBarStyleDefault;
    //self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"Logout" style:UIBarButtonItemStylePlain target:self action:@selector(logOut)];
}

-(void) logOut{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
