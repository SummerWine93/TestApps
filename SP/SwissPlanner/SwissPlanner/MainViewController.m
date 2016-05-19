//
//  MainViewController.m
//  SwissPlanner
//
//  Created by User on 4/11/16.
//  Copyright © 2016 Elena Baoychuk. All rights reserved.
//

#import "MainViewController.h"
#import "SWRevealViewController.h"

@interface MainViewController () {
	NSArray *cellsReuseIdentifiers;
}

@end

typedef enum {
	userNameCell,
	leadershipLevelCell,
	amountOfPartnersCell,
	testResultCell,
	deviderCell,
	ordersCell,
	footerCell
}cells;

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background"]];
	
	// setting navigation bar
	UIBarButtonItem *menuButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menu"]
																   style:UIBarButtonItemStylePlain
																  target:self
																  action:nil];
	self.navigationItem.leftBarButtonItem = menuButton;
	/*[self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:(186/255.0)
																			 green:(134/255.0)
																			  blue:(111/255.0)
																			 alpha:1]];*/
	[self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_bar"] forBarMetrics:UIBarMetricsDefault];
	[self.navigationController.navigationBar
	 setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
	
	// setting slide menu view controller
	SWRevealViewController *revealViewController = self.revealViewController;
	if ( revealViewController )
	{
		[self.navigationItem.leftBarButtonItem setTarget: self.revealViewController];
		[self.navigationItem.leftBarButtonItem setAction: @selector( revealToggle: )];
		[self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
	}
	
	cellsReuseIdentifiers = [[NSArray alloc] initWithObjects:
							 @"userNameCell",
							 @"leadershipLevelCell",
							 @"amountOfPartnersCell",
							 @"testResultCell",
							 @"deviderCell",
							 @"ordersCell",
							 @"footerCell",
							 nil];
}

- (void) viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	[self restrictRotation:YES];
}

- (void) viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
	[self restrictRotation:NO];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	switch (tableView.tag) {
  case 0:
			return 5;
			break;
			
  default:
			break;
	}
	return 2;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	CGFloat height;
	
	switch (tableView.tag) {
		case 0:
			switch (indexPath.row) {
				case ordersCell:
					//height = [UIScreen mainScreen].nativeBounds.size.height * 0.15;
					height = tableView.frame.size.height * 0.20;
					break;
				case footerCell:
					//height = [UIScreen mainScreen].nativeBounds.size.height * 0.35;
					height = tableView.frame.size.height * 0.35;
					break;
				default:
					height = tableView.frame.size.height * 0.18;
					//height = [UIScreen mainScreen].nativeBounds.size.height * 0.10;
					break;
			}
			break;
		case 1:
			switch (indexPath.row) {
				case 0:
					//height = [UIScreen mainScreen].nativeBounds.size.height * 0.15;
					height = tableView.frame.size.height * 0.35;
					break;
				case 1:
					//height = [UIScreen mainScreen].nativeBounds.size.height * 0.35;
					height = tableView.frame.size.height * 0.65;
					break;
			}
			break;
		default:
			break;
	}
	
	/*
	 switch (indexPath.row) {
		case ordersCell:
	 //height = [UIScreen mainScreen].nativeBounds.size.height * 0.15;
	 height = self.view.bounds.size.height * 0.20;
	 break;
		case footerCell:
	 //height = [UIScreen mainScreen].nativeBounds.size.height * 0.35;
	 height = self.view.bounds.size.height * 0.35;
	 break;
		default:
	 height = self.view.bounds.size.height * 0.07;
	 //height = [UIScreen mainScreen].nativeBounds.size.height * 0.10;
	 break;
	 }

	 */
	 return height;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	NSInteger number = indexPath.row;
	if (tableView.tag == 1) {
		number += 5;
	}
	NSString *reuseIdentifier = [NSString stringWithString:[cellsReuseIdentifiers objectAtIndex:number]];
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
	return cell;
}

-(void) restrictRotation:(BOOL) restriction
{
	AppDelegate* appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
	appDelegate.restrictRotation = restriction;
}

#pragma mark - UITextField delegate methods

- (BOOL) textFieldShouldReturn:(UITextField *)textField {
	[self.view endEditing:YES];
	return NO;
}

- (IBAction)openOrderButtonCLicked:(id)sender {
	UITapGestureRecognizer *recogniser = sender;
	
	NSString *segueIdentifier;
	switch (recogniser.view.tag) {
		case 0:
			segueIdentifier = [NSString stringWithFormat:@"segueCabinet1"];
			break;
		case 1:
			segueIdentifier = [NSString stringWithFormat:@"segueCabinet2"];
			break;
		case 2:
			segueIdentifier = [NSString stringWithFormat:@"segueCabinet3"];
			break;
  default:
			break;
	}
	[self performSegueWithIdentifier:segueIdentifier sender:self];
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
