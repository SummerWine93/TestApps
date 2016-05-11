//
//  Slide6ContentViewController.m
//  SwissPlanner
//
//  Created by User on 4/28/16.
//  Copyright © 2016 Elena Baoychuk. All rights reserved.
//

#import "Slide6ContentViewController.h"

@interface Slide6ContentViewController ()

@end

@implementation Slide6ContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.yourCellsRows = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:9], nil];
	self.partnerCellsRows = [NSMutableArray arrayWithCapacity:0];
}

- (void) setSpecificViews {
	self.headerBlockLabel.text = @"Доходы в ЛИДЕРСКОЙ программе";
	self.headerContentBlock2Label.text = @"ГЛАВНАЯ таблица заказов";
	self.headerContentBlock3Label.text = @"VIP таблица заказов";
	
	self.contentBlock1Label.text = @"ДОХОД = Цена за бонусную единицу х Бонусные единицы";
	
	self.contentBlock2Label.text = @"Если Вы находитесь в ЛИДЕРСКОЙ программе, а Ваш партнер еще нет - тогда на 3 уровне Вы зарабатываете 25€ за 1 бонусную единицу\n25€ х 3.78 = 94.50€ и т.д.";
	self.contentBlock3Label.text = @"Если Вы находитесь в ЛИДЕРСКОЙ программе, а Ваш партнер еще нет - тогда на 3 уровне Вы зарабатываете 25€ за 1 бонусную единицу\n25€ х 14.85 = 371.25€ и т.д.";
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
