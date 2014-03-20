//
//  OAPhotoManager.h
//  iOS_Singleton_Protocol
//
//  Created by Phat, Le Tan on 3/20/14.
//  Copyright (c) 2014 75Lab. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OAPhotoManager : NSObject

+ (void)photoFrom500pxSuccess:(void (^)(NSArray *photos))success
                      failure:(void (^)(NSError *error))failure;

@end

