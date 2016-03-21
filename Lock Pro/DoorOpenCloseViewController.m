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
    
    self.closeDoor.layer.borderColor = [[UIColor colorWithRed:0.086 green:0.494 blue:0.984 alpha:1.00] CGColor];
    self.closeDoor.layer.borderWidth = 1.5;
    self.closeDoor.layer.cornerRadius = self.closeDoor.bounds.size.width / 2.0;
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
