//
//  BaseTableViewController.m
//  SwissPlanner
//
//  Created by Anastasiya Yarovenko on 24.01.17.
//  Copyright © 2017 Elena Boychuk. All rights reserved.
//

#import "BaseTableViewController.h"
#import "SWRevealViewController.h"
#import "PlatformTypeChecker.h"

@interface BaseTableViewController ()

@end

@implementation BaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if ([self.isMenuItem boolValue]) {
        UIBarButtonItem *menuButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menu"]
                                                                       style:UIBarButtonItemStylePlain
                                                                      target:self
                                                                      action:nil];
        
        [self.navigationController.navigationBar
         setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
        
        if ((self.viewControllerIsInSecondaryLine == nil)||([self.viewControllerIsInSecondaryLine boolValue] == NO)) {
            // adding navigation capabilities
            self.navigationItem.leftBarButtonItem = menuButton;
            SWRevealViewController *revealViewController = self.revealViewController;
            if ( revealViewController )
            {
                [self.navigationItem.leftBarButtonItem setTarget: self.revealViewController];
                [self.navigationItem.leftBarButtonItem setAction: @selector( revealToggle: )];
                [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
            }
        }
    }
    
    [self updateViewBackground];
}

- (void) updateViewBackground {
    NSString *platform = [PlatformTypeChecker platformType];
    NSString *navBarImageName, *backImageName;
    if ([platform isEqualToString:@"iPhone 6"]||[platform isEqualToString:@"iPhone 6S"]) {
        navBarImageName = @"nav_bar_iphone6";
        backImageName = @"background(gifts)_iphone6";
    }
    else if ([platform containsString:@"iPad"]||[platform isEqualToString:@"Simulator"]){
        navBarImageName = @"nav_bar";
        backImageName = @"background(gifts)";
    }
    else {
        navBarImageName = @"nav_bar";
        backImageName = @"background(gifts)";
    }
    UIImage *stretchableBackground = [[UIImage imageNamed:navBarImageName] resizableImageWithCapInsets:UIEdgeInsetsMake(0,0,self.navigationController.view.frame.size.height,self.navigationController.view.frame.size.width) resizingMode:UIImageResizingModeStretch];
    [self.navigationController.navigationBar setBackgroundImage:stretchableBackground forBarMetrics:UIBarMetricsDefault];
    self.view.layer.contents = (id)[UIImage imageNamed:backImageName].CGImage;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
