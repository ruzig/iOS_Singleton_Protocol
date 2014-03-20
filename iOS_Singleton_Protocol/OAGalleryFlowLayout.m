//
//  OAGalleryFlowLayout.m
//  iOS_Singleton_Protocol
//
//  Created by Phat, Le Tan on 3/20/14.
//  Copyright (c) 2014 75Lab. All rights reserved.
//

#import "OAGalleryFlowLayout.h"

@implementation OAGalleryFlowLayout

-(instancetype)init {
    if (!(self = [super init])) return nil;
    
    self.itemSize = CGSizeMake(145, 145);
    self.minimumInteritemSpacing = 10;
    self.minimumLineSpacing = 10;
    self.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    
    return self;
}

@end
