//
//  FoodJSONParser.m
//  Food Listing
//
//  Created by Jerry Wu on 8/13/14.
//  Copyright (c) 2014 Jerry. All rights reserved.
//

#import "FoodJSONParser.h"

@implementation FoodJSONParser

+ (void)getFoodItemList:(id)data
{
    NSDictionary *foodList = data[@"food"];
    
    for (NSDictionary *foodItemDetails in foodList)
    {
        [self getFoodItemDetail:foodItemDetails];
    }
}

+ (void)getFoodItemDetail:(id)foodItemDetails
{
    NSString *name = (NSString *)foodItemDetails[@"name"];
    NSLog(@"name: %@", name);
    
    NSNumber *deliciosity = foodItemDetails[@"deliciosity"];
    NSLog(@"deliciosity: %@", deliciosity);

    NSString *image = (NSString *)foodItemDetails[@"image"];
    NSLog(@"image: %@", image);

    NSString *manufacturer = (NSString *)foodItemDetails[@"manufacturer"];
    NSLog(@"manufacturer: %@", manufacturer);

    NSDate *timeAdded = foodItemDetails[@"added"];
    NSLog(@"timeAdded: %@", timeAdded);
}


@end
