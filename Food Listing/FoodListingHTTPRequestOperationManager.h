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
- (AFHTTPRequestOperation *)operationGetFoodList;
- (void)getFoodList;

@end

@protocol FoodListingHTTPRequestOperationManagerDelegate <NSObject>
@optional
-(void)foodListingHTTPClient:(FoodListingHTTPRequestOperationManager *)client didUpdateWithFoodList:(id)foodList;
-(void)foodListingHTTPClient:(FoodListingHTTPRequestOperationManager *)client didFailWithError:(NSError *)error;
@end