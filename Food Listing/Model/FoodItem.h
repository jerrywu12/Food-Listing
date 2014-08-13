//
//  FoodItem.h
//  Food Listing
//
//  Created by Jerry Wu on 8/13/14.
//  Copyright (c) 2014 Jerry. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface FoodItem : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * deliciosity;
@property (nonatomic, retain) NSString * manufacturer;
@property (nonatomic, retain) NSString * imageURL;
@property (nonatomic, retain) NSDate * timeAdded;

@end
