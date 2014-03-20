//
//  OAPhotoProtocol.h
//  iOS_Singleton_Protocol
//
//  Created by Phat, Le Tan on 3/20/14.
//  Copyright (c) 2014 75Lab. All rights reserved.
//

typedef void(^SuccessBlock) (NSArray *photos);
typedef void(^FailureBlock) (NSError *error);

@protocol OAPhotoProtocol <NSObject>

- (void)pullPhotoSuccess:(SuccessBlock)success
                      failure:(FailureBlock)failure;

@end
