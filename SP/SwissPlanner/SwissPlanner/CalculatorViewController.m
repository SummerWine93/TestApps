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
    NSArray *prepaymentArray;
    NSArray *plansArray;
   
    BOOL checkBoxSelected;
    BOOL orderSelecting;
    
    NSInteger selectedPlan;
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
    
    // setting the checkbox
    [_checkbox setBackgroundImage:[UIImage imageNamed:@"notselectedcheckbox.png"]
                        forState:UIControlStateNormal];
    [_checkbox setBackgroundImage:[UIImage imageNamed:@"selectedcheckbox.png"]
                        forState:UIControlStateSelected];
    [_checkbox setBackgroundImage:[UIImage imageNamed:@"selectedcheckbox.png"]
                        forState:UIControlStateHighlighted];
    _checkbox.adjustsImageWhenHighlighted=YES;

	// making fancy corners
	self.calculateButton.clipsToBounds = YES;
	self.calculateButton.layer.cornerRadius = 76 / 2.0 ;
	self.textDisplayView.layer.cornerRadius = self.textDisplayView.frame.size.width / 40;
	self.pickerLevel.layer.cornerRadius = 5;
	self.pickerPartnerLevel.layer.cornerRadius = 5;
	self.pickerPrepayment.layer.cornerRadius = 5;
	self.pickerViewPrepayment.layer.cornerRadius = 5;

	levelsArray = [NSArray arrayWithObjects:@"0", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"11",nil];
    prepaymentArray = [NSArray arrayWithObjects:@"220", @"720", @"1050", @"2800", @"3550", @"9850", nil];
    plansArray = [NSArray arrayWithObjects:@"pre Main", @"Main", @"pre VIP", @"VIP", @"pre VIP PLUS", @"VIP PLUS", nil];
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    selectedPlan = [self.selectedPlanNumber isEqual:nil] ? 1 : [self.selectedPlanNumber integerValue];
}

- (void) viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
	[self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_bar"] forBarMetrics:UIBarMetricsDefault];
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
    if (pickerView.tag == 2) {
        return [plansArray count];
    }
	return [levelsArray count];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
	return 1;
}

- (NSArray *)getPickerSourceArrayByTag: (NSInteger) tag {
    switch (tag) {
        case 0:
        case 1:
            return levelsArray;
            break;
        case 2:
            return prepaymentArray;
            break;
        default:
            break;
    }
    return nil;
}


- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
	UILabel* pickerLabel = (UILabel*)view;
	
	if (!pickerLabel)
	{
		pickerLabel = [[UILabel alloc] init];
		
		pickerLabel.font = [UIFont fontWithName:@"SourceSansPro-Semibold"                size:16];
		pickerLabel.textColor = [UIColor whiteColor];
		pickerLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth;
		
		pickerLabel.textAlignment=NSTextAlignmentCenter;
	}
    
	[pickerLabel setText:[[self getPickerSourceArrayByTag:pickerView.tag] objectAtIndex:row]];
	
	[[pickerView.subviews objectAtIndex:1] setHidden:TRUE];
	[[pickerView.subviews objectAtIndex:2] setHidden:TRUE];
	
	return pickerLabel;
}

- (void) pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    switch (pickerView.tag) {
        case 0:
            break;
        case 1:
            break;
        case 2:
            selectedPlan = row;
            self.selectedPlanLabel.text = [plansArray objectAtIndex:selectedPlan];
            break;
        default:
            break;
    }
}

#pragma mark - TableView delegate methods

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	return (tableView.frame.size.height / 5);
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    cell.textLabel.text = [plansArray objectAtIndex:indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:14];
	cell.textLabel.textColor = [UIColor whiteColor];
	cell.textLabel.adjustsFontSizeToFitWidth = YES;
	cell.backgroundColor = [UIColor clearColor];
	
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    selectedPlan = indexPath.row;
    self.selectedPlanLabel.text = [plansArray objectAtIndex:selectedPlan];
	[self.pickerPrepayment selectRow:selectedPlan inComponent:0 animated:YES];
	[self updateOrderSelectionMenu];
}



#pragma mark - Checkbox methods

- (IBAction)addToHistoryCheckboxChecked:(id)sender {
    checkBoxSelected = !checkBoxSelected; /* Toggle */
    [_checkbox setSelected:checkBoxSelected];
	self.pickerLevel.userInteractionEnabled = !checkBoxSelected;
}

- (IBAction)openOrderSelectionMenu:(id)sender {
	[self updateOrderSelectionMenu];
}

- (void) updateOrderSelectionMenu {
	orderSelecting =!orderSelecting;
	self.orderSelectionMenuView.hidden = !orderSelecting;
	[self.view setNeedsDisplay];
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
