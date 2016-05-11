//
//  GiftsPageContentViewController.m
//  SwissPlanner
//
//  Created by User on 4/21/16.
//  Copyright © 2016 Elena Baoychuk. All rights reserved.
//

#import "GiftsPageContentViewController.h"

@interface GiftsPageContentViewController ()

@end

@implementation GiftsPageContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	[self.imageView setImage:[UIImage imageNamed:self.imageFile]];
	[self.textLabel setText:self.titleText];
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
