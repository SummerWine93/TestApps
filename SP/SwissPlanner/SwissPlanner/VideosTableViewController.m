//
//  VideosViewController.m
//  SwissPlanner
//
//  Created by Anastasiya Yarovenko on 24.01.17.
//  Copyright © 2017 Elena Boychuk. All rights reserved.
//

#import "VideosTableViewController.h"
#import "WebApiController.h"
#import "VideoViewController.h"

#define API_KEY @"AIzaSyASzw3p4duf4yJcsKH-4D0Xdf0Vwh4pl2s"
#define API_URL @"https://www.googleapis.com/youtube/v3/channels?part=contentDetails,snippet&forUsername=%@&key=%@"

@interface VideosTableViewController () {
    NSMutableArray *videosArray;
    NSArray *desiredChannelsArray;
    NSMutableArray *channelsDataArray;
    WebApiController *apiController;
    NSDictionary * selectedVideoObject;
}

@end

@implementation VideosTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    videosArray = [NSMutableArray array];
    
    [self getData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) getData {
    /*videosArray = [[NSMutableArray alloc] initWithObjects:
                   @"Video1",
                   @"Video2",
                   @"Video3",
                   @"Video4",
                   @"Video5",
                   @"Video6",
                   nil];
    
    desiredChannelsArray = [NSArray arrayWithObjects:@"Apple", @"Google", nil]; */
    apiController = [[WebApiController alloc] init];
    for (NSDictionary *video in self.videosArray) {
        [apiController getYoutubeVideoWithId:[video objectForKey:@"youtube_id"] cess:^(NSDictionary *data) {
            [videosArray addObject:data];
            [self.tableView reloadData];
        } error:^(NSError *error) {
            // error
        }];
    }
}

- (void) performGetDataForUrl: (NSURL *) theUrl RequestWithCompletitionHandler: (void (^) (NSData *data, NSURLResponse *response, NSError *error )) comletitionHandler{
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:theUrl];
    request.HTTPMethod = @"GET";
    
    NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfiguration];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            comletitionHandler(data, response, error);
        });
    }];
    [dataTask resume];
    
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [videosArray count];
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 65;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"videoCell"];
    cell.textLabel.text = [[videosArray objectAtIndex:indexPath.row] objectForKey:@"title"];
    cell.imageView.image = [UIImage imageNamed:@"video-icon"];
    cell.backgroundColor = [UIColor colorWithWhite:0 alpha:0.1];
    cell.textColor = [UIColor whiteColor];
    
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //[[UIApplication sharedApplication] openURL:[NSURL URLWithString: @"https://www.youtube.com/user/infoswissgolden"]];
    //[self getChannelInfo:indexPath.row];
    selectedVideoObject = nil;
    if (indexPath.section == 0) {
        selectedVideoObject = [videosArray objectAtIndex:indexPath.row];
    }
    
}

- (void) getChannelInfo: (int) channelIndex {
    NSString *urlString = [NSString stringWithFormat:API_URL, [desiredChannelsArray objectAtIndex:channelIndex], API_KEY];
    NSURL *url = [NSURL URLWithString:urlString];
    [self performGetDataForUrl:url RequestWithCompletitionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSDictionary *result = [NSJSONSerialization
                                JSONObjectWithData:data
                                options:NSJSONReadingMutableLeaves
                                error:nil];
        NSLog(@"%@", result);
    }];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSLog(@"123");
}


@end
