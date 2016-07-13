//
//  GiftsViewController.m
//  SwissPlanner
//
//  Created by User on 4/13/16.
//  Copyright © 2016 Elena Baoychuk. All rights reserved.
//

#import "GiftsViewController.h"
#import "SWRevealViewController.h"
#import "PlatformTypeChecker.h"

@interface GiftsViewController ()

@end

@implementation GiftsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
     [self updateViewBackground];
	
	// setting navigation bar
	UIBarButtonItem *menuButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menu"]
																   style:UIBarButtonItemStylePlain
																  target:self
																  action:nil];
	self.navigationItem.leftBarButtonItem = menuButton;
	[self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:(186/255.0)
																			 green:(134/255.0)
																			  blue:(111/255.0)
																			 alpha:1]];
	
	// setting slide menu view controller
	SWRevealViewController *revealViewController = self.revealViewController;
	if ( revealViewController )
	{
		[self.navigationItem.leftBarButtonItem setTarget: self.revealViewController];
		[self.navigationItem.leftBarButtonItem setAction: @selector( revealToggle: )];
		[self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
	}
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void) viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    [coordinator animateAlongsideTransition:^(id  _Nonnull context) {
        [self updateViewBackground];
    } completion:^(id  _Nonnull context) {}];
}

- (void) updateViewBackground {
    NSString *platform = [PlatformTypeChecker platformType];
    NSString *navBarImageName, *backImageName;
    if ([platform isEqualToString:@"iPhone 6"]||[platform isEqualToString:@"iPhone 6S"]) {
        navBarImageName = @"nav_bar_iphone6";
        backImageName = @"background(gifts)_iphone6";
    }
    else if ([platform containsString:@"iPad"]||[platform isEqualToString:@"Simulator"]){
        navBarImageName = @"nav_bar";
        backImageName = @"background(gifts)";
    }
    else {
        navBarImageName = @"nav_bar";
        backImageName = @"background(gifts)";
    }
    UIImage *stretchableBackground = [[UIImage imageNamed:navBarImageName] resizableImageWithCapInsets:UIEdgeInsetsMake(0,0,self.navigationController.view.frame.size.height,self.navigationController.view.frame.size.width) resizingMode:UIImageResizingModeStretch];
    [self.navigationController.navigationBar setBackgroundImage:stretchableBackground forBarMetrics:UIBarMetricsDefault];
    self.view.layer.contents = (id)[UIImage imageNamed:backImageName].CGImage;
}

@end
