//
//  Slide3ContentViewController.m
//  SwissPlanner
//
//  Created by User on 4/27/16.
//  Copyright © 2016 Elena Baoychuk. All rights reserved.
//

#import "Slide3ContentViewController.h"

@interface Slide3ContentViewController ()

@end

@implementation Slide3ContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}

- (void) setSpecificViews {
	self.headerBlockLabel.text = @"Terms of access to the leadership program";
	self.headerContentBlock1Label.text = @"in a Main agreement";
	self.headerContentBlock2Label.text = @"in a VIP agreement";
	self.contentBlock1Label.text = @"1. You need to close your Main table\n\n2. Your 2 attracted customers should also close their Main tables\n\n3. And their 2 attracted customers should do the same";
	self.contentBlock2Label.text = @"1. You need to close your VIP table\n\n2. Your 2 attracted customers should also close their VIP tables";
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
