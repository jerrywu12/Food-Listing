//
//  DetailViewController.m
//  Food Listing
//
//  Created by Jerry Wu on 8/13/14.
//  Copyright (c) 2014 Jerry. All rights reserved.
//

#import "DetailViewController.h"

#import "AppDelegate.h"


@interface DetailViewController ()

@end

@implementation DetailViewController
            
#pragma mark - Managing the detail item

- (void)setDetailItem:(FoodItem *)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
            
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.
    if (self.detailItem)
    {
        NSString *formatedDateString = [DetailViewController formatDate:self.detailItem.timeAdded];
        self.timeAddedLabel.text = formatedDateString;
        self.nameLabel.text = self.detailItem.name;
        self.deliciosityLabel.text = [self.detailItem.deliciosity stringValue];
        self.manufacturerLabel.text = self.detailItem.manufacturer;
        
        // load food image
        NSURL *avatarUrl = [NSURL URLWithString:self.detailItem.imageURL];
        self.foodImageView.url = avatarUrl;
        AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        [appDelegate.objMan manage:self.foodImageView];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - convenient methods

+ (NSString *)formatDate:(NSDate *)date
{
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    [formatter setLocale:[NSLocale currentLocale]];
    [formatter setDateFormat:@"HH:mm a, MMMM dd, yyyy"];
    NSString *formatedDateString = [formatter stringFromDate:date];
    
    return formatedDateString;
}

@end
