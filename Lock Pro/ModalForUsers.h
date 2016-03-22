//
//  ModalForUsers.h
//  Lock Pro
//
//  Created by Nav on 3/22/16.
//  Copyright © 2016 nav. All rights reserved.
//

#import <XLForm/XLForm.h>

@protocol ModalForUsersDelegate <NSObject>

-(void) doneTapped:(NSDictionary *) dictionary;

@end

@interface ModalForUsers : XLFormViewController
-(instancetype)initWithArray:(NSArray *) array;
@property (weak, nonatomic) id<ModalForUsersDelegate> delegate;
@property (strong, nonatomic) NSArray *array;
@end
