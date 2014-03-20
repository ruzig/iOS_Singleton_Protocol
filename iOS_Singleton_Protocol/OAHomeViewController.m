//
//  OAHomeViewController.m
//  iOS_Singleton_Protocol
//
//  Created by Phat, Le Tan on 3/20/14.
//  Copyright (c) 2014 75Lab. All rights reserved.
//

#import "OAHomeViewController.h"
#import "OAGalleryFlowLayout.h"
#import "OAPhotoManager.h"
#import "OAPhotoCell.h"
#import "OAPhotoProtocol.h"
#import "OAPhoto500pxClientImp.h"

static NSString *const CellIdentifier = @"Cell";

@interface OAHomeViewController ()

@property (strong, nonatomic) NSArray *photos;
@property (strong, nonatomic) id<OAPhotoProtocol> photo500pxClient;

@end

@implementation OAHomeViewController

- (id)init
{
     OAGalleryFlowLayout *flowLayout = [[OAGalleryFlowLayout alloc] init];
    
    self = [self initWithCollectionViewLayout:flowLayout];
    if (!self) return nil;

    _photo500pxClient = [[OAPhoto500pxClientImp alloc] init];

    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.photos = @[];
    self.title = @"Gallery";
    self.collectionView.delegate = self;
    [self.collectionView registerClass:[OAPhotoCell class] forCellWithReuseIdentifier:CellIdentifier];
    //-----Use Singleton--------------
//    [OAPhotoManager photoFrom500pxSuccess:^(NSArray *photos) {
//        self.photos = photos;
//        [self.collectionView reloadData];
//    } failure:^(NSError *error) {
//        NSLog(@"%@", error);
//    }];

    //------Use Protocol--------------
    [_photo500pxClient pullPhotoSuccess:^(NSArray *photos) {
        self.photos = photos;
        [self.collectionView reloadData];
    } failure:^(NSError *error) {
        NSLog(@"%@", error);
    }];
}

#pragma mark - UICollectionViewDataSource Methods

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _photos.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    OAPhotoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    NSString *imageURL = _photos[indexPath.row][@"image_url"];
    [cell setImage:imageURL];
    NSLog(@"%@", imageURL);
    
    return cell;
}
@end
