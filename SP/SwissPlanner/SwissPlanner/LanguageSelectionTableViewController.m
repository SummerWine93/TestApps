//
//  LanguageSelectionTableViewController.m
//  SwissPlanner
//
//  Created by User on 6/13/16.
//  Copyright © 2016 Elena Baoychuk. All rights reserved.
//

#import "LanguageSelectionTableViewController.h"
#import "LanguageHelper.h"
#import "FontsHelper.h"

@interface LanguageSelectionTableViewController () {
	LanguageHelper *languageHelper;
	NSArray *languagesNames;
}

@end

@implementation LanguageSelectionTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	languageHelper = [[LanguageHelper alloc] init];
	languagesNames = [languageHelper getAllTheLanguagesNames];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [languagesNames count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
	
	cell.textLabel.text = [languagesNames objectAtIndex:indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:[FontsHelper getFontSize]];
    
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[languageHelper setCurrentLanguage:[[languageHelper getAllTheLanguages] objectAtIndex:indexPath.row]];
	UIAlertController *alertController = [UIAlertController alertControllerWithTitle: NSLocalizedString(@"language.settings.alert.title", nil) message:NSLocalizedString(@"language.settings.alert.text", nil) preferredStyle:UIAlertControllerStyleAlert];
	
	UIAlertAction* ok = [UIAlertAction actionWithTitle:NSLocalizedString(@"language.settings.alert.ok", nil) style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
		exit(0);
	}];
	[alertController addAction:ok];
	[alertController addAction:[UIAlertAction actionWithTitle:NSLocalizedString(@"language.settings.alert.cancel", nil) style:UIAlertActionStyleCancel handler:nil]];
	
	
	[self presentViewController:alertController animated:YES completion:nil];
	
	alertController.view.tintColor = [UIColor darkGrayColor];
}

@end
