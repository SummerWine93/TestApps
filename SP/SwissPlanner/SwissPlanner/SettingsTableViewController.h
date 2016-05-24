//
//  SettingsTableViewController.h
//  SwissPlanner
//
//  Created by User on 5/24/16.
//  Copyright © 2016 Elena Baoychuk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsTableViewController : UITableViewController <UITextFieldDelegate>

@property (strong, nonatomic) NSMutableDictionary *userSettingsDictionary;

@property (weak, nonatomic) IBOutlet UITextField *nameLabel;
@property (weak, nonatomic) IBOutlet UITextField *levelLabel;
@property (weak, nonatomic) IBOutlet UITextField *pointsLabel;

@end
