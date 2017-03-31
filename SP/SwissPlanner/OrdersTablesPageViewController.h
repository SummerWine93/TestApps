//
//  OrdersTablesPageViewController.h
//  SwissPlanner
//
//  Created by Anastasiya Yarovenko on 08.03.17.
//  Copyright © 2017 Elena Boychuk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrdersTablesPageViewController : UIViewController<UIPageViewControllerDataSource, UIPageViewControllerDelegate>

@property (strong, nonatomic) UIPageViewController *pageViewController;

@end
