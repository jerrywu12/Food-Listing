//
//  FoodTableViewCell.h
//  Food Listing
//
//  Created by Jerry Wu on 8/14/14.
//  Copyright (c) 2014 Jerry. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "HJManagedImageV.h"

#import "FoodItem.h"
#import "AppDelegate.h"

@interface FoodTableViewCell : UITableViewCell

@property (strong, nonatomic) FoodItem *detailItem;

@property (weak, nonatomic) IBOutlet HJManagedImageV *foodImageView;
@property (weak, nonatomic) IBOutlet UILabel *timeAddedLabel;

- (void)setDetailItem:(FoodItem *)newDetailItem;

@end
