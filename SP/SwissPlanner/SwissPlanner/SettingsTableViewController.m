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
	
	self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background"]];
	
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

	
	
	
	NSString *plistSettingsFilePath = [[NSBundle mainBundle] pathForResource:@"Settings" ofType:@"plist"];
	settings = [NSMutableDictionary dictionaryWithDictionary:[[NSDictionary alloc] initWithContentsOfFile:plistSettingsFilePath]];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.nameLabel setHighlighted:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
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
        NSInteger points = [[f numberFromString:self.levelLabel.text] integerValue];
        [defaults setObject:[NSNumber numberWithInteger:points] forKey:@"userPoints"];
    } else {
        [defaults setObject:[NSNumber numberWithInteger:0] forKey:@"userPoints"];
    }
    
    [defaults synchronize];
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
