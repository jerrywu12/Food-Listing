//
//  MasterViewController.h
//  Food Listing
//
//  Created by Jerry Wu on 8/13/14.
//  Copyright (c) 2014 Jerry. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

#import "FoodListingHTTPRequestOperationManager.h"
#import "FoodTableViewCell.h"

@interface MasterViewController : UITableViewController <NSFetchedResultsControllerDelegate, FoodListingHTTPRequestOperationManagerDelegate>

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end

