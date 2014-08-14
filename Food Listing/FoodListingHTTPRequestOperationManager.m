//
//  FoodListingHTTPClient.m
//  Food Listing
//
//  Created by Jerry Wu on 8/13/14.
//  Copyright (c) 2014 Jerry. All rights reserved.
//

#import "FoodListingHTTPRequestOperationManager.h"

@implementation FoodListingHTTPRequestOperationManager

#pragma mark - Initialization

+ (FoodListingHTTPRequestOperationManager *)sharedFoodListHTTPRequestOperationManager
{
    static FoodListingHTTPRequestOperationManager *_sharedHTTPClient = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedHTTPClient = [[self alloc] initWithBaseURL:[NSURL URLWithString:serverFoodListURLString]];
    });
    
    return _sharedHTTPClient;
}

- (instancetype)initWithBaseURL:(NSURL *)url
{
    self = [super initWithBaseURL:url];
    
    if (self) {
        self.responseSerializer = [AFJSONResponseSerializer serializer];
        self.requestSerializer = [AFJSONRequestSerializer serializer];
    }
    
    return self;
}


#pragma mark - Operations

- (void)getFoodListJSONData
{
    NSString *fullURLString = [serverFoodListURLString stringByAppendingString:@"test-data.json"];
    
    [self GET:fullURLString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSLog(@"%@", responseObject);
        if ([self.delegate respondsToSelector:@selector(foodListingHTTPRequestOperationManager:didUpdateWithFoodList:)]) {
            [self.delegate foodListingHTTPRequestOperationManager:self didUpdateWithFoodList:responseObject];
        }
    } failure:nil];
}


@end
