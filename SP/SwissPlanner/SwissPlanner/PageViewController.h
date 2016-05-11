//
//  PageViewController.h
//  SwissPlanner
//
//  Created by User on 4/12/16.
//  Copyright © 2016 Elena Baoychuk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PageViewController : UIViewController <UIPageViewControllerDataSource>

@property (nonatomic, strong) NSArray *pageIds;
@property (strong, nonatomic) UIPageViewController *pageViewController;

@end

