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
}



@end
