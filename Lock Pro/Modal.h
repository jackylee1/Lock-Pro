//
//  Modal.h
//  Lock Pro
//
//  Created by Nav on 3/20/16.
//  Copyright © 2016 nav. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ModalDelegate <NSObject>

-(void) doneTappedWithFirstFieldAs:(NSString *) name andSecoondFieldAs:(NSString *) type;

@end

@interface Modal : UIViewController<UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource>
@property (weak, nonatomic) id<ModalDelegate> delegate;
-(instancetype)initWithPlaceholders:(NSString *) firstPlaceholder andShowPickerView:(BOOL) showPicker;

@end
