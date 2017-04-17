//
//  AppDelegate.m
//  SwissPlanner
//
//  Created by User on 4/10/16.
//  Copyright © 2016 Elena Boychuk. All rights reserved.
//

#import "AppDelegate.h"
#import "LanguageHelper.h"
#import "WebApiController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

	[NSThread sleepForTimeInterval:3.0];
	[self.window setTintColor:[UIColor whiteColor]];
	
	[[UIView appearanceWhenContainedIn:[UIAlertController class], nil] setTintColor:[UIColor blackColor]];
    
    UIPageControl *pageControl = [UIPageControl appearance];
    pageControl.pageIndicatorTintColor = [UIColor whiteColor];
    pageControl.currentPageIndicatorTintColor = [UIColor lightGrayColor];
    
    LanguageHelper *helper = [[LanguageHelper alloc] init];
	//[helper setCurrentLanguage:language];
    NSLog(@"%@", [helper getCurrentLanguage]);
    
    //[[[WebApiController alloc] init] makeApiRequest:@"" withOptionsDictionary:NULL success:NULL error:NULL];

	return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
}

- (void)applicationWillTerminate:(UIApplication *)application {
}

@end
