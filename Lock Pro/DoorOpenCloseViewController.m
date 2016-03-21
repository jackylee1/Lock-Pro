//
//  DoorOpenCloseViewController.m
//  Lock Pro
//
//  Created by Nav on 3/21/16.
//  Copyright © 2016 nav. All rights reserved.
//

#import "DoorOpenCloseViewController.h"

@interface DoorOpenCloseViewController ()
@property (weak, nonatomic) IBOutlet UIButton *openDoor;
@property (weak, nonatomic) IBOutlet UIButton *closeDoor;
@property (strong, nonatomic) UIActivityIndicatorView *activiytIndicator;
@end

@implementation DoorOpenCloseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.openDoor.layer.cornerRadius = self.openDoor.bounds.size.width / 2.0;
    [self.openDoor setBackgroundColor:[UIColor colorWithRed:0.086 green:0.494 blue:0.984 alpha:1.00]];
    [self.openDoor setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.openDoor.alpha = 0.9;
    self.openDoor.layer.shadowRadius = 3.0f;
    self.openDoor.layer.shadowColor = [UIColor blackColor].CGColor;
    self.openDoor.layer.shadowOffset = CGSizeMake(0.0f, 1.0f);
    self.openDoor.layer.shadowOpacity = 0.5f;
    
    [self.closeDoor setBackgroundColor:[UIColor whiteColor]];
    self.closeDoor.layer.borderColor = [[UIColor clearColor] CGColor];//[[UIColor colorWithRed:0.086 green:0.494 blue:0.984 alpha:1.00] CGColor];
    self.closeDoor.layer.borderWidth = 0.9;
    self.closeDoor.layer.cornerRadius = self.closeDoor.bounds.size.width / 2.0;
    self.closeDoor.alpha = 0.9;
    self.closeDoor.layer.shadowRadius = 3.0f;
    self.closeDoor.layer.shadowColor = [UIColor blackColor].CGColor;
    self.closeDoor.layer.shadowOffset = CGSizeMake(0.0f, 1.0f);
    self.closeDoor.layer.shadowOpacity = 0.5f;
}

-(UIActivityIndicatorView *)activiytIndicator {
    if (_activiytIndicator) {
        return _activiytIndicator;
    }else{
        self.activiytIndicator = [[UIActivityIndicatorView alloc]initWithFrame:self.view.bounds];
        [self.view addSubview:self.activiytIndicator];
        return _activiytIndicator;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) showProgress {
    self.activiytIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
    self.activiytIndicator.backgroundColor = [UIColor colorWithRed:0.937 green:0.937 blue:0.957 alpha:1.00];
    self.activiytIndicator.color = [UIColor darkGrayColor];
    [self.activiytIndicator startAnimating];
    DoorOpenCloseViewController __weak *weakSelf = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            if (weakSelf.activiytIndicator) {
                [weakSelf.activiytIndicator stopAnimating];
                [weakSelf.activiytIndicator removeFromSuperview];
                weakSelf.activiytIndicator = nil;
            }
        });
    });
}

- (IBAction)openTapped:(id)sender {
    [self showProgress];
}

- (IBAction)closeTapped:(id)sender {
    [self showProgress];
}

-(void)dealloc{
    if (_activiytIndicator) {
        [_activiytIndicator stopAnimating];
        [_activiytIndicator removeFromSuperview];
        _activiytIndicator = nil;
    }
}

@end
