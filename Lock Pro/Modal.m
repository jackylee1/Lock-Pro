//
//  Modal.m
//  Lock Pro
//
//  Created by Nav on 3/20/16.
//  Copyright © 2016 nav. All rights reserved.
//

#import "Modal.h"

@interface Modal ()
@property (weak, nonatomic) IBOutlet UITextField *firstTextField;
@property (strong, nonatomic) NSString *firstPlaceholder;
@end

@implementation Modal

-(instancetype)initWithPlaceholders:(NSString *) firstPlaceholder{
    self = [super init];
    if (self) {
        self.firstPlaceholder = firstPlaceholder;
            }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneTapped)];
    self.navigationItem.rightBarButtonItem = doneButton;
    self.view.backgroundColor = [UIColor colorWithRed:0.937 green:0.937 blue:0.957 alpha:1.00];
    self.firstTextField.delegate = self;
    self.firstTextField.placeholder = self.firstPlaceholder;
    [self.firstTextField becomeFirstResponder];
    [self.view layoutIfNeeded];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) doneTapped{
    [self.view endEditing:YES];
    Modal __weak *weakSelf = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self dismissViewControllerAnimated:YES completion:^{
            [weakSelf.delegate doneTapped:weakSelf.firstTextField.text];
        }];
    });

}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self doneTapped];
    return YES;
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
