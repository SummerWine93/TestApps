//
//  BaseViewController.m
//  SwissPlanner
//
//  Created by Anastasiya Yarovenko on 24.01.17.
//  Copyright © 2017 Elena Boychuk. All rights reserved.
//

#import "BaseViewController.h"
#import "SWRevealViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *menuButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menu"]
                                                                   style:UIBarButtonItemStylePlain
                                                                  target:self
                                                                  action:nil];
    
    [self.navigationController.navigationBar
     setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    self.navigationItem.title = NSLocalizedString(@"calculator.title", nil);
    
    if ((self.viewControllerIsInSecondaryLine == nil)||([self.viewControllerIsInSecondaryLine boolValue] == NO)) {
        // adding navigation capabilities
        self.navigationItem.leftBarButtonItem = menuButton;
        SWRevealViewController *revealViewController = self.revealViewController;
        if ( revealViewController )
        {
            [self.navigationItem.leftBarButtonItem setTarget: self.revealViewController];
            [self.navigationItem.leftBarButtonItem setAction: @selector( revealToggle: )];
            [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
        }
    }
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
