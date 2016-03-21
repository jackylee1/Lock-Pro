//
//  HistoryTab.h
//  Lock Pro
//
//  Created by Nav on 3/21/16.
//  Copyright © 2016 nav. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface HistoryTab : UITableViewController<NSFetchedResultsControllerDelegate>
@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@end
