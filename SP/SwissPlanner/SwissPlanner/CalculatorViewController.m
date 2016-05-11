//
//  CalculatorViewController.m
//  SwissPlanner
//
//  Created by User on 4/12/16.
//  Copyright © 2016 Elena Baoychuk. All rights reserved.
//

#import "CalculatorViewController.h"
#import "SWRevealViewController.h"

@interface CalculatorViewController () {
	NSArray *levelsArray;
}

@end

@implementation CalculatorViewController

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

	// adding navigation capabilities
	self.navigationItem.leftBarButtonItem = menuButton;
	SWRevealViewController *revealViewController = self.revealViewController;
	if ( revealViewController )
	{
		[self.navigationItem.leftBarButtonItem setTarget: self.revealViewController];
		[self.navigationItem.leftBarButtonItem setAction: @selector( revealToggle: )];
		[self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
	}

	// making fancy corners
	self.calculateButton.clipsToBounds = YES;
	self.calculateButton.layer.cornerRadius = 76 / 2.0 ;
	self.textDisplayView.layer.cornerRadius = self.textDisplayView.frame.size.width / 40;
	self.pickerLevel.layer.cornerRadius = 5;
	self.pickerPartnerLevel.layer.cornerRadius = 5;
	self.pickerPrepayment.layer.cornerRadius = 5;
	self.pickerViewPrepayment.layer.cornerRadius = 5;

	levelsArray = [NSArray arrayWithObjects:@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"11",nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Pickerview delegate methods

- (CGFloat) pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
	return (pickerView.frame.size.height / 2.5);
}

- (NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
	return [levelsArray count];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
	return 1;
}


- (NSAttributedString *) pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component {
	UIColor *color = [UIColor whiteColor];
	NSString *string = [levelsArray objectAtIndex:row];
	NSMutableParagraphStyle *paragraphStyle = NSMutableParagraphStyle.new;
 paragraphStyle.alignment                = NSTextAlignmentCenter;

	NSDictionary *attrs = @{ NSForegroundColorAttributeName : color , NSParagraphStyleAttributeName:paragraphStyle};
	NSAttributedString *attrStr = [[NSAttributedString alloc] initWithString:string attributes:attrs];
    
    [[pickerView.subviews objectAtIndex:1] setHidden:TRUE];
    [[pickerView.subviews objectAtIndex:2] setHidden:TRUE];
    
	return attrStr;
}


/*
- (UIView *) pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
	UIView *newView = [[UIView alloc] initWithFrame:view.frame];
	
	CALayer *border = [CALayer layer];
	CGFloat borderWidth = 2;
	border.borderColor = [UIColor whiteColor].CGColor;
	border.frame = CGRectMake(5, view.frame.size.height - borderWidth, view.frame.size.width - 5, view.frame.size.height);
	border.borderWidth = borderWidth;
	[newView.layer addSublayer:border];
	newView.layer.masksToBounds = YES;
	
	UILabel *textLabel = [[UILabel alloc] initWithFrame:newView.frame];
	textLabel.text = [levelsArray objectAtIndex:row];
	[newView addSubview:textLabel];
	
	return newView;
}*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
