//
//  CSSCollectionViewController.m
//  CollectionViewSnapSample
//
//  Created by 平屋真吾 on 2015/09/02.
//  Copyright (c) 2015年 平屋真吾. All rights reserved.
//

#import "CSSCollectionViewController.h"
#import "CSSCollectionViewCell.h"

static NSString * const kReuseIdentifier = @"Cell";

@interface CSSCollectionViewController ()

@property (nonatomic) NSArray *dataList;

@end

@implementation CSSCollectionViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self prepare];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section
{
    return self.dataList.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CSSCollectionViewCell *cell =
    (CSSCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:kReuseIdentifier
                                                                       forIndexPath:indexPath];
    
    cell.label.text = [NSString stringWithFormat:@"No.%zd", indexPath.item + 1];
    
    NSUInteger colorCode = [self.dataList[indexPath.item] integerValue];
    cell.backgroundColor = [self colorWithRGBHex:colorCode];
    
    return cell;
}

#pragma mark - Private

- (void)prepare
{
    self.collectionView.pagingEnabled = NO;
    self.collectionView.decelerationRate = UIScrollViewDecelerationRateFast;
    
    self.dataList = @[
                      @0xf39c12,
                      @0x1abc9c,
                      @0x2980b9,
                      @0xf1c40f,
                      @0x3498db,
                      @0x9b59b6,
                      @0xe74c3c,
                      @0xe67e22,
                      @0x2ecc71,
                      @0x34495e,
                      
                      ];
}

- (UIColor *)colorWithRGBHex:(NSUInteger)hex
{
    return [UIColor colorWithRed:((hex & 0xFF0000) >> 16) / 255.0f
                           green:((hex & 0x00FF00) >>  8) / 255.0f
                            blue:((hex & 0x0000FF) >>  0) / 255.0f
                           alpha:1.0f];
}

@end
