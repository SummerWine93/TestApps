//
//  CalculatorViewController.m
//  SwissPlanner
//
//  Created by User on 4/12/16.
//  Copyright © 2016 Elena Baoychuk. All rights reserved.
//

#import "CalculatorViewController.h"
#import "SWRevealViewController.h"

#import "PlatformTypeChecker.h"

@interface CalculatorViewController () {
	NSArray *levelsArray;
    NSArray *prepaymentArray;
	NSArray *prepaymentValuesArray;
    NSArray *plansArray;
	NSArray *bonusForLevelsArray;
   
    BOOL checkBoxSelected;
    BOOL orderSelecting;
    
    NSInteger selectedPlan;
	NSInteger myLevel;
	NSInteger partnersLevel;
}

@end

@implementation CalculatorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	//self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background"]];
    [self updateViewBackground];
	
	// setting navigation bar
	UIBarButtonItem *menuButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menu"]
																   style:UIBarButtonItemStylePlain
																  target:self
																  action:nil];
	//[self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_bar"] forBarMetrics:UIBarMetricsDefault];
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
	self.calculateButton.layer.cornerRadius = 65 / 2.0 ;
	self.textDisplayView.layer.cornerRadius = self.textDisplayView.frame.size.width / 40;
	self.pickerLevel.layer.cornerRadius = 5;
	self.pickerPartnerLevel.layer.cornerRadius = 5;
	self.pickerPrepayment.layer.cornerRadius = 5;
	self.pickerViewPrepayment.layer.cornerRadius = 5;

	levelsArray = [NSArray arrayWithObjects:@"0", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"11",nil];
    prepaymentArray = [NSArray arrayWithObjects:@"220", @"720", @"1050", @"2800", @"3550", @"9850", nil];
	prepaymentValuesArray = [NSArray arrayWithObjects:@220, @720, @1050, @2800, @3550, @9850, nil];
    plansArray = [NSArray arrayWithObjects:@"pre", @"Main", @"pre VIP", @"VIP", @"pre VIP PLUS", @"VIP PLUS", nil];
	
	bonusForLevelsArray = [NSArray arrayWithObjects: @0, @15, @20, @25, @30, @35, @40, @43, @45, @47, @49, @50, nil];
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    selectedPlan = [self.selectedPlanNumber isEqual:nil] ? 1 : [self.selectedPlanNumber integerValue];
	if (selectedPlan) {
		self.selectedPlanLabel.text = [plansArray objectAtIndex:selectedPlan];
		[self.pickerPrepayment selectRow:selectedPlan inComponent:0 animated:YES];
	}
    
}

- (void) viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    // before rotation
    
    [coordinator animateAlongsideTransition:^(id  _Nonnull context) {
        // during rotation
        [self updateViewBackground];
    } completion:^(id  _Nonnull context) {
        
        // after rotation
    }];
}


- (void) viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.selectedPlan = nil;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void) updateViewBackground {
    NSString *platform = [PlatformTypeChecker platformType];
    if ([platform isEqualToString:@"iPhone 6"]||[platform isEqualToString:@"iPhone 6 Plus"]||[platform isEqualToString:@"iPhone 6S"]||[platform isEqualToString:@"Simulator"]) {
        self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background_iphone6"]];
        [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_bar_iphone6"] forBarMetrics:UIBarMetricsDefault];
    } else {
        self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background"]];
        [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_bar"] forBarMetrics:UIBarMetricsDefault];
    }
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
    return [plansArray count];
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	return (tableView.frame.size.height / [plansArray count]);
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

- (IBAction)isDirectButtonClicked:(id)sender {
    checkBoxSelected = !checkBoxSelected; /* Toggle */
    [_checkbox setSelected:checkBoxSelected];
	
	self.pickerLevel.userInteractionEnabled = !checkBoxSelected;
    NSInteger level;
	NSInteger partnersLevel;
    if (checkBoxSelected) {
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        level = [[defaults objectForKey:@"userLevel"] integerValue];
		partnersLevel = 1;
    } else {
        level = 0;
		partnersLevel = 0;
    }
	/*
    if (checkBoxSelected && _selectedPlanNumber) {
        selectedPlan = [_selectedPlanNumber integerValue];
    } else {
        selectedPlan = 0;
    }
    [self.pickerPrepayment selectRow:selectedPlan inComponent:0 animated:YES];
    self.selectedPlanLabel.text = [plansArray objectAtIndex:selectedPlan];*/
    [self.pickerLevel selectRow:level inComponent:0 animated:YES];
	[self.pickerPartnerLevel selectRow:partnersLevel inComponent:0 animated:YES];
}

- (IBAction)openOrderSelectionMenu:(id)sender {
	[self updateOrderSelectionMenu];
}

- (void) updateOrderSelectionMenu {
	orderSelecting =!orderSelecting;
	self.orderSelectionMenuView.hidden = !orderSelecting;
	[self.view setNeedsDisplay];
}



- (NSAttributedString *) countIncomeResult {
	NSInteger yourLevelBonus = [[bonusForLevelsArray objectAtIndex:[self.pickerLevel selectedRowInComponent:0]] integerValue];
    NSInteger partnerLevelBonus = (checkBoxSelected)? [[bonusForLevelsArray objectAtIndex:1] integerValue]:[[bonusForLevelsArray objectAtIndex:[self.pickerPartnerLevel selectedRowInComponent:0]] integerValue];
	/*
	if (partnerLevelBonus > yourLevelBonus) {
		NSMutableAttributedString *attributedResultsString = [[NSMutableAttributedString alloc] initWithString:@"Partners level can't be higher then yours. Please select the correct value."];
		return attributedResultsString;
	}*/
	
	// Showing the prepayment value
	NSNumber *prepaymentValue =  [prepaymentValuesArray objectAtIndex:selectedPlan];
	NSString *prepaymentString = [NSString stringWithFormat:@"Prepayment = %@\n", [prepaymentValue stringValue]];
	// Showing the turnover value
	NSInteger internetCommission = (selectedPlan>1)?50:20;
	NSNumber *turnoverValue =  [NSNumber numberWithDouble:(0.9 * ([prepaymentValue integerValue] - internetCommission)*3)];
	NSString *turnoverString = [NSString stringWithFormat:@"Commodity circulation = (%@ - %d) x 3 - 10%% = %@\n", [prepaymentValue stringValue], internetCommission,[turnoverValue stringValue]];
	// Showing the number of carier points value
	NSNumber *carierPointsValue =  [NSNumber numberWithDouble:( [turnoverValue doubleValue]/500)];
	NSString *carierPointsString = [NSString stringWithFormat:@"Number of bonus units = %@ / 500 = %@\n", [turnoverValue stringValue], [carierPointsValue stringValue]];
	// Showing the number of carier points value
	
	NSNumber *carierPointPriceValue =  [NSNumber numberWithInteger:(yourLevelBonus - partnerLevelBonus)];
	NSString *carierPointPriceString = [NSString stringWithFormat:@"Price of bonus units = %d - %d = %@\n", yourLevelBonus, partnerLevelBonus, [carierPointPriceValue stringValue]];
	// Showing the income value
	NSNumberFormatter *nf = [[NSNumberFormatter alloc] init];
	[nf setMaximumFractionDigits:3];
	NSNumber *incomeValue =  [NSNumber numberWithDouble:([carierPointPriceValue doubleValue]*[carierPointsValue doubleValue])];
	NSString *extraInfo = @"\nYou are wasting your money!";
	NSString *incomeString = [NSString stringWithFormat:@"Income = %@ * %@ = %@%@", [carierPointPriceValue stringValue], [carierPointsValue stringValue], [ nf stringFromNumber:incomeValue], ([incomeValue intValue]>0)?@"":extraInfo];
	
	NSMutableAttributedString *attributedResultsString = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@%@%@%@", prepaymentString, turnoverString, carierPointsString, carierPointPriceString]];
	[attributedResultsString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14] range:NSMakeRange(0, attributedResultsString.string.length)];
	NSMutableAttributedString *resultAppendix = [[NSMutableAttributedString alloc] initWithString:incomeString];
	[resultAppendix addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:(128.0/255.0) green:(0) blue:(0) alpha:1] range:NSMakeRange(0, resultAppendix.string.length)];
	[resultAppendix addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:15] range:NSMakeRange(0, resultAppendix.string.length)];
	
	[attributedResultsString appendAttributedString:resultAppendix];
	
	return attributedResultsString;
}

- (IBAction)countIncomeButtonTapped:(id)sender {
	self.textDisplayViewLabel.attributedText = [self countIncomeResult];
}
@end
