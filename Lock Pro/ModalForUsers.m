//
//  ModalForUsers.m
//  Lock Pro
//
//  Created by Nav on 3/22/16.
//  Copyright © 2016 nav. All rights reserved.
//

#import "ModalForUsers.h"

@implementation ModalForUsers

-(void)viewDidLoad {
    [super viewDidLoad];
    [self initializeForm];
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Send" style:UIBarButtonItemStyleDone target:self action:@selector(doneTapped)];
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
    
    form = [XLFormDescriptor formDescriptorWithTitle:@"User Form"];
    
    // First section
    section = [XLFormSectionDescriptor formSectionWithTitle:@"User Information"];
    section.footerTitle = @"Enter name and email id of the person to send the invite";
    [form addFormSection:section];
    
    // Name
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"name" rowType:XLFormRowDescriptorTypeText];
    [row.cellConfigAtConfigure setObject:@"Enter Name" forKey:@"textField.placeholder"];
    [section addFormRow:row];
    
    // Email
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"email" rowType:XLFormRowDescriptorTypeText];
    [row.cellConfigAtConfigure setObject:@"Enter Email" forKey:@"textField.placeholder"];
    [section addFormRow:row];
    
    // Second Section
    section = [XLFormSectionDescriptor formSectionWithTitle:@""];
    section.footerTitle = @"Enter the access level and doors for the user";
    [form addFormSection:section];
    
    // Admin Or Guest
//    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"accessType" rowType:XLFormRowDescriptorTypeBooleanSwitch title:@"Admin"];
//    [section addFormRow:row];
        
    // --------- Inline Selectors
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"accessType" rowType:XLFormRowDescriptorTypeSelectorPickerViewInline title:@"Select Access Type"];
    row.selectorOptions = @[@"Guest", @"Admin"];
    row.value = @"Guest";
    [section addFormRow:row];
    
    // Multi Select
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"adminOrGuest" rowType:XLFormRowDescriptorTypeMultipleSelector title:@"Select Doors"];
    row.selectorOptions = @[@"Garage", @"Front Door", @"Kitchen"];
    row.value = @[];
    [section addFormRow:row];
    
    section = [XLFormSectionDescriptor formSection];
    [form addFormSection:section];
    
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
    ModalForUsers __weak *weakSelf = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self dismissViewControllerAnimated:YES completion:^{
            [weakSelf.delegate doneTapped:[weakSelf.form formValues]];
        }];
    });
    
}

@end
