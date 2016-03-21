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
