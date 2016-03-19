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
@property (weak, nonatomic) IBOutlet UIButton *logIn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.userName setBackgroundColor:[[UIColor blackColor] colorWithAlphaComponent:0.5f]];
    [self.userName setTextColor:[UIColor whiteColor]];
    [self.passWord setBackgroundColor:[[UIColor blackColor] colorWithAlphaComponent:0.5f]];
    self.userName.layer.borderColor = [[UIColor whiteColor] CGColor];
    self.userName.layer.borderWidth = 1.5;
    self.userName.layer.cornerRadius = 5;
    self.passWord.layer.borderColor = [[UIColor whiteColor] CGColor];
    self.passWord.layer.borderWidth = 1.5;
    self.passWord.layer.cornerRadius = 5;
    
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
    [self.logIn setTitle:@"Log In" forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIStatusBarStyle) preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self addObservers];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self removeObservers];
}

-(void) addObservers {
    [[NSNotificationCenter defaultCenter] addObserver: self
                                             selector: @selector(keyboardWillShow:)
                                                 name: UIKeyboardWillShowNotification
                                               object: nil];
    [[NSNotificationCenter defaultCenter] addObserver: self
                                             selector: @selector(keyboardWillHide:)
                                                 name: UIKeyboardWillHideNotification
                                               object: nil];
}

-(void) removeObservers {
    [[NSNotificationCenter defaultCenter] removeObserver: self name: UIKeyboardWillShowNotification object: nil];
    [[NSNotificationCenter defaultCenter] removeObserver: self name: UIKeyboardWillHideNotification object: nil];
}

-(void) keyboardWillShow: (NSNotification *)notification {
    [self keyboardNotification: notification];
}

-(void) keyboardWillHide: (NSNotification *)notification {
    [self keyboardNotification: notification];
}

-(void) keyboardNotification: (NSNotification *)notification {
    NSDictionary *userInfo = [notification userInfo];    
    CGRect startFrame;
    CGRect endFrame;
    NSTimeInterval keyboardAnimationDuration;
    UIViewAnimationCurve animationCurve;
    [userInfo[UIKeyboardFrameBeginUserInfoKey] getValue: &startFrame];
    [userInfo[UIKeyboardFrameEndUserInfoKey] getValue: &endFrame];
    [userInfo[UIKeyboardAnimationCurveUserInfoKey] getValue: &animationCurve];
    keyboardAnimationDuration = [userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    CGFloat difference = endFrame.origin.y - startFrame.origin.y;    
    [UIView beginAnimations: nil context: nil];
    [UIView setAnimationDuration: keyboardAnimationDuration];
    [UIView setAnimationCurve: animationCurve];
    CGRect frame = self.view.frame;
    frame.origin.y += difference/2.15;
    [self.view setFrame: frame];
    [UIView commitAnimations];
}
- (IBAction)LoginTapped:(UIButton *)sender {
    NSLog(@"Login Tapped");
}

@end
