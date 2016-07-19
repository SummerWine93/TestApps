//
//  GiftsPageContentViewController.m
//  SwissPlanner
//
//  Created by User on 4/21/16.
//  Copyright © 2016 Elena Baoychuk. All rights reserved.
//

#import "GiftsPageContentViewController.h"
#import "PlatformTypeChecker.h"

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

- (BOOL)willAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    NSString *platform = [PlatformTypeChecker platformType];
    if ([platform containsString:@"iPad"]||[platform isEqualToString:@"Simulator"]) {
        if ((interfaceOrientation == UIDeviceOrientationPortrait) || (interfaceOrientation == UIDeviceOrientationPortraitUpsideDown))  {
            [self.imageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@ hor", self.imageFile]]];
        } else {
            [self.imageView setImage:[UIImage imageNamed:self.imageFile]];
        }
    }
    return YES;
}

@end
