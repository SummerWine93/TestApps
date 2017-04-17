//
//  WebApiController.m
//  SwissPlanner
//
//  Created by Anastasiya Yarovenko on 08.04.17.
//  Copyright © 2017 Elena Boychuk. All rights reserved.
//

#import "WebApiController.h"
#import "LanguageHelper.h"

#define API_KEY @"AIzaSyAgObxW8y-qhSFHraYHVAaou6YplTTrKHo"
// https://www.googleapis.com/youtube/v3/videos?id=VIDEO_ID&key=YOUR_API_KEY"
#define API_YOUTUBE_ADDRESS @"https://www.googleapis.com/youtube/v3/videos?id=%@&key=AIzaSyAgObxW8y-qhSFHraYHVAaou6YplTTrKHo&part=snippet,contentDetails,statistics,status"

// http://elenaboychuk.com/getter/тип/язык?параметр=значение
#define API_BASE_ADDRESS "http://elenaboychuk.com/getter/%@/%@"

@implementation WebApiController

+ (NSString *) stringWithRequestType: (RequestType) type {
    NSArray *arr = @[
                     @"video",
                     @"audio",
                     @"image",
                     @"category"
                     ];
    return (NSString *)[arr objectAtIndex:type];
}

- (void) getVideosWithSuccess:(void (^)(NSArray* data))successBlock
                    error:(void (^)(NSError *error))errorBlock {
    [self makeApiRequest:video withOptionsDictionary:NULL success:^(NSArray* data) {
        successBlock(data);
    } error:^(NSError *error) {
        errorBlock(error);
    }];
}

- (void) getCategoriesWithSuccess:(void (^)(NSArray* data))successBlock
                        error:(void (^)(NSError *error))errorBlock {
    [self makeApiRequest:category withOptionsDictionary:NULL success:^(NSArray* data) {
        successBlock(data);
    } error:^(NSError *error) {
        errorBlock(error);
    }];
}

- (void) getYoutubeVideoWithId: (NSString *) videoId cess:(void (^)(NSDictionary * data))successBlock
                         error:(void (^)(NSError *error))errorBlock {
    
    NSString *requestAddress = [NSString stringWithFormat:API_YOUTUBE_ADDRESS, videoId];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:requestAddress]];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response,
                                               NSData *data, NSError *connectionError)
     {
         if (data.length > 0 && connectionError == nil)
         {
             NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:data
                                                                       options:0
                                                                         error:NULL];
             successBlock([[[dataDictionary objectForKey:@"items"] objectAtIndex:0] objectForKey:@"snippet"]);
         } else {
             errorBlock(connectionError);
         }
    }];
    
}

- (void) makeApiRequest: (RequestType) requestType
  withOptionsDictionary: (NSDictionary *) options
                success:(void (^)(NSArray* data))successBlock
                  error:(void (^)(NSError *error))errorBlock {
    LanguageHelper *helper = [[LanguageHelper alloc] init];
    NSString *currentLanguage = [helper getCurrentLanguage];
    NSString *requestAddress = [NSString stringWithFormat:@API_BASE_ADDRESS, [WebApiController stringWithRequestType:requestType], currentLanguage];
    
    //NSURL *url = [NSURL URLWithString:@"http://rest-service.guides.spring.io/greeting"];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:requestAddress]];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response,
                                               NSData *data, NSError *connectionError)
     {
         if (data.length > 0 && connectionError == nil)
         {
             NSArray *dataDictionary = [NSJSONSerialization JSONObjectWithData:data
                                                                      options:0
                                                                        error:NULL];
             successBlock(dataDictionary);
             //NSLog(@"Hurraw");
         } else {
             //NSLog(@"Error");
             errorBlock(connectionError);
         }
     }];
}

@end
