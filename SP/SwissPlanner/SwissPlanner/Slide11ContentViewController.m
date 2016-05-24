//
//  Slide11ContentViewController.m
//  SwissPlanner
//
//  Created by User on 4/28/16.
//  Copyright © 2016 Elena Baoychuk. All rights reserved.
//

#import "Slide11ContentViewController.h"

@interface Slide11ContentViewController ()

@end

@implementation Slide11ContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void) setSpecificViews {
	self.headerBlockLabel.text = @"How much money the company distributes in the VIP PLUS agreement of the Leadership program";
	self.contentBlock1Label.text = @"52.92 x (50 - 49) = €52.92 \n52.92 x (49 - 47) = €105.84 \n52.92 x (47 - 45) = €105.84 \n52.92 x (45 - 43) = €105.84 \n52.92 x (43 - 40) = €158.76 \n52.92 x (40 - 35) = €264.6 \n52.92 x (35 - 30) = €264.6 \n52.92 x (30 - 25) = €264.6 \n52.92 x (25 - 20) = €264.6 \n52.92 x (20 - 15) = €264.6 \n52.92 x 15 = €793.8";
	self.contentBlock2Label.text = @"29400 x 10% = €2940 \n10% - company commission for one VIP PLUS table";
	self.contentBlock3Label.text = @"€2646 - the company distributes in the Leadership program";
	self.contentBlock4Label.text = @"29400 x 9% = €2646 \n9% - goes to the Leadership program \n1% - remains as an income of the company";
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
