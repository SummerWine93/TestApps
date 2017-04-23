//
//  VideoViewController.h
//  SwissPlanner
//
//  Created by Anastasiya Yarovenko on 27.01.17.
//  Copyright © 2017 Elena Boychuk. All rights reserved.
//

#import <UIKit/UIKit.h>
@import AVFoundation;
@import AVKit;
#import "YTPlayerView.h"

@interface VideoViewController : UIViewController

@property (strong, nonatomic) NSDictionary *videoDataObject;
@property(nonatomic, strong) IBOutlet YTPlayerView *playerView;

- (void) presentVideo;

@end
