//
//  TestsPageContentViewController.m
//  SwissPlanner
//
//  Created by User on 6/2/16.
//  Copyright © 2016 Elena Baoychuk. All rights reserved.
//

#import "TestsPageContentViewController.h"
#import "AnswerTestTableViewCell.h"
#import "QuestionTestTableViewCell.h"
#import "TestTableViewCell.h"

@interface TestsPageContentViewController ()

@end

@implementation TestsPageContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	switch (section) {
		case 0:
			return 1;
			break;
		case 1:
			return 3;
			break;
		default:
			return 0;
			break;
	}
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	switch (indexPath.section) {
		case 0:
		{
			QuestionTestTableViewCell *cell = (QuestionTestTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"QuestionTestTableViewCell"];
			cell.contentLabel.text = self.question;
			
			return cell;
		}
			break;
		case 1:
		{
			AnswerTestTableViewCell *cell = (AnswerTestTableViewCell *)[tableView dequeueReusableCellWithIdentifier: @"AnswerTestTableViewCell"];
			cell.contentLabel.text = self.answer;
			// setting the checkbox
			[cell.checkbox setBackgroundImage:[UIImage imageNamed:@"notselectedcheckbox.png"]
								 forState:UIControlStateNormal];
			[cell.checkbox setBackgroundImage:[UIImage imageNamed:@"selectedcheckbox.png"]
								 forState:UIControlStateSelected];
			[cell.checkbox setBackgroundImage:[UIImage imageNamed:@"selectedcheckbox.png"]
								 forState:UIControlStateHighlighted];
			cell.checkbox.adjustsImageWhenHighlighted=YES;
			
			return cell;
		}
			break;
		default:
			break;
	}
	UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
	//cell.textLabel.text = [plansArray objectAtIndex:indexPath.row];
	//cell.textLabel.font = [UIFont systemFontOfSize:14];
	//cell.textLabel.textColor = [UIColor whiteColor];
	//cell.textLabel.adjustsFontSizeToFitWidth = YES;
	//cell.backgroundColor = [UIColor clearColor];
	
	return cell;
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
