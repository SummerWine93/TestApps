//
//  LanguageHelper.m
//  SwissPlanner
//
//  Created by Anastasiya Yarovenko on 13.06.16.
//  Copyright © 2016 Elena Baoychuk. All rights reserved.
//

#import "LanguageHelper.h"

@implementation LanguageHelper {
    NSArray *languagesAvailable;
    NSArray *languagesNamesAvailable;
}

- (id) init {
    if (self == nil) {
        self = [super init];
    }
    
    languagesAvailable = [NSArray arrayWithObjects:@"en", @"es", nil];
    languagesNamesAvailable = [NSArray arrayWithObjects:@"English", @"Español", nil];
   
    return self;
}


- (NSArray *) getAllTheLanguages{
    return languagesAvailable;
}

- (NSArray *) getAllTheLanguagesNames{
    return languagesNamesAvailable;
}

- (NSString *) getCurrentLanguage{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *currentLanguage = [defaults objectForKey:@"appLanguage"];
    
    if (!currentLanguage) {
        NSString * systemLanguage = [[[NSLocale preferredLanguages] objectAtIndex:0] substringToIndex:2];
        [self setCurrentLanguage:systemLanguage];
        return [self getCurrentLanguage];
    }
    
    return currentLanguage;
}

- (void) setCurrentLanguage: (NSString *) newLanguage {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([languagesAvailable containsObject:newLanguage]) {
        [defaults setObject:newLanguage forKey:@"appLanguage"];
		[defaults setObject:[NSArray arrayWithObjects:newLanguage, nil] forKey:@"AppleLanguages"];
		
    } else {
        [defaults setObject:[languagesAvailable objectAtIndex:0] forKey:@"appLanguage"];
		[defaults setObject:[NSArray arrayWithObjects:[languagesAvailable objectAtIndex:0], nil] forKey:@"AppleLanguages"];
    }
}

@end
