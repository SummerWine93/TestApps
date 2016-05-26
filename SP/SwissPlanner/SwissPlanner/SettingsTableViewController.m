//
//  SettingsTableViewController.m
//  SwissPlanner
//
//  Created by User on 5/24/16.
//  Copyright © 2016 Elena Baoychuk. All rights reserved.
//

#import "SettingsTableViewController.h"
#import "SWRevealViewController.h"


@interface SettingsTableViewController () {
	NSDictionary *settingsCategories;
	NSMutableDictionary *settings;
}

@end

@implementation SettingsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	// setting navigation bar
	UIBarButtonItem *menuButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menu"]
																   style:UIBarButtonItemStylePlain
																  target:self
																  action:nil];
	[self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_bar"] forBarMetrics:UIBarMetricsDefault];
	[self.navigationController.navigationBar
	 setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
	[self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_bar"] forBarMetrics:UIBarMetricsDefault];
	
	// adding navigation capabilities
	self.navigationItem.leftBarButtonItem = menuButton;
	SWRevealViewController *revealViewController = self.revealViewController;
	if ( revealViewController )
	{
		[self.navigationItem.leftBarButtonItem setTarget: self.revealViewController];
		[self.navigationItem.leftBarButtonItem setAction: @selector( revealToggle: )];
		[self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
	}
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.nameLabel setHighlighted:YES];
    
     NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.nameLabel.text = [defaults objectForKey:@"userName"];
    self.levelLabel.text = [[defaults objectForKey:@"userLevel"] stringValue];
    self.pointsLabel.text = [[defaults objectForKey:@"userPoints"] stringValue];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    [self.view endEditing:YES];
    return NO;
}

-(void)dismissKeyboard {
    [self.view endEditing:YES];
}

- (void) viewWillDisappear:(BOOL)animated {
    // Store the user data
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setObject:self.nameLabel.text forKey:@"userName"];
    NSCharacterSet* notDigits = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
    
    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
    f.numberStyle = NSNumberFormatterDecimalStyle;
    
    if ([self.levelLabel.text rangeOfCharacterFromSet:notDigits].location == NSNotFound)
    {
        NSInteger level = [[f numberFromString:self.levelLabel.text] integerValue];
        if((level >= 0)&&(level <=11)) {
            [defaults setObject:[NSNumber numberWithInteger:level] forKey:@"userLevel"];
        } else {
            [defaults setObject:[NSNumber numberWithInteger:0] forKey:@"userLevel"];
        }
    } else {
        [defaults setObject:[NSNumber numberWithInteger:0] forKey:@"userLevel"];
    }
    
    if ([self.pointsLabel.text rangeOfCharacterFromSet:notDigits].location == NSNotFound)
    {
        NSInteger points = [[f numberFromString:self.pointsLabel.text] integerValue];
        [defaults setObject:[NSNumber numberWithInteger:points] forKey:@"userPoints"];
    } else {
        [defaults setObject:[NSNumber numberWithInteger:0] forKey:@"userPoints"];
        self.pointsLabel.text = @"The points value must be a number";
    }
    
    [defaults synchronize];
}

@end
