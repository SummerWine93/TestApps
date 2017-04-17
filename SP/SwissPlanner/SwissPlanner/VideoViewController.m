//
//  VideoViewController.m
//  SwissPlanner
//
//  Created by Anastasiya Yarovenko on 27.01.17.
//  Copyright © 2017 Elena Boychuk. All rights reserved.
//

#import "VideoViewController.h"

@interface VideoViewController ()

@end

// AIzaSyAgObxW8y-qhSFHraYHVAaou6YplTTrKHo

@implementation VideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //[self presentVideo];
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
