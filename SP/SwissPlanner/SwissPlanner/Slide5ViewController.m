//
//  Slide5ViewController.m
//  SwissPlanner
//
//  Created by User on 4/28/16.
//  Copyright © 2016 Elena Baoychuk. All rights reserved.
//

#import "Slide5ViewController.h"

@interface Slide5ViewController ()

@end

@implementation Slide5ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	self.yourCellsRows = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:10], [NSNumber numberWithInt:11], nil];
	self.partnerCellsRows = [NSMutableArray arrayWithCapacity:0];
}

- (void) setSpecificViews {
	self.headerBlockLabel.text = @"Income in the leadership program";
	self.headerContentBlock2Label.text = @"Main table of orders";
	self.headerContentBlock3Label.text = @"VIP table of orders";
	
	self.contentBlock1Label.text = @"Income = Price for 1 bonus unit х Bonus units";
	
	self.contentBlock2Label.text = @"On the 1st level of the leadership program You earn €15 for 1 bonus unit.\n€15 х 3.78 = €56.70 \nOn the 2nd level of the leadership program You earn €20 for 1 bonus unit.\n€20 х 3.78 = €75.60";
	self.contentBlock3Label.text = @"On the 1st level of the leadership program You earn €15 for 1 bonus unit.\n€15 х 14.85 = €222.75 \nOn the 2nd level of the leadership program You earn €20 for 1 bonus unit.\n€20 х 14.85 = €297.00";
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
