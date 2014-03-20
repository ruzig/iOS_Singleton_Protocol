//
//  OAPhotoCell.m
//  iOS_Singleton_Protocol
//
//  Created by Phat, Le Tan on 3/20/14.
//  Copyright (c) 2014 75Lab. All rights reserved.
//

#import "OAPhotoCell.h"
#import <UIImageView+WebCache.h>

@interface OAPhotoCell()

@property (strong, nonatomic) UIImageView *photoView;

@end

@implementation OAPhotoCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _photoView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 145, 145)];
        [_photoView clipsToBounds];
        _photoView.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:_photoView];
    }
    return self;
}

- (void)setImage:(NSString *)image_url
{
    [self.photoView setImageWithURL:[NSURL URLWithString:image_url]];
}

@end
