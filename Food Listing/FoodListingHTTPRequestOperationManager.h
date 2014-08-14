//
//  FoodListingHTTPClient.h
//  Food Listing
//
//  Created by Jerry Wu on 8/13/14.
//  Copyright (c) 2014 Jerry. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AFHTTPRequestOperationManager.h"
#import "FoodJSONParser.h"

static NSString * const serverFoodListURLString = @"http://reserve-media.s3.amazonaws.com/";

@protocol FoodListingHTTPRequestOperationManagerDelegate;

@interface FoodListingHTTPRequestOperationManager : AFHTTPRequestOperationManager

@property (nonatomic, weak) id<FoodListingHTTPRequestOperationManagerDelegate>delegate;

+ (FoodListingHTTPRequestOperationManager *)sharedFoodListHTTPRequestOperationManager;
- (instancetype)initWithBaseURL:(NSURL *)url;

// Operations
- (void)getFoodListJSONData;

@end

@protocol FoodListingHTTPRequestOperationManagerDelegate <NSObject>
@optional
-(void)foodListingHTTPRequestOperationManager:(FoodListingHTTPRequestOperationManager *)manager didUpdateWithFoodList:(id)foodList;
-(void)foodListingHTTPRequestOperationManager:(FoodListingHTTPRequestOperationManager *)manager didFailWithError:(NSError *)error;
@end