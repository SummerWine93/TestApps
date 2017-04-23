//
//  WebApiController.h
//  SwissPlanner
//
//  Created by Anastasiya Yarovenko on 08.04.17.
//  Copyright © 2017 Elena Boychuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WebApiController : NSObject

typedef enum {
    video = 0,            
    audio,
    image,
    category
} RequestType;

- (void) makeApiRequest: (RequestType) requestType
  withOptionsDictionary: (NSArray *) options
                success:(void (^)(NSArray* data))successBlock
                  error:(void (^)(NSError *error))errorBlock;


- (void) getCategoriesWithSuccess:(void (^)(NSArray* data))successBlock
                            error:(void (^)(NSError *error))errorBlock;

- (void) getVideosWithSuccess:(void (^)(NSArray* data))successBlock
                        error:(void (^)(NSError *error))errorBlock;

- (void) getAudiosWithSuccess:(void (^)(NSArray* data))successBlock
                        error:(void (^)(NSError *error))errorBlock;


- (void) getYoutubeVideoWithId: (NSString *) videoId cess:(void (^)(NSDictionary* data))successBlock
                         error:(void (^)(NSError *error))errorBlock;

@end
