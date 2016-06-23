//
//  AppDelegate.m
//  SwissPlanner
//
//  Created by User on 4/10/16.
//  Copyright © 2016 Elena Boychuk. All rights reserved.
//

#import "AppDelegate.h"
#import "LanguageHelper.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

	[NSThread sleepForTimeInterval:3.0];
	[self.window setTintColor:[UIColor whiteColor]];
	
	[[UIView appearanceWhenContainedIn:[UIAlertController class], nil] setTintColor:[UIColor blackColor]];
    
    LanguageHelper *helper = [[LanguageHelper alloc] init];
	//[helper setCurrentLanguage:language];
    NSLog(@"%@", [helper getCurrentLanguage]);

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
