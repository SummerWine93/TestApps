//
//  MainViewController.m
//  SwissPlanner
//
//  Created by User on 4/11/16.
//  Copyright © 2016 Elena Baoychuk. All rights reserved.
//

#import "MainViewController.h"
#import "SWRevealViewController.h"
#import "CalculatorViewController.h"

#import "CabinetContentTableViewCell.h"
#import "OrdersTableViewCell.h"

#import "PlatformTypeChecker.h"

@interface MainViewController () {
	NSArray *cellsReuseIdentifiers;
	
    NSString *userName;
    NSNumber *userLevel;
    NSNumber *userPoints;
    NSNumber *pointsLeft;
	BOOL isInLeadershipProgram;
	
	NSArray *levelsPointsArray;
    NSInteger _numberOfCells;
    OrdersTableViewCell *ordersCellContainer;
    NSUInteger orderNumber;
    NSArray *orderTablesDataArray;
}

@end

typedef enum {
	userNameCell,
	leadershipLevelCell,
	bonusUnitsCell,
	pointsLeftCell,
	deviderCell,
	ordersCell,
	footerCell
}cells;

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.backgroundView = [UIView new];
    self.tableView.backgroundView.backgroundColor = [UIColor clearColor];
    
    [self updateViewBackground];
	
	// setting navigation bar
    
	UIBarButtonItem *menuButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menu"]
																   style:UIBarButtonItemStylePlain
																  target:self
																  action:nil];
	self.navigationItem.leftBarButtonItem = menuButton;
	
	
	[self.navigationController.navigationBar
	 setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
	
	self.navigationItem.title = NSLocalizedString(@"cabinet.title", nil);
	
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
							 @"bonusUnitsCell",
							 @"pointsLeftCell",
							 @"deviderCell",
							 @"ordersCell",
							 @"footerCell",
							 nil];
	
	levelsPointsArray = [NSArray arrayWithObjects:@0, @0, @100, @300, @1000, @2500, @5000, @10000, @25000, @50000, @100000, @20000, nil];
    
    orderTablesDataArray = [NSArray arrayWithObjects:
                            [NSArray arrayWithObjects:@"table0", NSLocalizedString(@"cabinet.order.startOrder", nil), nil],
                            [NSArray arrayWithObjects:@"table1", NSLocalizedString(@"cabinet.order.mainOrder", nil), nil],
                            [NSArray arrayWithObjects:@"table2", NSLocalizedString(@"cabinet.order.vipOrder", nil), nil],
                            [NSArray arrayWithObjects:@"table3", NSLocalizedString(@"cabinet.order.vipPlusOrder", nil), nil],
                            nil];
    
    _numberOfCells = 3;
    
    self.leftSwipeGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipes:)];
    self.rightSwipeGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipes:)];
    
    self.leftSwipeGestureRecognizer.direction = UISwipeGestureRecognizerDirectionLeft;
    self.rightSwipeGestureRecognizer.direction = UISwipeGestureRecognizerDirectionRight
    ;
    [self.revealViewController.panGestureRecognizer requireGestureRecognizerToFail:self.rightSwipeGestureRecognizer];
    
    orderNumber = 0;
}

- (void) viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
    
    // Get the stored data before the view loads
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    userName = [defaults objectForKey:@"userName"];
    userLevel = [defaults objectForKey:@"userLevel"];
    userPoints = [defaults objectForKey:@"userPoints"];
    pointsLeft = [defaults objectForKey:@"pointsLeft"];
	isInLeadershipProgram = [[defaults objectForKey:@"isInLeadershipProgram"] boolValue];
    
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

- (void) updateViewBackground {
    NSString *platform = [PlatformTypeChecker platformType];
    NSString *navBarImageName, *backImageName;
    if ([platform isEqualToString:@"iPhone 6"]||[platform isEqualToString:@"iPhone 6S"]) {
        navBarImageName = @"nav_bar_iphone6";
        backImageName = @"background_iphone6";
    }
    else if ([platform containsString:@"iPad"]||[platform isEqualToString:@"Simulator"]){
        navBarImageName = @"nav_bar";
        backImageName = @"background";
    }
    else {
        navBarImageName = @"nav_bar";
        backImageName = @"background";
    }
    UIImage *stretchableBackground = [[UIImage imageNamed:navBarImageName] resizableImageWithCapInsets:UIEdgeInsetsMake(0,0,self.navigationController.view.frame.size.height,self.navigationController.view.frame.size.width) resizingMode:UIImageResizingModeStretch];
    [self.navigationController.navigationBar setBackgroundImage:stretchableBackground forBarMetrics:UIBarMetricsDefault];
    self.view.layer.contents = (id)[UIImage imageNamed:backImageName].CGImage;
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
					height = tableView.frame.size.height * 0.20;
					break;
				case footerCell:
					height = tableView.frame.size.height * 0.35;
					break;
				default:
					height = tableView.frame.size.height * 0.18;
					break;
			}
			break;
		case 1:
			switch (indexPath.row) {
				case 0:
					height = tableView.frame.size.height * 0.35;
					break;
				case 1:
					height = tableView.frame.size.height * 0.65;
					break;
			}
			break;
		default:
			break;
	}
	 return height;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	NSInteger number = indexPath.row;
	if (tableView.tag == 1) {
		number += 5;
	}
	NSString *reuseIdentifier = [NSString stringWithString:[cellsReuseIdentifiers objectAtIndex:number]];
	
	
	if (tableView.tag == 0) {
        CabinetContentTableViewCell *cell = (CabinetContentTableViewCell *)[tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
        NSString *cellText;
		NSString *titleText;
		
        [cell setBackgroundColor:[UIColor clearColor]];
        
        switch (indexPath.row) {
            case userNameCell:
				titleText = @"";
                cellText = ([userName length])?userName:NSLocalizedString(@"cabinet.cellcontent.1.placeholder", nil);
                break;
            case leadershipLevelCell:
				titleText = NSLocalizedString(@"cabinet.cellcontent.2.title", nil);
                cellText = (userLevel)?[userLevel stringValue]:@"0";
                break;
            case bonusUnitsCell:
				titleText = NSLocalizedString(@"cabinet.cellcontent.3.title", nil);
                cellText = (isInLeadershipProgram)?[userPoints stringValue]:NSLocalizedString(@"cabinet.cellcontent.2_3.none", nil);
                 break;
            case pointsLeftCell:
				titleText = NSLocalizedString(@"cabinet.cellcontent.4.title", nil);
				cellText = (([userLevel integerValue]<11) && isInLeadershipProgram)?[pointsLeft stringValue]:NSLocalizedString(@"cabinet.cellcontent.2_3.none", nil);
                 break;
            default:
                break;
        }
        if (cellText != nil) {
            [cell contentLabel].text = cellText;
			[cell titleLabel].text = titleText;
        }
		
        return cell;
    } else {
		if (indexPath.row == 0) {
			OrdersTableViewCell *cell = (OrdersTableViewCell *) [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
            
            cell.orderLabel.text = orderTablesDataArray[orderNumber][1];
            cell.orderImage.image = [UIImage imageNamed:orderTablesDataArray[orderNumber][0]];
			cell.vipOrderLabel.text = NSLocalizedString(@"cabinet.order.vipOrder", nil);
			cell.vipPlusOrderLabel.text = NSLocalizedString(@"cabinet.order.vipPlusOrder", nil);
            
            ordersCellContainer = cell;
            [ordersCellContainer addGestureRecognizer:self.leftSwipeGestureRecognizer];
            [ordersCellContainer addGestureRecognizer:self.rightSwipeGestureRecognizer];
            
			return cell;
		}
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
        return cell;
    }
	return nil;
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
			//segueIdentifier = [NSString stringWithFormat:@"segueCabinet2"];
            [self showNextOrderReverse:true];
			break;
		case 2:
			//segueIdentifier = [NSString stringWithFormat:@"segueCabinet3"];
            [self showNextOrderReverse:false];
			break;
  default:
			break;
	}
	[self performSegueWithIdentifier:segueIdentifier sender:self];
}

- (IBAction)selectOrderButtonCLicked:(id)sender {
    UIButton *button = sender;
    
    switch (button.tag) {
        case 0:
            break;
        case 1:
            [self showNextOrderReverse:true];
            break;
        case 2:
            [self showNextOrderReverse:false];
            break;
        default:
            break;
    }
 }


- (void)handleSwipes:(UISwipeGestureRecognizer *)sender
{
    BOOL reverse = false;
    if (sender.direction == UISwipeGestureRecognizerDirectionRight)
    {
        //orderNumber = ((orderNumber == 0) ? 3 : (orderNumber - 1));
        reverse = true;
        
    }
    
    if (sender.direction == UISwipeGestureRecognizerDirectionLeft)
    {
        //orderNumber = (orderNumber + 1)%4;
        reverse = false;
    }
    //ordersCellContainer.orderLabel.text = orderTablesDataArray[orderNumber][1];
    //ordersCellContainer.orderImage.image = [UIImage imageNamed:orderTablesDataArray[orderNumber][0]];
    [self showNextOrderReverse:reverse];
}

-(void)showNextOrderReverse:(BOOL)isReverse {
    if (isReverse) {
        orderNumber = ((orderNumber == 0) ? 3 : (orderNumber - 1));
    } else {
        orderNumber = (orderNumber + 1)%4;

    }
    
    [UIView animateWithDuration:0.3 animations:^{
        ordersCellContainer.alpha = 0.5;
    } completion:^(BOOL finished) {
        ordersCellContainer.orderLabel.text = orderTablesDataArray[orderNumber][1];
        ordersCellContainer.orderImage.image = [UIImage imageNamed:orderTablesDataArray[orderNumber][0]];
        ordersCellContainer.alpha = 1;
    }];
    
    
}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
     CalculatorViewController *vc = [segue destinationViewController];
    if ([segue.identifier isEqualToString:@"segueCabinet1"]) {
        vc.selectedPlanNumber = [NSNumber numberWithInt:1];
    } else if ([segue.identifier isEqualToString:@"segueCabinet2"]) {
        vc.selectedPlanNumber = [NSNumber numberWithInt:3];
    } else if ([segue.identifier isEqualToString:@"segueCabinet3"]) {
        vc.selectedPlanNumber = [NSNumber numberWithInt:5];
    }
    vc.selectedPlanNumber = [NSNumber numberWithInt:(2 * orderNumber + 1)];
    vc.viewControllerIsInSecondaryLine = [NSNumber numberWithBool:YES];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return _numberOfCells;
}

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    UICollectionViewCell *cell = (UICollectionViewCell*)[collectionView dequeueReusableCellWithReuseIdentifier:@"orderTableCell" forIndexPath:indexPath];
    
    return cell;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    //NSInteger viewWidth = self.collectionView.bounds.size.width;
    
    
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    return YES;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    return YES;
}
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    return YES;
}

@end
