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

#pragma mark - Insert object/entity to Core Data

+ (FoodItem *)getFoodItemDetail:(id)foodItemDetails withMOC:(NSManagedObjectContext *)moc
{
    FoodItem *foodItem = [self fetchOrInsertWithFoodItem:foodItemDetails context:moc error:nil];
    
    NSString *name = (NSString *)foodItemDetails[@"name"];
//    NSLog(@"name: %@", name);
    foodItem.name = name;
    
    NSNumber *deliciosity = foodItemDetails[@"deliciosity"];
//    NSLog(@"deliciosity: %@", [deliciosity stringValue]);
    foodItem.deliciosity = deliciosity;

    NSString *imageURLString = (NSString *)foodItemDetails[@"image"];
//    NSLog(@"image: %@", imageURLString);
    foodItem.imageURL = imageURLString;

    NSString *manufacturer = (NSString *)foodItemDetails[@"manufacturer"];
//    NSLog(@"manufacturer: %@", manufacturer);
    foodItem.manufacturer = manufacturer;

    NSDate *date = [self convertJSONDateToNSDate:(NSString *)foodItemDetails[@"added"]];
    foodItem.timeAdded = date;
//    NSLog(@"time: %@", [self formatDate:date]);
    
    [moc save:nil];
    
    return foodItem;
}

+ (FoodItem *)fetchOrInsertWithFoodItem:(id)foodItemDetails context:(NSManagedObjectContext *)context error:(NSError **)error
{
    FoodItem *foodItem = [self fetchFoodItem:foodItemDetails context:context error:error];
    
    if (nil == foodItem) {
        foodItem = [NSEntityDescription insertNewObjectForEntityForName:@"FoodItem"
                                                 inManagedObjectContext:context];
    }
    
    return foodItem;
}

+ (FoodItem *)fetchFoodItem:(id)foodItemDetails context:(NSManagedObjectContext *)context error:(NSError **)error
{
    NSString *foodName = (NSString *)foodItemDetails[@"name"];

    FoodItem *foodItem;
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"FoodItem"];
    NSPredicate *predicate = [NSPredicate predicateWithFormat: @"name == %@", foodName];
    [request setPredicate:predicate];
    NSArray *results = [context executeFetchRequest:request error:error];
    foodItem = results.firstObject;
    
    return foodItem;
}


#pragma mark - Convenient Methods

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
