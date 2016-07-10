//
//  FontsHelper.m
//  SwissPlanner
//
//  Created by Anastasiya Yarovenko on 11.07.16.
//  Copyright © 2016 Elena Boychuk. All rights reserved.
//

#import "FontsHelper.h"
#import "PlatformTypeChecker.h"

@implementation FontsHelper

+ (NSInteger) getFontSize {
    NSString *platform = [PlatformTypeChecker platformType];
    if ([platform isEqualToString:@"iPhone 6"]||[platform isEqualToString:@"iPhone 6S"]||[platform isEqualToString:@"iPhone 6 Plus"]||[platform isEqualToString:@"iPhone 6S Plus"]) {
        return 16;
    } else if ([platform isEqualToString:@"iPhone 4"]||[platform isEqualToString:@"iPhone 4S"]||[platform isEqualToString:@"Simulator"]){
        return 15;
    } else if ([platform containsString:@"iPad"]){
        return 19;
    }
    else {
        return 15;
    }
}

@end
