//
//  Slide8ContentViewController.m
//  SwissPlanner
//
//  Created by User on 4/28/16.
//  Copyright © 2016 Elena Baoychuk. All rights reserved.
//

#import "Slide8ContentViewController.h"

@interface Slide8ContentViewController ()

@end

@implementation Slide8ContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.yourCellsRows = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:8], nil];
	self.partnerCellsRows = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:11], nil];
}

- (void) setSpecificViews {
	self.headerBlockLabel.text = @"Доходы в ЛИДЕРСКОЙ программе";
	self.headerContentBlock2Label.text = @"ГЛАВНАЯ таблица заказов";
	self.headerContentBlock3Label.text = @"VIP таблица заказов";
	
	self.contentBlock1Label.text = @"ДОХОД = Бонусные единицы х Разница цен за Бонусные единицы между уровнями";
	
	self.contentBlock2Label.text = @"Если Вы находитесь на 4 уровне, а Ваш партнер на 1 уровне ЛИДЕРСКОЙ программы Ваш доход составит:\n3.78 х (30€ - 15€) = 56.70€";
	self.contentBlock3Label.text = @"Если Вы находитесь на 4 уровне, а Ваш партнер на 1 уровне ЛИДЕРСКОЙ программы Ваш доход составит:\n14.85 х (30€ - 15€) = 222.75€";
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
