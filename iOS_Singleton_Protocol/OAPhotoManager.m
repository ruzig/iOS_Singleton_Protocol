//
//  OAPhotoManager.m
//  iOS_Singleton_Protocol
//
//  Created by Phat, Le Tan on 3/20/14.
//  Copyright (c) 2014 75Lab. All rights reserved.
//

#import "OAPhotoManager.h"

static NSString *const urlString = @"https://api.500px.com/v1/photos?feature=popular";
static NSString *const consumerKey = @"DC2To2BS0ic1ChKDK15d44M42YHf9gbUJgdFoF0m";
static NSString *const consumerSecret = @"i8WL4chWoZ4kw9fh3jzHK7XzTer1y5tUNvsTFNnB";

@interface OAPhotoManager()
@end

@implementation OAPhotoManager

+ (instancetype)sharedInstance
{
    static OAPhotoManager *sharedInstance;
    if (!sharedInstance) {
        sharedInstance = [[OAPhotoManager alloc] init];
    }
    return sharedInstance;
}

+ (void)photoFrom500pxSuccess:(void (^)(NSArray *photos))success
                      failure:(void (^)(NSError *error))failure
{
    [[self sharedInstance] photoFrom500pxSuccess:success failure:failure];
}

- (NSURLRequest *)requestForPopularPhoto
{
    NSString *fullUrl = [NSString stringWithFormat:@"%@&&consumer_key=%@&&consumer_secret=%@", urlString, consumerKey, consumerSecret];
    NSURL *url = [NSURL URLWithString:fullUrl];
    return [NSURLRequest requestWithURL:url];
}

- (void)photoFrom500pxSuccess:(void (^)(NSArray *photos))success
                      failure:(void (^)(NSError *error))failure
{
    NSURLRequest *request = [self requestForPopularPhoto];

    // 2
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];

    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {

        // 3
        NSDictionary *respond = (NSDictionary *)responseObject;
        success(respond[@"photos"]);

    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(error);
    }];

    [operation start];
}
@end
