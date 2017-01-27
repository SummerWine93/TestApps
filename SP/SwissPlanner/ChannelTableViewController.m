//
//  ChannelViewController.m
//  SwissPlanner
//
//  Created by Anastasiya Yarovenko on 25.01.17.
//  Copyright © 2017 Elena Boychuk. All rights reserved.
//

#import "ChannelTableViewController.h"

@interface ChannelTableViewController () {
    NSMutableArray *channelsArray;
}

@end

@implementation ChannelTableViewController

- (void)viewDidLoad {
    self.isMenuItem = [NSNumber numberWithBool:YES];
    
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    channelsArray = [[NSMutableArray alloc] initWithObjects:
                     NSLocalizedString(@"channel.item1", nil),
                     NSLocalizedString(@"channel.item2", nil),
                     NSLocalizedString(@"channel.item3", nil),
                     NSLocalizedString(@"channel.item4", nil),
                     NSLocalizedString(@"channel.item5", nil),
                     nil];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [channelsArray count];
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"channelCell"];
    cell.textLabel.text = [channelsArray objectAtIndex:indexPath.row];
    cell.backgroundColor = [UIColor colorWithWhite:0 alpha:0.1];
    cell.textColor = [UIColor whiteColor];
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"showVideos" sender:self];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
}


@end
