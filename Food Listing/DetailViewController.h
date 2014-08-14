//
//  DetailViewController.h
//  Food Listing
//
//  Created by Jerry Wu on 8/13/14.
//  Copyright (c) 2014 Jerry. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "FoodItem.h"
#import "HJManagedImageV.h"

@interface DetailViewController : UIViewController

@property (strong, nonatomic) FoodItem *detailItem;

@property (weak, nonatomic) IBOutlet UILabel *timeAddedLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *deliciosityLabel;
@property (weak, nonatomic) IBOutlet UILabel *manufacturerLabel;
@property (weak, nonatomic) IBOutlet HJManagedImageV *foodImageView;

@end

