//
//  Slide5ViewController.m
//  SwissPlanner
//
//  Created by User on 4/28/16.
//  Copyright © 2016 Elena Baoychuk. All rights reserved.
//

#import "Slide5ViewController.h"

@interface Slide5ViewController ()

@end

@implementation Slide5ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	self.yourCellsRows = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:10], [NSNumber numberWithInt:11], nil];
	self.partnerCellsRows = [NSMutableArray arrayWithCapacity:0];
}

- (void) setSpecificViews {
	self.headerBlockLabel.text = @"Доходы в ЛИДЕРСКОЙ программе";
	self.headerContentBlock2Label.text = @"ГЛАВНАЯ таблица заказов";
	self.headerContentBlock3Label.text = @"VIP таблица заказов";
	
	self.contentBlock1Label.text = @"ДОХОД = Цена за 1 бонусную единицу х Бонусные единицы";
	
	self.contentBlock2Label.text = @"На 1 уровне в ЛИДЕРСКОЙ программе Вы зарабатываете 15€ за 1 бонусную единицу.\n15€ х 3.78 = 56.70€ \nНа 2 уровне в ЛИДЕРСКОЙ программе Вы зарабатываете 20€ за 1 бонусную единицу.\n20€ х 3.78 = 75.60€";
	self.contentBlock3Label.text = @"На 1 уровне в ЛИДЕРСКОЙ программе Вы зарабатываете 15€ за 1 бонусную единицу.\n15€ х 14.85 = 222.75€ \nНа 2 уровне в ЛИДЕРСКОЙ программе Вы зарабатываете 20€ за 1 бонусную единицу.\n20€ х 14.85 = 297.00€";
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
