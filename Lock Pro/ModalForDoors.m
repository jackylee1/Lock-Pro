//
//  ModalForDoors.m
//  Lock Pro
//
//  Created by Nav on 3/22/16.
//  Copyright © 2016 nav. All rights reserved.
//

#import "ModalForDoors.h"

@interface ModalForDoors ()

@end

@implementation ModalForDoors

-(void)viewDidLoad {
    [super viewDidLoad];
    [self initializeForm];
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneTapped)];
    //self.firstTextField.returnKeyType = UIReturnKeyDone;
    self.navigationItem.rightBarButtonItem = doneButton;
    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelTapped)];
    self.navigationItem.leftBarButtonItem = cancelButton;
    self.tableView.backgroundColor = [UIColor colorWithRed:0.965 green:0.965 blue:0.976 alpha:1.00];
}

-(void) initializeForm {
    
    XLFormDescriptor * form;
    XLFormSectionDescriptor * section;
    XLFormRowDescriptor * row;
    
    form = [XLFormDescriptor formDescriptorWithTitle:@"Door Form"];
    
    // First section
    section = [XLFormSectionDescriptor formSectionWithTitle:@"Door"];
    section.footerTitle = @"Enter door name and description";
    [form addFormSection:section];
    
    // Name
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"doorName" rowType:XLFormRowDescriptorTypeText];
    [row.cellConfigAtConfigure setObject:@"Enter Name" forKey:@"textField.placeholder"];
    [section addFormRow:row];
    
    // Email
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"description" rowType:XLFormRowDescriptorTypeText];
    [row.cellConfigAtConfigure setObject:@"Enter Description" forKey:@"textField.placeholder"];
    [section addFormRow:row];
    
    self.form = form;
    
}

-(void) cancelTapped {
    [self.view endEditing:YES];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self dismissViewControllerAnimated:YES completion:^{
        }];
    });
}

-(void) doneTapped{
    [self.view endEditing:YES];
    ModalForDoors __weak *weakSelf = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self dismissViewControllerAnimated:YES completion:^{
            [weakSelf.delegate doneTapped:[weakSelf.form formValues]];
        }];
    });
    
}

@end
