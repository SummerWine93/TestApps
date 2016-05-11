//
//  Slide3ContentViewController.m
//  SwissPlanner
//
//  Created by User on 4/27/16.
//  Copyright © 2016 Elena Baoychuk. All rights reserved.
//

#import "Slide3ContentViewController.h"

@interface Slide3ContentViewController ()

@end

@implementation Slide3ContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void) setSpecificViews {
	self.headerBlockLabel.text = @"Условия выхода в лидерскую программу";
	self.headerContentBlock1Label.text = @"В ГЛАВНОМ договоре";
	self.headerContentBlock2Label.text = @"В VIP договоре";
	self.contentBlock1Label.text = @"1 Вы должны закрыть свою ГЛАВНУЮ таблицу\n\n2 Ваши 2 приглашенных должны также закрыть свои таблицы\n\n3 И их по 2 приглашенных должны закрыть свои таблицы";
	self.contentBlock2Label.text = @"1 Вы должны закрыть свою VIP таблицу\n\n2 Ваши 2 приглашенных должны также закрыть свои таблицы";
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
