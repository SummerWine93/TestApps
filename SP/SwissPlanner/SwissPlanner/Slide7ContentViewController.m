//
//  Slide7ContentViewController.m
//  SwissPlanner
//
//  Created by User on 4/28/16.
//  Copyright © 2016 Elena Baoychuk. All rights reserved.
//

#import "Slide7ContentViewController.h"

@interface Slide7ContentViewController ()

@end

@implementation Slide7ContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	self.yourCellsRows = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:10], nil];
	self.partnerCellsRows = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:11], nil];
}

- (void) setSpecificViews {
	self.headerBlockLabel.text = @"Доходы в ЛИДЕРСКОЙ программе";
	self.headerContentBlock2Label.text = @"ГЛАВНАЯ таблица заказов";
	self.headerContentBlock3Label.text = @"VIP таблица заказов";
	
	self.contentBlock1Label.text = @"ДОХОД = Бонусные единицы х Разница цен между уровнями";
	
	self.contentBlock2Label.text = @"Если Вы находитесь на 2 уровне, а Ваш партнер на 1 уровне ЛИДЕРСКОЙ программы Ваш доход составит:\n3.78 х (20€ - 15€) = 18.90€";
	self.contentBlock3Label.text = @"Если Вы находитесь на 2 уровне, а Ваш партнер на 1 уровне ЛИДЕРСКОЙ программы Ваш доход составит:\n14.85 х (20€ - 15€) = 74.25€";
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
