//
//  ModalForDoors.h
//  Lock Pro
//
//  Created by Nav on 3/22/16.
//  Copyright © 2016 nav. All rights reserved.
//

#import <XLForm/XLForm.h>

@protocol ModalForDoorsDelegate <NSObject>

-(void) doneTapped:(NSDictionary *) dictionary;

@end

@interface ModalForDoors : XLFormViewController

@property (weak, nonatomic) id<ModalForDoorsDelegate> delegate;

@end
