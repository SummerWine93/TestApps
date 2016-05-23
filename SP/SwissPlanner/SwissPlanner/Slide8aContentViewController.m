//
//  Slide71ContentViewController.m
//  SwissPlanner
//
//  Created by Anastasiya Yarovenko on 23.05.16.
//  Copyright © 2016 Elena Baoychuk. All rights reserved.
//

#import "Slide8aContentViewController.h"

@interface Slide8aContentViewController ()

@end

@implementation Slide8aContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.yourCellsRows = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:2], [NSNumber numberWithInt:11], nil];
    self.partnerCellsRows = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:6], nil];
}

- (void) setSpecificViews {
    self.headerBlockLabel.text = @"Income in the Leadership program";
    self.headerContentBlock2Label.text = @"Main table of orders";
    self.headerContentBlock3Label.text = @"VIP table of orders";
    
    self.contentBlock1Label.text = @"Income = Bonus units х Price differences between your level and 1 level of Leadership program\nFrom direct partner. No matter what level of your direct partner";
    
    self.contentBlock2Label.text = @"You are on 9 level, your direct partner on 5 level of Leadership program. Your income is:\n3.78 х (47€ - 15€) = 120.96€";
    self.contentBlock3Label.text = @"You are on 9 level, your direct partner on 5 level of Leadership program. Your income is:\n14.85 х (47€ - 15€) = 475.2€";
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
