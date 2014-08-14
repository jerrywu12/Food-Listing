//
//  FoodJSONParser.m
//  Food Listing
//
//  Created by Jerry Wu on 8/13/14.
//  Copyright (c) 2014 Jerry. All rights reserved.
//

#import "FoodJSONParser.h"

@implementation FoodJSONParser

+ (NSArray *)getFoodItemList:(id)data withMOC:(NSManagedObjectContext *)moc
{
    NSMutableArray *foodItemList = [[NSMutableArray alloc] init];
    
    NSDictionary *foodList = data[@"food"];
    
    for (NSDictionary *foodItemDetails in foodList)
    {
        [foodItemList addObject:[self getFoodItemDetail:foodItemDetails withMOC:moc]];
    }
    
    [moc save:nil];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:NSManagedObjectContextDidSaveNotification object:nil];
    
    return [foodItemList copy];
}

+ (FoodItem *)getFoodItemDetail:(id)foodItemDetails withMOC:(NSManagedObjectContext *)moc
{
    FoodItem *foodItem = [NSEntityDescription insertNewObjectForEntityForName:@"FoodItem"
                                                       inManagedObjectContext:moc];
    
    NSString *name = (NSString *)foodItemDetails[@"name"];
    NSLog(@"name: %@", name);
    foodItem.name = name;
    
    NSNumber *deliciosity = foodItemDetails[@"deliciosity"];
    NSLog(@"deliciosity: %@", deliciosity);
    foodItem.deliciosity = deliciosity;

    NSString *imageURLString = (NSString *)foodItemDetails[@"image"];
    NSLog(@"image: %@", imageURLString);
    foodItem.imageURL = imageURLString;

    NSString *manufacturer = (NSString *)foodItemDetails[@"manufacturer"];
    NSLog(@"manufacturer: %@", manufacturer);
    foodItem.manufacturer = manufacturer;

    NSDate *date = [self convertJSONDateToNSDate:(NSString *)foodItemDetails[@"added"]];
    foodItem.timeAdded = date;
    NSLog(@"time: %@", [self formatDate:date]);
    
    return foodItem;
}

+ (NSDate *)convertJSONDateToNSDate:(NSString *)dateString
{
    double unixTimeStamp = [dateString doubleValue];
    NSTimeInterval interval = unixTimeStamp;
    return [NSDate dateWithTimeIntervalSince1970:interval];
}

+ (NSString *)formatDate:(NSDate *)date
{
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    [formatter setLocale:[NSLocale currentLocale]];
    [formatter setDateFormat:@"HH:mm a, MMMM dd, yyyy"];
    NSString *formatedDateString = [formatter stringFromDate:date];
    
    return formatedDateString;
}


@end
