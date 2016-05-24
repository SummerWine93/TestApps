//
//  Slide4ContentViewController.m
//  SwissPlanner
//
//  Created by User on 4/28/16.
//  Copyright © 2016 Elena Baoychuk. All rights reserved.
//

#import "Slide4ContentViewController.h"

@interface Slide4ContentViewController ()

@end

@implementation Slide4ContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
    // Do any additional setup after loading the view.
}

- (void) setSpecificViews {
	self.headerBlockLabel.text = @"Income in the Leadership program";
	self.headerContentBlock3Label.text = @"Main table of orders";
	self.headerContentBlock4Label.text = @"VIP table of orders";
	
	self.contentBlock1Label.text = @"Commodity circulation / 500 = Bonus units";
	self.contentBlock2Label.text = @"The bonus units accumulate in the leadership program";
	self.contentBlock3Label.text = @"2100€ - 10% = 1890€ (commodity circulation)\n1890€ / 500 = 3.78 bonus units\nyou will get for one closed Main table";
	self.contentBlock4Label.text = @"8250€ - 10% = 7425€ (commodity circulation)\n7425€ / 500 = 14.85 bonus units\nyou will get for one closed VIP table";
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
