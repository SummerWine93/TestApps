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
	self.block90label.text = @"90% - Покупка золота партнеру в БОНУСНОЙ программе";
	self.block9label.text = @"9% - Распределяется по ЛИДЕРСКОЙ программе";
	self.block1label.text = @"1% - Доход компании";
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
