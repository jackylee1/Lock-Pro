//
//  LocksTab.h
//  Lock Pro
//
//  Created by Nav on 3/19/16.
//  Copyright © 2016 nav. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "Modal.h"

@interface DoorsTab : UITableViewController<NSFetchedResultsControllerDelegate, ModalDelegate>
@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@end
