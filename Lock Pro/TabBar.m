//
//  TabBar.m
//  Lock Pro
//
//  Created by Nav on 3/19/16.
//  Copyright © 2016 nav. All rights reserved.
//

#import "TabBar.h"
#import "LocksTab.h"

@implementation TabBar

-(instancetype)init{
    self = [super init];
    if (self) {
        UIViewController *vc1 = [[LocksTab alloc]init];//[[UIViewController alloc]init];
        vc1.view.backgroundColor = [UIColor colorWithRed:0.945 green:0.945 blue:0.945 alpha:1.00];
        vc1.title = @"Doors";
        //vc1.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemMostViewed tag:0];
        vc1.tabBarItem.image = [UIImage imageNamed:@"door"];
        
        UIViewController *vc2 = [[UIViewController alloc]init];
        vc2.view.backgroundColor = [UIColor lightGrayColor];
        vc2.title = @"Users";
        //vc2.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemContacts tag:0];
        vc2.tabBarItem.image = [UIImage imageNamed:@"users"];

        UIViewController *vc3 = [[UIViewController alloc]init];
        vc3.view.backgroundColor = [UIColor lightGrayColor];
        vc3.title = @"History";
        //vc3.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemHistory tag:0];
        vc3.tabBarItem.image = [UIImage imageNamed:@"history"];
        
        UIViewController *vc4 = [[UIViewController alloc]init];
        vc4.view.backgroundColor = [UIColor lightGrayColor];
        vc4.title = @"Settings";
        vc4.tabBarItem.image = [UIImage imageNamed:@"settings"];

        NSArray *Controllers = [[NSArray alloc] initWithObjects:vc1,vc2,vc3,vc4, nil];
        [self setViewControllers:Controllers];
    }
    
    return self;
}

-(void)viewDidLoad{
    [super viewDidLoad];
    [self.navigationItem setHidesBackButton:YES];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"Logout" style:UIBarButtonItemStylePlain target:self action:@selector(logOut)];
}

-(void) logOut{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
