//
//  Slide2ContentViewController.m
//  SwissPlanner
//
//  Created by User on 4/27/16.
//  Copyright © 2016 Elena Baoychuk. All rights reserved.
//

#import "Slide2ContentViewController.h"

@interface Slide2ContentViewController ()

@end

@implementation Slide2ContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) setSpecificViews {
	self.block90label.text = NSLocalizedString(@"education.slide2.block1", nil);
	self.block9label.text = NSLocalizedString(@"education.slide2.block2", nil);
	self.block1label.text = NSLocalizedString(@"education.slide2.block3", nil);
    NSString *tableBonus = NSLocalizedString(@"education.slide2.tableBonus", nil);
    [self.tableBonus setImage:[UIImage imageNamed: tableBonus]];
}

@end
