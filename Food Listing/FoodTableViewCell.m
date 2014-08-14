//
//  FoodTableViewCell.m
//  Food Listing
//
//  Created by Jerry Wu on 8/14/14.
//  Copyright (c) 2014 Jerry. All rights reserved.
//

#import "FoodTableViewCell.h"

@implementation FoodTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

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
        self.foodNameLabel.text = self.detailItem.name;
        
        // load food image
        NSURL *avatarUrl = [NSURL URLWithString:self.detailItem.imageURL];
        self.foodImageView.url = avatarUrl;
        AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        [appDelegate.objMan manage:self.foodImageView];
    }
}

@end
