//
//  FoodJSONParser.h
//  Food Listing
//
//  Created by Jerry Wu on 8/13/14.
//  Copyright (c) 2014 Jerry. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "FoodItem.h"

@interface FoodJSONParser : NSObject

+ (NSArray *)getFoodItemList:(id)data withMOC:(NSManagedObjectContext *)moc;

@end
