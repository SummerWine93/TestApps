//
//  Slide1ContentViewController.m
//  SwissPlanner
//
//  Created by User on 4/27/16.
//  Copyright © 2016 Elena Baoychuk. All rights reserved.
//

#import "Slide1ContentViewController.h"

@interface Slide1ContentViewController ()

@end

@implementation Slide1ContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void) setSpecificViews {
	self.headerBlockLabel.text = @"Доход в компании SWISSGOLDEN";
	self.headerContentBlock1Label.text = @"БОНУСНАЯ программа";
	self.headerContentBlock2Label.text = @"ЛИДЕРСКАЯ программа";
	self.contentBlock1Label.text = @"Быстрый старт\nАктивный доход";
	self.contentBlock2Label.text = @"Пассивный доход";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
