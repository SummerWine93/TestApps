//
//  GiftsPageViewController.m
//  SwissPlanner
//
//  Created by User on 4/21/16.
//  Copyright © 2016 Elena Baoychuk. All rights reserved.
//

#import "GiftsPageViewController.h"
#import "GiftsPageContentViewController.h"
#import "SWRevealViewController.h"

#define MAX_NUM 3

typedef enum {
	mainImage,
	labelText
}contentArrayElements;

@interface GiftsPageViewController () {
	NSArray *pageContent;
}

@end

@implementation GiftsPageViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	pageContent = [NSArray arrayWithObjects:
				   [NSArray arrayWithObjects:@"gift level1", @"1 Level", nil],
				   [NSArray arrayWithObjects:@"gift level3", @"3 Level", nil],
				   [NSArray arrayWithObjects:@"gift level5", @"5 Level", nil],
				   [NSArray arrayWithObjects:@"gift level8", @"8 Level", nil],
				   [NSArray arrayWithObjects:@"gift no level", @"", nil],
				   nil];
	
	self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background(gifts)"]];
	[self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_bar"] forBarMetrics:UIBarMetricsDefault];
	[self.navigationController.navigationBar
	 setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
	
	// Create page view controller
	self.pageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageViewController"];
	self.pageViewController.dataSource = self;
	
	GiftsPageContentViewController *startingViewController = [self viewControllerAtIndex:0];
	NSArray *viewControllers = @[startingViewController];
	[self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
	
	// Change the size of page view controller
    self.pageViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height + 5);
	
	
	[self addChildViewController:_pageViewController];
	[self.view addSubview:_pageViewController.view];
	[self.pageViewController didMoveToParentViewController:self];
	
	// setting navigation bar
	UIBarButtonItem *menuButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menu"]
																   style:UIBarButtonItemStylePlain
																  target:self
																  action:nil];
	self.navigationItem.leftBarButtonItem = menuButton;
	self.navigationController.navigationBar.translucent = NO;
	
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
    // Dispose of any resources that can be recreated.
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
	NSUInteger index = ((GiftsPageContentViewController*) viewController).pageIndex;
	
	if ((index == 0) || (index == NSNotFound)) {
		return nil;
	}
	
	index--;
	return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
	NSUInteger index = ((GiftsPageContentViewController*) viewController).pageIndex;
	
	if (index == NSNotFound) {
		return nil;
	}
	
	index++;
	if (index == [pageContent count]) {
		return nil;
	}
	return [self viewControllerAtIndex:index];
}

- (GiftsPageContentViewController *)viewControllerAtIndex:(NSUInteger)index
{
	if (index >= [pageContent count]) {
		return nil;
	}
	// Create a new view controller and pass suitable data.
	GiftsPageContentViewController *pageContentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"GiftsPageContentController"];
	pageContentViewController.titleText = [[pageContent objectAtIndex:index] objectAtIndex:labelText];	
	pageContentViewController.imageFile = [[pageContent objectAtIndex:index] objectAtIndex:mainImage];
	
	pageContentViewController.pageIndex = index;
	
	return pageContentViewController;
}



- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
	return [pageContent count];
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
	return 0;
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
