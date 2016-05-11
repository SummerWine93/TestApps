//
//  PageContentViewController.h
//  SwissPlanner
//
//  Created by User on 4/12/16.
//  Copyright © 2016 Elena Baoychuk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PageContentViewController : UIViewController 

@property NSUInteger pageIndex;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (nonatomic, strong) IBOutletCollection(UIView) NSArray *roundedCorners;


- (void) setSpecificViews;

@end
