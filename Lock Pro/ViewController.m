//
//  ViewController.m
//  Lock Pro
//
//  Created by Nav on 3/17/16.
//  Copyright © 2016 nav. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *passWord;
@property (weak, nonatomic) IBOutlet UIControl *logIn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.userName setBackgroundColor:[[UIColor blackColor] colorWithAlphaComponent:0.5f]];
    [self.userName setTextColor:[UIColor whiteColor]];
    [self.passWord setBackgroundColor:[[UIColor blackColor] colorWithAlphaComponent:0.5f]];
    
    UIColor *color = [UIColor whiteColor];
    self.userName.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:@"Username"
     attributes:@{NSForegroundColorAttributeName:color}];
    self.passWord.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:@"Password"
     attributes:@{NSForegroundColorAttributeName:color}];
    
    [self.logIn setBackgroundColor:[UIColor colorWithRed:0.086 green:0.494 blue:0.984 alpha:1.00]];
    self.logIn.layer.cornerRadius = 5;
    self.logIn.alpha = 0.9;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIStatusBarStyle) preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

@end
