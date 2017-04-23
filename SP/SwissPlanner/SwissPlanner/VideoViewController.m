//
//  VideoViewController.m
//  SwissPlanner
//
//  Created by Anastasiya Yarovenko on 27.01.17.
//  Copyright © 2017 Elena Boychuk. All rights reserved.
//

#import "VideoViewController.h"
#import "PlatformTypeChecker.h"

@interface VideoViewController ()

@end

// AIzaSyAgObxW8y-qhSFHraYHVAaou6YplTTrKHo

@implementation VideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSDictionary *playerVars = @{
                                 @"playsinline" : @1,
                                 };
    [self.playerView loadWithVideoId:[self.videoDataObject objectForKey:@"youtube_id"] playerVars:playerVars];
    // Do any additional setup after loading the view.
    //[self presentVideo];
    [self updateViewBackground];
}

- (void) updateViewBackground {
    NSString *platform = [PlatformTypeChecker platformType];
    NSString *navBarImageName, *backImageName;
    if ([platform isEqualToString:@"iPhone 6"]||[platform isEqualToString:@"iPhone 6S"]) {
        navBarImageName = @"nav_bar_iphone6";
        backImageName = @"background(gifts)_iphone6";
    }
    else if ([platform containsString:@"iPad"]||[platform isEqualToString:@"Simulator"]){
        navBarImageName = @"nav_bar";
        backImageName = @"background(gifts)";
    }
    else {
        navBarImageName = @"nav_bar";
        backImageName = @"background(gifts)";
    }
    UIImage *stretchableBackground = [[UIImage imageNamed:navBarImageName] resizableImageWithCapInsets:UIEdgeInsetsMake(0,0,self.navigationController.view.frame.size.height,self.navigationController.view.frame.size.width) resizingMode:UIImageResizingModeStretch];
    [self.navigationController.navigationBar setBackgroundImage:stretchableBackground forBarMetrics:UIBarMetricsDefault];
    self.view.layer.contents = (id)[UIImage imageNamed:backImageName].CGImage;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) presentVideo {
    //NSURL *videoURL = [[NSBundle mainBundle]URLForResource:@"video" withExtension:@"mp4"];
    NSURL *videoURL = [NSURL URLWithString:@"https://www.youtube.com/watch?v=1ufoJ5wBNU8"];
    
    // create an AVPlayer
    AVPlayer *player = [AVPlayer playerWithURL:videoURL];
    
    // create a player view controller
    AVPlayerViewController *controller = [[AVPlayerViewController alloc]init];
    controller.player = player;
    [player play];
    
    // show the view controller
    [self addChildViewController:controller];
    [self.view addSubview:controller.view];
    controller.view.frame = self.view.frame;
    
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
