//
//  Slide6ContentViewController.m
//  SwissPlanner
//
//  Created by User on 4/28/16.
//  Copyright © 2016 Elena Baoychuk. All rights reserved.
//

#import "Slide6ContentViewController.h"

@interface Slide6ContentViewController ()

@end

@implementation Slide6ContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.yourCellsRows = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:9], nil];
	self.partnerCellsRows = [NSMutableArray arrayWithCapacity:0];
}

- (void) setSpecificViews {

    self.headerBlockLabel.text = @"Income in the leadership program";
    self.headerContentBlock2Label.text = @"Main table of orders";
    self.headerContentBlock3Label.text = @"VIP table of orders";
	
	self.contentBlock1Label.text = @"Income = Price for 1 bonus unit х Bonus units";
	
	self.contentBlock2Label.text = @"If You are in the Leadership program and Your partner has not yet - than on the 3rd level You will earn €25 for 1 bonus unit\n€25 х 3.78 = €94.50 etc.";
	self.contentBlock3Label.text = @"If You are in the Leadership program and Your partner has not yet - than on the 3rd level You will earn €25 for 1 bonus unit\n€25 х 14.85 = €371.25 etc.";
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
