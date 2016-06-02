//
//  TestPageViewController.m
//  SwissPlanner
//
//  Created by Anastasiya Yarovenko on 02.06.16.
//  Copyright © 2016 Elena Baoychuk. All rights reserved.
//

#import "TestPageViewController.h"
#import "GiftsPageContentViewController.h"

@implementation TestPageViewController {
    NSArray *pageContent;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    pageContent = [NSArray arrayWithObjects:
				   
                   [NSArray arrayWithObjects:@"Question 1", @"Answer", nil],
                   [NSArray arrayWithObjects:@"Question 2", @"Answer", nil],
                   [NSArray arrayWithObjects:@"Question 3", @"Answer", nil],
                   [NSArray arrayWithObjects:@"Question 4", @"Answer", nil],
                   [NSArray arrayWithObjects:@"Question 5", @"Answer", nil],
                   [NSArray arrayWithObjects:@"Question 6", @"Answer", nil],
                   nil];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background(testing)"]];
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
    
    
    
}

- (void) viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    // before rotation
    
    [coordinator animateAlongsideTransition:^(id  _Nonnull context) {
        // during rotation
        [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_bar"] forBarMetrics:UIBarMetricsDefault];
        self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background(testing)"]];
    } completion:^(id  _Nonnull context) {
        
        // after rotation
    }];
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
    //pageContentViewController.titleText = [[pageContent objectAtIndex:index] objectAtIndex:labelText];
    //pageContentViewController.imageFile = [[pageContent objectAtIndex:index] objectAtIndex:mainImage];
    
    pageContentViewController.pageIndex = index;
    
    return pageContentViewController;
}



- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    //return [pageContent count];
    return 3;
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return 0;
}


@end
