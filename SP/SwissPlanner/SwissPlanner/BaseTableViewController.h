//
//  BaseTableViewController.h
//  SwissPlanner
//
//  Created by Anastasiya Yarovenko on 24.01.17.
//  Copyright © 2017 Elena Boychuk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseTableViewController : UITableViewController

@property (strong, nonatomic) NSNumber *viewControllerIsInSecondaryLine;
@property (strong, nonatomic) NSNumber *isMenuItem;
@property (strong, nonatomic) NSString *backgroundImageName;

@end
