//
//  MasterViewController.h
//  net
//
//  Created by Lio Mendonça on 08.11.13.
//  Copyright (c) 2013 Lio Mendonça. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <CoreData/CoreData.h>

@interface MasterViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
