//
//  Modal.h
//  Lock Pro
//
//  Created by Nav on 3/20/16.
//  Copyright © 2016 nav. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ModalDelegate <NSObject>

-(void) doneTapped:(NSString *) name;

@end

@interface Modal : UIViewController<UITextFieldDelegate>
@property (weak, nonatomic) id<ModalDelegate> delegate;
@end
