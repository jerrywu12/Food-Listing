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

- (void)getFoodList
{
    NSString *fullURLString = [serverFoodListURLString stringByAppendingString:@"test-data.json"];
    
    [self GET:fullURLString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSLog(@"%@", responseObject);
        
        [FoodJSONParser getFoodItemList:responseObject];
        
    } failure:nil];
}


- (AFHTTPRequestOperation *)operationGetFoodList
{
    NSString *fullURLString = [serverFoodListURLString stringByAppendingString:@"test-data.json"];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:fullURLString]];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"Food JSON: %@", (NSString *)responseObject);
        if ([self.delegate respondsToSelector:@selector(foodListingHTTPClient:didUpdateWithFoodList:)]) {
            [self.delegate foodListingHTTPClient:self didUpdateWithFoodList:responseObject];
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if ([self.delegate respondsToSelector:@selector(foodListingHTTPClient:didFailWithError:)]) {
            [self.delegate foodListingHTTPClient:self didFailWithError:error];
        }
    }];
    
    return operation;
}

@end
