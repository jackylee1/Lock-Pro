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
@property (weak, nonatomic) IBOutlet UIPickerView *pickerField;
@property (strong, nonatomic) NSArray *typesOfUsers;
@property (assign, nonatomic) BOOL showPicker;
@end

@implementation Modal

-(instancetype)initWithPlaceholders:(NSString *) firstPlaceholder andShowPickerView:(BOOL) showPicker{
    self = [super init];
    if (self) {
        self.firstPlaceholder = firstPlaceholder;
        self.showPicker = showPicker;
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
    self.typesOfUsers = @[@"Guest",@"Admin"];
    if (!_showPicker) {
        [self.pickerField setHidden:YES];
    }
    [self.view layoutIfNeeded];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row
      inComponent:(NSInteger)component
{
    NSLog(@"%@", _typesOfUsers[row]);
}
-(void) doneTapped{
    [self.view endEditing:YES];
    Modal __weak *weakSelf = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self dismissViewControllerAnimated:YES completion:^{
            [weakSelf.delegate doneTappedWithFirstFieldAs:weakSelf.firstTextField.text andSecoondFieldAs:_typesOfUsers[[weakSelf.pickerField selectedRowInComponent:0]]];
        }];
    });

}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self doneTapped];
    return YES;
}

- (NSInteger)numberOfComponentsInPickerView:
(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component
{
    return _typesOfUsers.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component
{
    return _typesOfUsers[row];
}

@end
