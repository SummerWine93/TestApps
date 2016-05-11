//
//  Slide4ContentViewController.m
//  SwissPlanner
//
//  Created by User on 4/28/16.
//  Copyright © 2016 Elena Baoychuk. All rights reserved.
//

#import "Slide4ContentViewController.h"

@interface Slide4ContentViewController ()

@end

@implementation Slide4ContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
    // Do any additional setup after loading the view.
}

- (void) setSpecificViews {
	self.headerBlockLabel.text = @"Доходы в ЛИДЕРСКОЙ программе";
	self.headerContentBlock3Label.text = @"ГЛАВНАЯ таблица заказов";
	self.headerContentBlock4Label.text = @"VIP таблица заказов";
	
	self.contentBlock1Label.text = @"ТОВАРООБОРОТ / 500 = Бонусные единицы";
	self.contentBlock2Label.text = @"Бонусные единицы в ЛИДЕРСКОЙ программе накапливаются";
	self.contentBlock3Label.text = @"2100€ - 10% = 1890€ (товарооборот)\n1890€ / 500 = 3.78 бонусных единиц\nВы получаете за одну закрытую Главную таблицу";
	self.contentBlock4Label.text = @"8250€ - 10% = 7425€ (товарооборот)\n7425€ / 500 = 14.85 бонусных единиц\nВы получаете за одну закрытую VIP таблицу";
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
