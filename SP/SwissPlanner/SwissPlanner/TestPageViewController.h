//
//  TestPageViewController.h
//  SwissPlanner
//
//  Created by Anastasiya Yarovenko on 02.06.16.
//  Copyright © 2016 Elena Baoychuk. All rights reserved.
//

#import "PageViewController.h"
#import "TestCheckerDelegate.h"

@interface TestPageViewController : UIViewController <UIPageViewControllerDataSource, UIPageViewControllerDelegate, TestCheckerDelegate>

@property (strong, nonatomic) UIPageViewController *pageViewController;
@property (strong, nonatomic) NSNumber *viewControllerIsInSecondaryLine;
@property (weak, nonatomic) IBOutlet UILabel *questionNumberIndicatorLabel;

@end
