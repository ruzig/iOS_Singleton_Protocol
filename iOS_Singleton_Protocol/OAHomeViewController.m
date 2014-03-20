//
//  OAHomeViewController.m
//  iOS_Singleton_Protocol
//
//  Created by Phat, Le Tan on 3/20/14.
//  Copyright (c) 2014 75Lab. All rights reserved.
//

#import "OAHomeViewController.h"
#import "OAGalleryFlowLayout.h"

@interface OAHomeViewController ()

@end

@implementation OAHomeViewController

- (id)init
{
     OAGalleryFlowLayout *flowLayout = [[OAGalleryFlowLayout alloc] init];
    
    self = [self initWithCollectionViewLayout:flowLayout];
    if (!self) return nil;

    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Gallery";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
