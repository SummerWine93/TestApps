//
//  Slide7ContentViewController.m
//  SwissPlanner
//
//  Created by User on 4/28/16.
//  Copyright © 2016 Elena Baoychuk. All rights reserved.
//

#import "Slide7ContentViewController.h"

@interface Slide7ContentViewController ()

@end

@implementation Slide7ContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	self.yourCellsRows = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:10], nil];
	self.partnerCellsRows = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:11], nil];
}

- (void) setSpecificViews {
	self.headerBlockLabel.text = @"Income in the leadership program";
    self.headerContentBlock2Label.text = @"Main table of orders";
    self.headerContentBlock3Label.text = @"VIP table of orders";
	
	self.contentBlock1Label.text = @"Income = Bonus units х Price differences between levels";
	
	self.contentBlock2Label.text = @"If You are on the 2nd level, and Your partner is on the 1st level of the Leadership program Your income is:\n3.78 х (€20 - €15) = €18.90";
	self.contentBlock3Label.text = @"If You are on the 2nd level, and Your partner is on the 1st level of the Leadership program Your income is:\n14.85 х (€20 - €15) = €74.25";
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
