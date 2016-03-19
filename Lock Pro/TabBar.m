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


-(void)viewDidLoad{
    [super viewDidLoad];
    UIViewController *vc1 = [[LocksTab alloc]init];//[[UIViewController alloc]init];
    vc1.view.backgroundColor = [UIColor colorWithRed:0.945 green:0.945 blue:0.945 alpha:1.00];
    vc1.title = @"Locks";
    //vc1.tabBarItem.image = ;    
    UIViewController *vc2 = [[UIViewController alloc]init];
    vc2.view.backgroundColor = [UIColor lightGrayColor];
    vc2.title = @"Activity";
    NSArray *Controllers = [[NSArray alloc] initWithObjects:
                            vc1,
                            vc2, nil];
    [self setViewControllers:Controllers];
    [self.navigationItem setHidesBackButton:YES];
}

@end
