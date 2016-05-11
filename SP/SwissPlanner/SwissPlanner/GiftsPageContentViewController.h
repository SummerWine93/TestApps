//
//  GiftsPageContentViewController.h
//  SwissPlanner
//
//  Created by User on 4/21/16.
//  Copyright © 2016 Elena Baoychuk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GiftsPageContentViewController : UIViewController

@property NSUInteger pageIndex;
@property NSString *titleText;
@property NSString *imageFile;

@property (weak, nonatomic) IBOutlet UILabel *textLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end
