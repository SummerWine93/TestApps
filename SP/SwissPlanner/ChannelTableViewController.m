//
//  ChannelViewController.m
//  SwissPlanner
//
//  Created by Anastasiya Yarovenko on 25.01.17.
//  Copyright © 2017 Elena Boychuk. All rights reserved.
//

#import "ChannelTableViewController.h"
#import "WebApiController.h"
#import "VideosTableViewController.h"

@interface ChannelTableViewController () {
    NSMutableArray *channelsArray;
    NSMutableArray *videosArray;
    NSMutableArray *audiosArray;
    NSString * selectedCategoryIndex;
    WebApiController *apiController;
}

@end

@implementation ChannelTableViewController

- (void)viewDidLoad {
    self.isMenuItem = [NSNumber numberWithBool:YES];
    
    [super viewDidLoad];
    
    // add spinner
    apiController = [[WebApiController alloc] init];
    [apiController getCategoriesWithSuccess:^(NSArray *data) {
        channelsArray = [NSMutableArray arrayWithArray:data];
        [self.tableView reloadData];
        // stop spinner
        NSLog(@"OK");
        
    } error:^(NSError *error) {
        // stop spinner
        NSLog(@"not OK");
    }];
    
    [apiController getVideosWithSuccess:^(NSArray *data) {
        videosArray = [NSMutableArray arrayWithArray:data];
        // stop spinner
        NSLog(@"OK");
        
    } error:^(NSError *error) {
        // stop spinner
        NSLog(@"not OK");
    }];
    
    [apiController getAudiosWithSuccess:^(NSArray *data) {
        audiosArray = [NSMutableArray arrayWithArray:data];
        // stop spinner
        NSLog(@"OK");
        
    } error:^(NSError *error) {
        // stop spinner
        NSLog(@"not OK");
    }];
    
    
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
    NSString *translatedName = [[channelsArray objectAtIndex:indexPath.row] objectForKey:@"translated_name"];
    cell.textLabel.text = (translatedName != NULL)? translatedName : [[channelsArray objectAtIndex:indexPath.row] objectForKey:@"name"];
    cell.backgroundColor = [UIColor colorWithWhite:0 alpha:0.1];
    cell.textColor = [UIColor whiteColor];
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    selectedCategoryIndex = [[channelsArray objectAtIndex:indexPath.row] objectForKey:@"category_id"];
    [self performSegueWithIdentifier:@"showVideos" sender:self];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSMutableArray *videosPackageArray = [NSMutableArray array];
    for (NSDictionary *videoObject in videosArray) {
        if ([[videoObject objectForKey:@"category_id"] isEqualToString:selectedCategoryIndex]) {
            [videosPackageArray addObject:videoObject];
        }
    }
    VideosTableViewController *vc = [segue destinationViewController];
    vc.videosArray = [NSArray arrayWithArray:videosPackageArray];
    NSLog(@"OK");
}


@end
