//
//  ViewController.m
//  Lock Pro
//
//  Created by Nav on 3/17/16.
//  Copyright © 2016 nav. All rights reserved.
//

#import "Login.h"
#import "TabBar.h"

@interface Login ()
@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *passWord;
@property (weak, nonatomic) IBOutlet UIButton *logIn;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIButton *forgotPassword;
@end

@implementation Login

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.navigationController.navigationBar setHidden:YES];

    [self.userName setBackgroundColor:[[UIColor blackColor] colorWithAlphaComponent:0.5f]];
    [self.userName setTextColor:[UIColor whiteColor]];
    [self.passWord setBackgroundColor:[[UIColor blackColor] colorWithAlphaComponent:0.5f]];
    [self.passWord setTextColor:[UIColor whiteColor]];
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
    
    self.userName.delegate = self;
    self.passWord.delegate = self;
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if ([textField isEqual:self.userName]) {
        [self.passWord becomeFirstResponder];
    }else{
        [self LoginTapped:nil];
    }
    
    return YES;
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
    self.navigationController.navigationBar.barStyle = UIStatusBarStyleLightContent;
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
    [userInfo[UIKeyboardFrameBeginUserInfoKey] getValue: &startFrame];
    [userInfo[UIKeyboardFrameEndUserInfoKey] getValue: &endFrame];
    CGFloat difference = endFrame.origin.y - startFrame.origin.y;
    CGPoint contentOffset = self.scrollView.contentOffset;
    if (difference > 0) {
        contentOffset.y = 0;
    } else if (self.userName.isFirstResponder || self.passWord.isFirstResponder) {
        contentOffset.y -= difference / 3;
    }
    self.scrollView.contentOffset = contentOffset;
}
- (IBAction)LoginTapped:(UIButton *)sender {
    NSLog(@"Login Tapped");
    [self.view endEditing:YES];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.navigationController pushViewController:[[TabBar alloc]init] animated:YES];
    });
}

-(void) viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.scrollView.contentSize = self.scrollView.frame.size;
    //self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height+40);
}

-(void) didRotateFromInterfaceOrientation: (UIInterfaceOrientation)fromInterfaceOrientation {
    self.scrollView.contentSize = self.scrollView.frame.size;
    //self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height+40);
}

@end
